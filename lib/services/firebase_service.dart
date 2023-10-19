import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mixcosechas_app/model/clientes.dart';
import 'package:mixcosechas_app/model/pruebaSistemaFoliar.dart';
import 'package:mixcosechas_app/model/pruebaSuelo.dart';

import '../model/predios.dart';
import '../model/pruebaAgua.dart';

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

  Future <List<PruebaSuelo>> getPruebaSuelo() async {

    List<PruebaSuelo> pruebaSuelo = [];

    try {
      QuerySnapshot queryPruebaSuelo = await  db.collection('PruebaSuelo').get();

      queryPruebaSuelo.docs.forEach((documento) {
        Map<String, dynamic> data = documento.data() as Map<String, dynamic>;
        pruebaSuelo.add(PruebaSuelo.fromMap(data));
      });
    } catch (e){
      print("Error al obtener la lista de Pruebas de Suelo: $e");
    }
    return pruebaSuelo;
  }

  Future <List<PruebaAgua>> getPruebaAgua() async {

    List<PruebaAgua> pruebaAgua = [];

    try {
      QuerySnapshot queryPruebaAgua = await  db.collection('PruebaAgua').get();

      queryPruebaAgua.docs.forEach((documento) {
        Map<String, dynamic> data = documento.data() as Map<String, dynamic>;
        pruebaAgua.add(PruebaAgua.fromMap(data));
      });
    } catch (e){
      print("Error al obtener la lista de Pruebas de Suelo: $e");
    }
    return pruebaAgua;
  }

  Future <List<PruebaSistemaFoliar>> getPruebaSistemaFoliar() async {

    List<PruebaSistemaFoliar> pruebaSistemaFoliar = [];

    try {
      QuerySnapshot queryPruebaAgua = await  db.collection('PruebaSistemaFoliar').get();

      queryPruebaAgua.docs.forEach((documento) {
        Map<String, dynamic> data = documento.data() as Map<String, dynamic>;
        pruebaSistemaFoliar.add(PruebaSistemaFoliar.fromMap(data));
      });
    } catch (e){
      print("Error al obtener la lista de Pruebas de Suelo: $e");
    }
    return pruebaSistemaFoliar;
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
  

Future<List<Predio>> getPrediosPorPropietario(String idPropietario) async {
  List<Predio> predios = [];

  try {
    QuerySnapshot queryPredios = await db
        .collection('Predios')
        .where('IdPropietario', isEqualTo: idPropietario)
        .get();
    predios = queryPredios.docs.map((doc) => Predio.fromMap(doc.data() as Map<String, dynamic>)).toList();
  } catch (e) {
    print("Error al obtener la lista de predios: $e");
  }

  return predios;
}



  Future<void> addPruebaSuelo (PruebaSuelo pruebaSuelo) async {
    try {
      await db.collection('PruebaSuelo').add({
        
        
        'NombrePredio': pruebaSuelo.nombrePredio,
        'Corregimiento': pruebaSuelo.corregimientoPredio,
        'Cultivo': pruebaSuelo.cultivoPredio,
        'Municipio': pruebaSuelo.municipioPredio,
        'Variedad': pruebaSuelo.variedadPredio,
        'Departamento': pruebaSuelo.dptoPredio,
        'Edad': pruebaSuelo.edadPredio,
        'NombrePropietario': pruebaSuelo.nombrepropietario,
        'Telefono': pruebaSuelo.telefonopropietario,
        'Correo': pruebaSuelo.correopropietario,

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
        'Azufre - S':[
          {
            'valor': pruebaSuelo.S,
            'interpretacion': pruebaSuelo.S_Interpretacion,
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
        'Hierro Férrico - Fe':[
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
        'Sodio - Na':[
          {
            'valor': pruebaSuelo.Na,
            'interpretacion': pruebaSuelo.Na_Interpretacion,
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
            'interpretacion':  pruebaSuelo.C_E_Interpretacion,
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
        'Arcilla': pruebaSuelo.arcilla,
        'Limo': pruebaSuelo.limo,
        'Arena':pruebaSuelo.arena,
        'Humus':[
          {
            'valor': pruebaSuelo.humus,
            'interpretacion': pruebaSuelo.humus_Interpretacion,
          }
        ],
        'Textura':pruebaSuelo.textura

        }
      );

    } catch (e){
      print("Error al agregar la prueba: $e");
    }
  }

  Future<void> addPruebaAgua (PruebaAgua pruebaAgua) async {
    try {
      await db.collection('PruebaAgua').add({
        
        
        'NombrePredio': pruebaAgua.nombrePredio,
        'Corregimiento': pruebaAgua.corregimientoPredio,
        'Cultivo': pruebaAgua.cultivoPredio,
        'Municipio': pruebaAgua.municipioPredio,
        'Variedad': pruebaAgua.variedadPredio,
        'Departamento': pruebaAgua.dptoPredio,
        'Edad': pruebaAgua.edadPredio,
        'Nombrepropietario': pruebaAgua.nombrepropietario,
        'Telefono': pruebaAgua.telefonopropietario,
        'Correo': pruebaAgua.correopropietario,

        // 'Nitrato de Nitrógeno - N': [
        //   {
        //     'valor': pruebaAgua.N,
        //     'interpretacion': pruebaAgua.N_Interpretacion,
        //   }
        // ],
        'Nitrógeno amoniacal - NH4+':[
          {
            'valor': pruebaAgua.NH4,
            'interpretacion': pruebaAgua.NH4_Interpretacion,
          }
        ],
        'Nitritos - NO2-':[
          {
            'valor': pruebaAgua.NO2,
            'interpretacion': pruebaAgua.NO2_Interpretacion,
          }
        ],
        'Nitratos - NO3-':[
          {
            'valor': pruebaAgua.NO3,
            'interpretacion': pruebaAgua.NO3_Interpretacion,
          }
        ],
        'Fósforo - P':[
          {
            'valor': pruebaAgua.P,
            'interpretacion': pruebaAgua.P_Interpretacion,
          }
        ],
        'Potasio - K':[
          {
            'valor': pruebaAgua.K,
            'interpretacion': pruebaAgua.K_Interpretacion,
          }
        ],
        'Calcio - Ca':[
          {
            'valor': pruebaAgua.Ca,
            'interpretacion': pruebaAgua.Ca_Interpretacion,
          }
        ],
        'Magnesio - Mg':[
          {
            'valor': pruebaAgua.Mg,
            'interpretacion': pruebaAgua.Mg_Interpretacion,
          }
        ],
        'Sulfato - SO4':[
          {
            'valor': pruebaAgua.SO4,
            'interpretacion': pruebaAgua.SO4_Interpretacion,
          }
        ],
        'Hierro Férrico - Fe ':[
          {
            'valor': pruebaAgua.Fe,
            'interpretacion': pruebaAgua.Fe_Interpretacion,
          }
        ],
        'Manganeso - Mn':[
          {
            'valor': pruebaAgua.Mn,
            'interpretacion': pruebaAgua.Mn_Interpretacion,
          }
        ],
        'Cobre - Cu':[
          {
            'valor': pruebaAgua.Cu,
            'interpretacion': pruebaAgua.Cu_Interpretacion,
          }
        ],
        'Cloruro - Cl':[
          {
            'valor': pruebaAgua.Cl,
            'interpretacion': pruebaAgua.Cl_Interpretacion,
          }
        ],
        'Ph':[
          {
            'valor': pruebaAgua.Ph,
            'interpretacion': pruebaAgua.Ph_Interpretacion,
          }
        ],
        'C.E':[
          {
            'valor': pruebaAgua.C_E,
            'interpretacion':  pruebaAgua.C_E_Interpretacion,
          }
        ],
        'Sales Disueltas':[
          {
            'valor': pruebaAgua.salesDisueltas,
            'interpretacion': pruebaAgua.salesDisueltas_Interpretacion,
          }
        ],
        // 'C.I.C.E':[
        //   {
        //     'valor': 65,//pruebaSuelo.CICE,
        //     'interpretacion': 'Por definir' //pruebaSuelo.CICE_Interpretacion,
        //   }
        // ],
        // 'Ca/Mg':[
        //   {
        //     'valor': pruebaAgua.CaMg,
        //     'interpretacion': pruebaAgua.CaMg_Interpretacion,
        //   }
        // ],
        'Tipo de Agua':pruebaAgua.tipoAgua

      }
    );

    } catch (e){
      print("Error al agregar la prueba: $e");
    }
  }

  Future<void> addPruebaSistemaFoliar (PruebaSistemaFoliar pruebaSistemaFoliar) async {
    try {
      await db.collection('PruebaSistemaFoliar').add({
         
        'NombrePredio': pruebaSistemaFoliar.nombrePredio,
        'Corregimiento': pruebaSistemaFoliar.corregimientoPredio,
        'Cultivo': pruebaSistemaFoliar.cultivoPredio,
        'Municipio': pruebaSistemaFoliar.municipioPredio,
        'Variedad': pruebaSistemaFoliar.variedadPredio,
        'Departamento': pruebaSistemaFoliar.dptoPredio,
        'Edad': pruebaSistemaFoliar.edadPredio,
        'Nombrepropietario': pruebaSistemaFoliar.nombrepropietario,
        'Telefono': pruebaSistemaFoliar.telefonopropietario,
        'Correo': pruebaSistemaFoliar.correopropietario,

        'Calcio - Ca':pruebaSistemaFoliar.Ca,
        'Magnesio - Mg':pruebaSistemaFoliar.Mg,
        'Sodio - Na':pruebaSistemaFoliar.Na,
        'Potasio - K':pruebaSistemaFoliar.K,
        'Nitrógeno - N': pruebaSistemaFoliar.N,
        'Fósforo - P':pruebaSistemaFoliar.P,
        'Hierro Férrico - Fe':pruebaSistemaFoliar.Fe,
        'Cobre - Cu':pruebaSistemaFoliar.Cu,
        'Zinc - Zn':pruebaSistemaFoliar.Zn,
        'Manganeso - Mn':pruebaSistemaFoliar.Mn,
        'Boro - B':pruebaSistemaFoliar.B,

      }
    );

    } catch (e){
      print("Error al agregar la prueba: $e");
    }
  }

}




