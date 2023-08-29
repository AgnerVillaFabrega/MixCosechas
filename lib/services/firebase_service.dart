import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mixcosechas_app/model/clientes.dart';

import '../model/predios.dart';

class ServiceFirebase {
  FirebaseFirestore db = FirebaseFirestore.instance;

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
        "IdUsuario":predio.idUsuario,
        "Nombre":predio.nombre,
        "CorregimientoVereda":predio.corregimientoVereda,
        "Departamento":predio.departamento,
        "Municipio":predio.municipio,
        "Cultivo":predio.cultivo,
        "variedad":predio.variedad,
        "edad":predio.edad
        }
      );
    } catch (e){
      print("Error al agregar el cultivo: $e");
    }


  }


}

