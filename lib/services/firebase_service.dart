// ignore_for_file: avoid_print, avoid_function_literals_in_foreach_calls
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
    QuerySnapshot query = await FirebaseFirestore.instance
        .collection('Predios')
        .where('id', isEqualTo: id)
        .get();
    return query.docs.isEmpty;
  }

  Future<bool> isIDUniquePruebaSuelo(String id) async {
    QuerySnapshot query = await FirebaseFirestore.instance
        .collection('PruebaSuelo')
        .where('id', isEqualTo: id)
        .get();
    return query.docs.isEmpty;
  }

  Future<bool> isIDUniquePruebaAgua(String id) async {
    QuerySnapshot query = await FirebaseFirestore.instance
        .collection('PruebaAgua')
        .where('id', isEqualTo: id)
        .get();
    return query.docs.isEmpty;
  }

  Future<bool> isIDUniquePruebaSistemaFoliar(String id) async {
    QuerySnapshot query = await FirebaseFirestore.instance
        .collection('PruebaAgua')
        .where('id', isEqualTo: id)
        .get();
    return query.docs.isEmpty;
  }

  Future<List<Cliente>> getPeople() async {
    List<Cliente> clientes = [];
    try {
      QuerySnapshot queryclientes = await db.collection('Usuarios').get();
      queryclientes.docs.forEach((documento) {
        Map<String, dynamic> data = documento.data() as Map<String, dynamic>;
        Cliente user = Cliente(
          uid: documento.id,
          id: data['Id'],
          nombre: data['Nombre'],
          telefono: data['Telefono'],
          correo: data['Correo'],
          rol: data['Rol'],
          password: data['Password']
        );
        clientes.add(user);
      });
    } catch (e) {
      print("Error al obtener la lista de clientes: $e");
    }
    return clientes;
  }

  Future<List<PruebaSuelo>> getPruebaSuelo() async {
    List<PruebaSuelo> pruebaSuelo = [];
    try {
      QuerySnapshot queryPruebaSuelo = await db.collection('PruebaSuelo').get();
      queryPruebaSuelo.docs.forEach((documento) {
        Map<String, dynamic> data = documento.data() as Map<String, dynamic>;
        pruebaSuelo.add(PruebaSuelo.fromMap(data));
      });
    } catch (e) {
      print("Error al obtener la lista de Pruebas de Suelo: $e");
    }
    return pruebaSuelo;
  }

  Future<List<PruebaAgua>> getPruebaAgua() async {
    List<PruebaAgua> pruebaAgua = [];
    try {
      QuerySnapshot queryPruebaAgua = await db.collection('PruebaAgua').get();
      queryPruebaAgua.docs.forEach((documento) {
        Map<String, dynamic> data = documento.data() as Map<String, dynamic>;
        pruebaAgua.add(PruebaAgua.fromMap(data));
      });
    } catch (e) {
      print("Error al obtener la lista de Pruebas de Suelo: $e");
    }
    return pruebaAgua;
  }

  Future<List<PruebaSistemaFoliar>> getPruebaSistemaFoliar() async {
    List<PruebaSistemaFoliar> pruebaSistemaFoliar = [];
    try {
      QuerySnapshot queryPruebaAgua =
          await db.collection('PruebaSistemaFoliar').get();
      queryPruebaAgua.docs.forEach((documento) {
        Map<String, dynamic> data = documento.data() as Map<String, dynamic>;
        pruebaSistemaFoliar.add(PruebaSistemaFoliar.fromMap(data));
      });
    } catch (e) {
      print("Error al obtener la lista de Pruebas de Suelo: $e");
    }
    return pruebaSistemaFoliar;
  }

  Future<List<PruebaSuelo>> getPruebaSueloPorPredio(String idPredio) async {
    List<PruebaSuelo> pruebaSuelo = [];
    try {
      QuerySnapshot queryPruebaSuelo = await db
          .collection('PruebaSuelo')
          .where('IdPredio', isEqualTo: idPredio)
          .get();
      queryPruebaSuelo.docs.forEach((documento) {
        Map<String, dynamic> data = documento.data() as Map<String, dynamic>;
        pruebaSuelo.add(PruebaSuelo.fromMap(data));
      });
    } catch (e) {
      print("Error al obtener la lista de Pruebas de Suelo: $e");
    }
    return pruebaSuelo;
  }

  Future<List<PruebaAgua>> getPruebaAguaPorPredio(String idPredio) async {
    List<PruebaAgua> pruebaAgua = [];
    try {
      QuerySnapshot queryPruebaAgua = await db
          .collection('PruebaAgua')
          .where('IdPredio', isEqualTo: idPredio)
          .get();
      queryPruebaAgua.docs.forEach((documento) {
        Map<String, dynamic> data = documento.data() as Map<String, dynamic>;
        pruebaAgua.add(PruebaAgua.fromMap(data));
      });
    } catch (e) {
      print("Error al obtener la lista de Pruebas de Suelo: $e");
    }
    return pruebaAgua;
  }
  
  Future<List<PruebaSistemaFoliar>> getPruebaSistemaFoliarPorPredio(String idPredio) async {
    List<PruebaSistemaFoliar> pruebaSistemaFoliar = [];
    try {
      QuerySnapshot queryPruebaSistemaFoliar = await db
          .collection('PruebaSistemaFoliar')
          .where('IdPredio', isEqualTo: idPredio)
          .get();
      queryPruebaSistemaFoliar.docs.forEach((documento) {
        Map<String, dynamic> data = documento.data() as Map<String, dynamic>;
        pruebaSistemaFoliar.add(PruebaSistemaFoliar.fromMap(data));
      });
    } catch (e) {
      print("Error al obtener la lista de Pruebas de Suelo: $e");
    }
    return pruebaSistemaFoliar;
  }

  Future<Cliente?> consultarClientePorId(String clienteId) async {
    try {
      List<Cliente> tempClientes =
          await getPeople(); // Supongo que esta función existe y devuelve una lista de Clientes
      Cliente? clienteEncontrado;
      // Busca el cliente por su ID en la lista
      if (tempClientes.isNotEmpty) {
        clienteEncontrado =
            tempClientes.firstWhere((cliente) => cliente.id == clienteId);
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


  Future<void> addPeople(Cliente cliente, UserCredential userCredential) async {
    try {
      await db.collection('Usuarios').doc(userCredential.user!.uid).set({
        "Id": cliente.id,
        "Nombre": cliente.nombre,
        "Telefono": cliente.telefono,
        "Correo": cliente.correo,
        "Rol": cliente.rol,
        "Password": cliente.password
      });
    } catch (e) {
      print("Error al agregar el cliente: $e");
    }
  }

  Future<void> addPredio(Predio predio) async {
    try {
      await db.collection('Predios').add({
        "Id": predio.id,
        "IdPropietario": predio.idPropietario,
        "NombrePropietario": predio.nombrePropietario,
        "CorreoPropietario": predio.correoPropietario,
        "TelefonoPropietario": predio.telefonoPropietario,
        "Nombre": predio.nombre,
        "CorregimientoVereda": predio.corregimientoVereda,
        "Departamento": predio.departamento,
        "Municipio": predio.municipio,
        "Latitud": predio.latitud,
        "Longitud": predio.longitud,
        "MSNM": predio.msnm,
        "ProfundidadSB": predio.profundidadSB,
        "Puntos": predio.puntos,
        "Temperatura": predio.temperatura,
        "Lotes": predio.lotes
      });
    } catch (e) {
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
      predios = queryPredios.docs
          .map((doc) => Predio.fromMap(doc.data() as Map<String, dynamic>))
          .toList();

    } catch (e) {
      print("Error al obtener la lista de predios: $e");
    }

    return predios;
  }

  Future<bool> addPruebaSuelo(PruebaSuelo pruebaSuelo) async {
    try {
      await db.collection('PruebaSuelo').add({
        'IdPrueba': pruebaSuelo.idPrueba,
        'IdPredio': pruebaSuelo.idPredio,
        'NombrePredio': pruebaSuelo.nombrePredio,
        'Corregimiento': pruebaSuelo.corregimientoPredio,
        'Municipio': pruebaSuelo.municipioPredio,
        'Departamento': pruebaSuelo.dptoPredio,
        'Latitud': pruebaSuelo.latitud,
        'Longitud': pruebaSuelo.longitud,
        'MSNM': pruebaSuelo.msnm,
        'ProfundidadSB': pruebaSuelo.profundidadSB,
        'Puntos': pruebaSuelo.puntos,
        'Temperatura': pruebaSuelo.temperatura,
        'Lotes': pruebaSuelo.lotes,
        'Cultivo': pruebaSuelo.cultivo,
        'Variedad': pruebaSuelo.variedad,
        'Edad': pruebaSuelo.edad,
        'IdPropietario': pruebaSuelo.idPropietario,
        'NombrePropietario': pruebaSuelo.nombrepropietario,
        'Telefono': pruebaSuelo.telefonoPropietario,
        'Correo': pruebaSuelo.correoPropietario,
        'Lote': pruebaSuelo.lote,
        'FechaTomaMuestra': pruebaSuelo.fechaTomaMuestra,
        'FechaRecibido': pruebaSuelo.fechaRecibido,
        'Fecha': pruebaSuelo.fechaPrueba,
        'Recomendaciones': pruebaSuelo.recomendaciones,
        'Presiembra': pruebaSuelo.presiembra,
        'Siembra': pruebaSuelo.siembra,
        'Mantenimiento': pruebaSuelo.mantenimiento,
        'Nitrato de Nitrógeno - N': [
          {
            'valor': pruebaSuelo.n,
            'interpretacion': pruebaSuelo.nInterpretacion,
          }
        ],
        'Nitrógeno amoniacal - NH4+': [
          {
            'valor': pruebaSuelo.nh4,
            'interpretacion': pruebaSuelo.nh4Interpretacion,
          }
        ],
        'Nitritos - NO2-': [
          {
            'valor': pruebaSuelo.no2,
            'interpretacion': pruebaSuelo.no2Interpretacion,
          }
        ],
        'Nitratos - NO3-': [
          {
            'valor': pruebaSuelo.n,
            'interpretacion': pruebaSuelo.no3Interpretacion,
          }
        ],
        'Fósforo - P': [
          {
            'valor': pruebaSuelo.p,
            'interpretacion': pruebaSuelo.pInterpretacion,
          }
        ],
        'Potasio - K': [
          {
            'valor': pruebaSuelo.k,
            'interpretacion': pruebaSuelo.kInterpretacion,
          }
        ],
        'Calcio - Ca': [
          {
            'valor': pruebaSuelo.ca,
            'interpretacion': pruebaSuelo.caInterpretacion,
          }
        ],
        'Azufre - S': [
          {
            'valor': pruebaSuelo.s,
            'interpretacion': pruebaSuelo.sInterpretacion,
          }
        ],
        'Magnesio - Mg': [
          {
            'valor': pruebaSuelo.mg,
            'interpretacion': pruebaSuelo.mgInterpretacion,
          }
        ],
        'Sulfato - SO4': [
          {
            'valor': pruebaSuelo.so4,
            'interpretacion': pruebaSuelo.so4Interpretacion,
          }
        ],
        'Hierro Férrico - Fe': [
          {
            'valor': pruebaSuelo.fe,
            'interpretacion': pruebaSuelo.feInterpretacion,
          }
        ],
        'Manganeso - Mn': [
          {
            'valor': pruebaSuelo.mn,
            'interpretacion': pruebaSuelo.mnInterpretacion,
          }
        ],
        'Cobre - Cu': [
          {
            'valor': pruebaSuelo.cu,
            'interpretacion': pruebaSuelo.cuInterpretacion,
          }
        ],
        'Aluminio - Al': [
          {
            'valor': pruebaSuelo.al,
            'interpretacion': pruebaSuelo.alInterpretacion,
          }
        ],
        'Cloruro - Cl': [
          {
            'valor': pruebaSuelo.cl,
            'interpretacion': pruebaSuelo.clInterpretacion,
          }
        ],
        'Zinc - Zn': [
          {
            'valor': pruebaSuelo.zn,
            'interpretacion': pruebaSuelo.znInterpretacion,
          }
        ],
        'Sodio - Na': [
          {
            'valor': pruebaSuelo.na,
            'interpretacion': pruebaSuelo.naInterpretacion,
          }
        ],
        'Ph': [
          {
            'valor': pruebaSuelo.ph,
            'interpretacion': pruebaSuelo.phInterpretacion,
          }
        ],
        'C.E': [
          {
            'valor': pruebaSuelo.ce,
            'interpretacion': pruebaSuelo.ceInterpretacion,
          }
        ],
        'Sales Disueltas': [
          {
            'valor': pruebaSuelo.salesDisueltas,
            'interpretacion': pruebaSuelo.salesDisueltasInterpretacion,
          }
        ],
        'C.I.C.E': [
          {
            'valor': pruebaSuelo.cice,
            'interpretacion': pruebaSuelo.ciceInterpretacion,
          }
        ],
        'Ca/Mg': [
          {
            'valor': pruebaSuelo.camg,
            'interpretacion': pruebaSuelo.camgInterpretacion,
          }
        ],
        'Ca+Mg/K': [
          {
            'valor': pruebaSuelo.camgk,
            'interpretacion': pruebaSuelo.camgkInterpretacion,
          }
        ],
        'Ca/K': [
          {
            'valor': pruebaSuelo.cak,
            'interpretacion': pruebaSuelo.cakInterpretacion,
          }
        ],
        'Mg/K': [
          {
            'valor': pruebaSuelo.mgk,
            'interpretacion': pruebaSuelo.mgkInterpretacion,
          }
        ],
        'Arcilla': pruebaSuelo.arcilla,
        'Limo': pruebaSuelo.limo,
        'Arena': pruebaSuelo.arena,
        'Humus': [
          {
            'valor': pruebaSuelo.humus,
            'interpretacion': pruebaSuelo.humusInterpretacion,
          }
        ],
        'Textura': pruebaSuelo.textura
      });
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> addPruebaAgua(PruebaAgua pruebaAgua) async {
    try {
      await db.collection('PruebaAgua').add({
        'IdPrueba': pruebaAgua.idPrueba,
        'IdPredio': pruebaAgua.idPredio,
        'NombrePredio': pruebaAgua.nombrePredio,
        'Corregimiento': pruebaAgua.corregimientoPredio,
        'Departamento': pruebaAgua.dptoPredio,
        'Municipio': pruebaAgua.municipioPredio,
        'Latitud': pruebaAgua.latitud,
        'Longitud': pruebaAgua.longitud,
        'MSNM': pruebaAgua.msnm,
        'ProfundidadSB': pruebaAgua.profundidadSB,
        'Puntos': pruebaAgua.puntos,
        'Temperatura': pruebaAgua.temperatura,
        'Lotes': pruebaAgua.lotes,
        'Cultivo': pruebaAgua.cultivo,
        'Variedad': pruebaAgua.variedad,
        'Edad': pruebaAgua.edad,
        'Lote': pruebaAgua.lote,
        'FechaTomaMuestra': pruebaAgua.fechaTomaMuestra,
        'FechaRecibido': pruebaAgua.fechaRecibido,
        'Idpropietario': pruebaAgua.idPropietario,
        'Nombrepropietario': pruebaAgua.nombrepropietario,
        'Telefono': pruebaAgua.telefonopropietario,
        'Correo': pruebaAgua.correopropietario,
        'Fecha': pruebaAgua.fechaPrueba,
        'Interpretacion': pruebaAgua.interpretacion,
        'Recomendaciones': pruebaAgua.recomendaciones,
        'Restricciones': pruebaAgua.restricciones,
        'TipoAgua': pruebaAgua.tipoAgua,

        // 'Nitrato de Nitrógeno - N': [
        //   {
        //     'valor': pruebaAgua.N,
        //     'interpretacion': pruebaAgua.N_Interpretacion,
        //   }
        // ],
        'Nitrógeno amoniacal - NH4+': [
          {
            'valor': pruebaAgua.nh4,
            'interpretacion': pruebaAgua.nh4Interpretacion,
          }
        ],
        'Nitritos - NO2-': [
          {
            'valor': pruebaAgua.no2,
            'interpretacion': pruebaAgua.no2Interpretacion,
          }
        ],
        'Nitratos - NO3-': [
          {
            'valor': pruebaAgua.no3,
            'interpretacion': pruebaAgua.no3Interpretacion,
          }
        ],
        'Fósforo - P': [
          {
            'valor': pruebaAgua.p,
            'interpretacion': pruebaAgua.pInterpretacion,
          }
        ],
        'Potasio - K': [
          {
            'valor': pruebaAgua.k,
            'interpretacion': pruebaAgua.kInterpretacion,
          }
        ],
        'Calcio - Ca': [
          {
            'valor': pruebaAgua.ca,
            'interpretacion': pruebaAgua.caInterpretacion,
          }
        ],
        'Magnesio - Mg': [
          {
            'valor': pruebaAgua.mg,
            'interpretacion': pruebaAgua.mgInterpretacion,
          }
        ],
        'Sulfato - SO4': [
          {
            'valor': pruebaAgua.so4,
            'interpretacion': pruebaAgua.so4Interpretacion,
          }
        ],
        'Hierro Férrico - Fe': [
          {
            'valor': pruebaAgua.fe,
            'interpretacion': pruebaAgua.feInterpretacion,
          }
        ],
        'Manganeso - Mn': [
          {
            'valor': pruebaAgua.mn,
            'interpretacion': pruebaAgua.mnInterpretacion,
          }
        ],
        'Cobre - Cu': [
          {
            'valor': pruebaAgua.cu,
            'interpretacion': pruebaAgua.cuInterpretacion,
          }
        ],
        'Cloruro - Cl': [
          {
            'valor': pruebaAgua.cl,
            'interpretacion': pruebaAgua.clInterpretacion,
          }
        ],
        'Ph': [
          {
            'valor': pruebaAgua.ph,
            'interpretacion': pruebaAgua.phInterpretacion,
          }
        ],
        'C.E': [
          {
            'valor': pruebaAgua.ce,
            'interpretacion': pruebaAgua.ceInterpretacion,
          }
        ],
        'Sales Disueltas': [
          {
            'valor': pruebaAgua.salesDisueltas,
            'interpretacion': pruebaAgua.salesDisueltasInterpretacion,
          }
        ],
      });
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<void> addPruebaSistemaFoliar(
      PruebaSistemaFoliar pruebaSistemaFoliar) async {
    try {
      await db.collection('PruebaSistemaFoliar').add({
        'IdPrueba': pruebaSistemaFoliar.idPrueba,
        'IdPredio': pruebaSistemaFoliar.idPredio,
        'NombrePredio': pruebaSistemaFoliar.nombrePredio,
        'Corregimiento': pruebaSistemaFoliar.corregimientoPredio,
        'Latitud': pruebaSistemaFoliar.latitud,
        'Longitud': pruebaSistemaFoliar.longitud,
        'MSNM': pruebaSistemaFoliar.msnm,
        'ProfundidadSB': pruebaSistemaFoliar.profundidadSB,
        'Puntos': pruebaSistemaFoliar.puntos,
        'Temperatura': pruebaSistemaFoliar.temperatura,
        'Lotes': pruebaSistemaFoliar.lotes,
        'Cultivo': pruebaSistemaFoliar.cultivo,
        'Municipio': pruebaSistemaFoliar.municipioPredio,
        'Variedad': pruebaSistemaFoliar.variedad,
        'Departamento': pruebaSistemaFoliar.dptoPredio,
        'Edad': pruebaSistemaFoliar.edad,
        'Idpropietario': pruebaSistemaFoliar.idPropietario,
        'Nombrepropietario': pruebaSistemaFoliar.nombrepropietario,
        'Telefono': pruebaSistemaFoliar.telefonopropietario,
        'Correo': pruebaSistemaFoliar.correopropietario,
        'Lote': pruebaSistemaFoliar.lote,
        'FechaTomaMuestra': pruebaSistemaFoliar.fechaTomaMuestra,
        'FechaRecibido': pruebaSistemaFoliar.fechaRecibido,
        'Fecha': pruebaSistemaFoliar.fechaPrueba,
        'Calcio - Ca': pruebaSistemaFoliar.ca,
        'Magnesio - Mg': pruebaSistemaFoliar.mg,
        'Sodio - Na': pruebaSistemaFoliar.na,
        'Potasio - K': pruebaSistemaFoliar.k,
        'Nitrógeno - N': pruebaSistemaFoliar.n,
        'Fósforo - P': pruebaSistemaFoliar.p,
        'Hierro Férrico - Fe': pruebaSistemaFoliar.fe,
        'Cobre - Cu': pruebaSistemaFoliar.cu,
        'Zinc - Zn': pruebaSistemaFoliar.zn,
        'Manganeso - Mn': pruebaSistemaFoliar.mn,
        'Boro - B': pruebaSistemaFoliar.b,
      });
    } catch (e) {
      print("Error al agregar la prueba: $e");
    }
  }

  Future<List<dynamic>> getAllPruebasPorPredio(String predioId) async {
    try {
      List<dynamic> pruebas = [];
      pruebas.addAll(await getPruebaSueloPorPredio(predioId));
      pruebas.addAll(await getPruebaAguaPorPredio(predioId));
      pruebas.addAll(await getPruebaSistemaFoliarPorPredio(predioId));
      return pruebas;
    } catch (e) {
      // Manejar errores aquí
      print("Error al obtener las pruebas: $e");
      throw e;
    }
  }

  Future<void> updatePeople(Cliente in_cliente) async {
    try {
      List<Cliente> list_clientes = await getPeople();

      Cliente? clienteEncontrado;
      list_clientes.forEach((cliente) {
        if (cliente.id == in_cliente.id) {
          clienteEncontrado = cliente;
        }
      });
      print(clienteEncontrado?.uid);
      if (clienteEncontrado != null) {
        await db.collection('Usuarios').doc(clienteEncontrado?.uid).set({
          "Nombre": in_cliente.nombre,
          "Telefono": in_cliente.telefono,
          "Correo": in_cliente.correo,
          "Rol": in_cliente.rol,
        }, SetOptions(merge: true));
      } else {
        print("Cliente no encontrado");
      }
    } catch (e) {
      print("Error al editar el cliente: $e");
    }
  }
  
Future<bool> deletePeople(Cliente incliente) async {
  try {
    List<Cliente> listClientes = await getPeople();
    Cliente? clienteEncontrado;

    // Buscar al cliente en la lista
    for (var cliente in listClientes) {
      if (cliente.id == incliente.id) {
        clienteEncontrado = cliente;
        break;
      }
    }

    if (clienteEncontrado != null) {
      // Obtener referencia al usuario que se desea eliminar
      User? userToDelete = FirebaseAuth.instance.currentUser;

      if (userToDelete != null) {
        // Eliminar el usuario del sistema de autenticación
        await userToDelete.delete();

        // Eliminar el documento correspondiente en Firestore
        await db.collection('Usuarios').doc(clienteEncontrado.uid).delete();

        return true; // Indica que la eliminación fue exitosa
      } else {
        print("Usuario no autenticado encontrado");
        return false; // Indica que el usuario no está autenticado
      }
    } else {
      print("Cliente no encontrado");
      return false; // Indica que el cliente no fue encontrado
    }
  } catch (e) {
    print("Error al eliminar el cliente: $e");
    return false; // Indica que ocurrió un error durante la eliminación
  }
}





  Future<List<Predio>> getPredio() async {
    List<Predio> predios = [];
    try {
      QuerySnapshot querypredios = await db.collection('Predios').get();
      querypredios.docs.forEach((documento) {
        Map<String, dynamic> data = documento.data() as Map<String, dynamic>;
        Predio predio =Predio(
          uid: documento.id,
          id: data['Id'],
          idPropietario: data['IdPropietario'],
          nombrePropietario: data['NombrePropietario'],
          correoPropietario: data['CorreoPropietario'],
          telefonoPropietario: data['TelefonoPropietario'],
          nombre: data['Nombre'],
          corregimientoVereda: data['CorregimientoVereda'],
          departamento: data['Departamento'],
          municipio: data['Municipio'],
          latitud: data['Latitud'],
          longitud: data['Longitud'],
          msnm: data['MSNM'],
          profundidadSB: data['ProfundidadSB'],
          puntos: data['Puntos'],
          temperatura: data['Temperatura'],
          lotes: data['Lotes']
        );
        predios.add(predio);
      });
    } catch (e) {
      print("Error al obtener la lista de clientes: $e");
    }
    return predios;
  }

  Future<bool> deletePredio(Predio inpredio) async {
    try {
      List<Predio> listClientes = await getPredio();
      Predio? predioEncontrado;
      listClientes.forEach((predio) {
        if (predio.id == inpredio.id) {
          predioEncontrado = predio;
        }
      });

      if (predioEncontrado != null) {
        await db.collection('Predios').doc(predioEncontrado?.uid).delete();
        return true; // Indica que la eliminación fue exitosa
      } else {
        return false; // Indica que el cliente no fue encontrado
      }
    } catch (e) {
      return false; // Indica que ocurrió un error durante la eliminación
    }
  }
}
