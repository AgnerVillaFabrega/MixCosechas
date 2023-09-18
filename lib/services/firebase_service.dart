import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mixcosechas_app/model/clientes.dart';
//import 'package:mixcosechas_app/model/pruebaSuelo.dart';

import '../model/predios.dart';

class ServiceFirebase {
  
  FirebaseFirestore db = FirebaseFirestore.instance;

  Future<bool> isIDUnique(String id) async {
    QuerySnapshot query = await FirebaseFirestore.instance.collection('predios').where('id', isEqualTo: id).get();
    return query.docs.isEmpty;
  }

  Future<List<Cliente>> getPeople() async {
    
    List<Cliente> clientes = [];

    try {
      QuerySnapshot queryclientes = await  db.collection('Usuarios').get();

      queryclientes.docs.forEach((documento) {
        Map<String, dynamic> data = documento.data() as Map<String, dynamic>;
        clientes.add(Cliente.fromMap(data));
      });
    } catch (e){
      print("Error al obtener la lista de clientes: $e");
    }
    return clientes;
  }

  Future<Cliente?> consultarClientePorId(String clienteId) async {
  try {
    List<Cliente> tempClientes = await getPeople(); // Supongo que esta función existe y devuelve una lista de Clientes
    Cliente? clienteEncontrado;
    // Busca el cliente por su ID en la lista
    if (tempClientes.isNotEmpty) {
      clienteEncontrado = tempClientes.firstWhere(
        (cliente) => cliente.id == clienteId
      );
    }

    if (clienteEncontrado != null) {
      return clienteEncontrado; // Retorna el cliente si se encuentra por su ID.
    } else {
      return null; // Retorna null si no se encuentra el cliente con ese ID.
    }
  } catch (e) {
    print("Error al consultar el cliente por ID: $e");
    return null;
  }
}

  Future<void> addPeople (Cliente cliente,UserCredential userCredential) async {
    try {
      await db.collection('Usuarios').doc(userCredential.user!.uid).set({
        "Id":cliente.id,
        "Nombre":cliente.nombre,
        "Telefono":cliente.telefono,
        "Correo":cliente.correo,
        "Rol":cliente.rol,
        "Password":cliente.password
        }
      );
    } catch (e){
      print("Error al agregar el cliente: $e");
    }
  }

  Future<void> addPredio (Predio predio) async {
    try {
      await db.collection('Predios').add({
        "Id":predio.id,
        "IdPropietario":predio.idPropietario,
        "NombrePropietario":predio.nombrePropietario,
        "CorreoPropietario":predio.correoPropietario,
        "TelefonoPropietario":predio.telefonoPropietario,
        "Nombre":predio.nombre,
        "CorregimientoVereda":predio.corregimientoVereda,
        "Departamento":predio.departamento,
        "Municipio":predio.municipio,
        "Cultivo":predio.cultivo,
        "Variedad":predio.variedad,
        "Edad":predio.edad
        }
      );
    } catch (e){
      print("Error al agregar el cultivo: $e");
    }
  }

  // Future<void> addPruebaSuelo (PruebaSuelo pruebaSuelo) async {
  //   try {
  //     await db.collection('Predios').add({
  //       "Id":predio.id,
  //       "IdPropietario":predio.idPropietario,
  //       "NombrePropietario":predio.nombrePropietario,
  //       "CorreoPropietario":predio.correoPropietario,
  //       "TelefonoPropietario":predio.telefonoPropietario,
  //       "Nombre":predio.nombre,
  //       "CorregimientoVereda":predio.corregimientoVereda,
  //       "Departamento":predio.departamento,
  //       "Municipio":predio.municipio,
  //       "Cultivo":predio.cultivo,
  //       "Variedad":predio.variedad,
  //       "Edad":predio.edad
  //       }
  //     );

  //     await sueloCollection.add({
  //       'Nitrogeno': [
  //         {
  //           'valor': valor,
  //           'categoria': categoria,
  //         }
  //       ]
  //     });
  //   } catch (e){
  //     print("Error al agregar el cultivo: $e");
  //   }
  // }

  

  

}



