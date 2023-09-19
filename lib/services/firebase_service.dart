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

  Future<void> addPruebaSuelo (PruebaSuelo pruebaSuelo) async {
    try {
      await db.collection('PruebaSuelo').add({
        'Nitrato de Nitrógeno - N': [
          {
            'valor': pruebaSuelo.N,
            'interpretacion': pruebaSuelo.N_Interpretacion,
          }
        ],
        'Nitrógeno amoniacal - NH4+':[
          {
            'valor': pruebaSuelo.NH4,
            'interpretacion': pruebaSuelo.NH4_Interpretacion,
          }
        ],
        'Nitritos - NO2-':[
          {
            'valor': pruebaSuelo.NO2,
            'interpretacion': pruebaSuelo.NO2_Interpretacion,
          }
        ],
        'Nitratos - NO3-':[
          {
            'valor': pruebaSuelo.N,
            'interpretacion': pruebaSuelo.NO3_Interpretacion,
          }
        ],
        'Fósforo - P':[
          {
            'valor': pruebaSuelo.P,
            'interpretacion': pruebaSuelo.P_Interpretacion,
          }
        ],
        'Potasio - K':[
          {
            'valor': pruebaSuelo.K,
            'interpretacion': pruebaSuelo.K_Interpretacion,
          }
        ],
        'Calcio - Ca':[
          {
            'valor': pruebaSuelo.Ca,
            'interpretacion': pruebaSuelo.Ca_Interpretacion,
          }
        ],
        'Magnesio - Mg':[
          {
            'valor': pruebaSuelo.Mg,
            'interpretacion': pruebaSuelo.Mg_Interpretacion,
          }
        ],
        'Sulfato - SO4':[
          {
            'valor': pruebaSuelo.SO4,
            'interpretacion': pruebaSuelo.SO4_Interpretacion,
          }
        ],
        'Hierro Férrico - Fe ':[
          {
            'valor': pruebaSuelo.Fe,
            'interpretacion': pruebaSuelo.Fe_Interpretacion,
          }
        ],
        'Manganeso - Mn':[
          {
            'valor': pruebaSuelo.Mn,
            'interpretacion': pruebaSuelo.Mn_Interpretacion,
          }
        ],
        'Cobre - Cu':[
          {
            'valor': pruebaSuelo.Cu,
            'interpretacion': pruebaSuelo.Cu_Interpretacion,
          }
        ],
        'Aluminio - Al':[
          {
            'valor': pruebaSuelo.Al,
            'interpretacion': pruebaSuelo.Al_Interpretacion,
          }
        ],
        'Cloruro - Cl':[
          {
            'valor': pruebaSuelo.Cl,
            'interpretacion': pruebaSuelo.Cl_Interpretacion,
          }
        ],
        'Zinc - Zn':[
          {
            'valor': pruebaSuelo.Zn,
            'interpretacion': pruebaSuelo.Zn_Interpretacion,
          }
        ],
        'Ph':[
          {
            'valor': pruebaSuelo.Ph,
            'interpretacion': pruebaSuelo.Ph_Interpretacion,
          }
        ],
        'C.E':[
          {
            'valor': pruebaSuelo.C_E,
            'interpretacion': pruebaSuelo.C_E_Interpretacion,
          }
        ],
        'Sales Disueltas':[
          {
            'valor': pruebaSuelo.salesDisueltas,
            'interpretacion': pruebaSuelo.salesDisueltas_Interpretacion,
          }
        ],
        'C.I.C.E':[
          {
            'valor': pruebaSuelo.CICE,
            'interpretacion': pruebaSuelo.CICE_Interpretacion,
          }
        ],
        'Ca/Mg':[
          {
            'valor': pruebaSuelo.CaMg,
            'interpretacion': pruebaSuelo.CaMg_Interpretacion,
          }
        ],
        'Ca+Mg/K':[
          {
            'valor': pruebaSuelo.CaMgK,
            'interpretacion': pruebaSuelo.CaMgK_Interpretacion,
          }
        ],
        'Ca/K':[
          {
            'valor': pruebaSuelo.CaK,
            'interpretacion': pruebaSuelo.CaK_Interpretacion,
          }
        ],
        'Mg/K':[
          {
            'valor': pruebaSuelo.MgK,
            'interpretacion': pruebaSuelo.MgK_Interpretacion,
          }
        ],
        'Arcilla':[
          {
            'valor': pruebaSuelo.arcilla,
            'interpretacion': pruebaSuelo.arcilla_Interpretacion,
          }
        ],
        'Limo':[
          {
            'valor': pruebaSuelo.limo,
            'interpretacion': pruebaSuelo.limo_Interpretacion,
          }
        ],
        'Arena':[
          {
            'valor': pruebaSuelo.arena,
            'interpretacion': pruebaSuelo.arena_Interpretacion,
          }
        ],
        'Humus':[
          {
            'valor': pruebaSuelo.humus,
            'interpretacion': pruebaSuelo.humus_Interpretacion,
          }
        ],
        'Textura':[
          {
            'valor': pruebaSuelo.textura,
            'interpretacion': pruebaSuelo.textura_interpretacion,
          }
        ],

        }
      );

    } catch (e){
      print("Error al agregar la prueba: $e");
    }
  }

  

}



