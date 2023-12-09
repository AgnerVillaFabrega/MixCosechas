// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:mixcosechas_app/model/predios.dart';
import 'package:mixcosechas_app/model/pruebaAgua.dart';
import 'package:mixcosechas_app/model/pruebaSistemaFoliar.dart';
import 'package:mixcosechas_app/model/pruebaSuelo.dart';
import 'package:mixcosechas_app/presentation/provider/ClienteProvider.dart';
import 'package:mixcosechas_app/presentation/screens/list_view_sceens/view_predio_screen.dart';
import 'package:mixcosechas_app/presentation/widgets/PDFs/prueba_agua_pdf.dart';
import 'package:mixcosechas_app/presentation/widgets/PDFs/prueba_suelo_pdf.dart';
import 'package:mixcosechas_app/presentation/widgets/custom_text.dart';
import 'package:mixcosechas_app/presentation/widgets/messages/quickalert_msg.dart';
import 'package:mixcosechas_app/services/firebase_service.dart';
import 'package:provider/provider.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class PredioProfileView extends StatelessWidget {
  final Predio predio;
  final ServiceFirebase _serviceFirebase = ServiceFirebase();

  PredioProfileView({Key? key, required this.predio}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ClienteProvider watch =  context.watch<ClienteProvider>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalles del Predio'),
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) async {
              if (value == 'editar') {
                // Lógica para la acción de editar
              } else if (value == 'eliminar') {
                QuickAlert.show(
                  context: context,
                  type: QuickAlertType.confirm,
                  text: 'Seguro que quiere eliminar este usuario?',
                  confirmBtnText: 'Si',
                  cancelBtnText: 'No',
                  onConfirmBtnTap: () async {
                    bool eliminacionExitosa =  await _serviceFirebase.deletePredio(predio);
                    if (eliminacionExitosa) {
                      QuickAlert.show(    
                        context: context,    
                        type: QuickAlertType.success, 
                        text: "Predio eliminado correctamente",
                        onConfirmBtnTap: () {
                          Navigator.of(context).pop();
                          Navigator.of(context).pop();
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (context) => cargarDatosPredios()),
                              );
                        },
                      );
                    } else {
                      QuickAlertDialog.showAlert(context, QuickAlertType.error, "Error al eliminar el cliente");
                    }
                  },
                  confirmBtnColor: Colors.red,
                );  
              }
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                value: 'editar',
                child: ListTile(
                  leading: Icon(Icons.edit),
                  title: Text('Editar'),
                ),
              ),
              if(watch.cliente.rol == 'Admin')const PopupMenuItem<String>(
                value: 'eliminar',
                child: ListTile(
                  leading: Icon(Icons.delete),
                  title: Text('Eliminar'),
                ),
              ),
            ],
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    predio.nombre,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 26),
                  ),
                  Text(
                    predio.id,
                    style: const TextStyle(fontSize: 26),
                  ),
                  const SizedBox(height: 15),
                ],
              ),
              Row(
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10),
                      CustomText(
                          text: 'Propietario:',
                          fontSize: 15,
                          color: Color(0xFF19AA89)),
                      SizedBox(height: 5),
                      CustomText(
                          text: 'Departamento:',
                          fontSize: 15,
                          color: Color(0xFF19AA89)),
                      SizedBox(height: 5),
                      CustomText(
                          text: 'Municipio:',
                          fontSize: 15,
                          color: Color(0xFF19AA89)),
                      SizedBox(height: 5),
                      CustomText(
                          text: 'Corregimiento/Vereda:',
                          fontSize: 15,
                          color: Color(0xFF19AA89)),
                      SizedBox(height: 5),
                      CustomText(
                          text: 'Latitud:',
                          fontSize: 15,
                          color: Color(0xFF19AA89)),
                      SizedBox(height: 5),
                      CustomText(
                          text: 'Longitud:',
                          fontSize: 15,
                          color: Color(0xFF19AA89)),
                      SizedBox(height: 5),
                      CustomText(
                          text: 'MSNM:',
                          fontSize: 15,
                          color: Color(0xFF19AA89)),
                      SizedBox(height: 5),
                      CustomText(
                          text: 'Profundidad Suelo Biotico:',
                          fontSize: 15,
                          color: Color(0xFF19AA89)),
                      SizedBox(height: 5),
                      CustomText(
                          text: 'Puntos:',
                          fontSize: 15,
                          color: Color(0xFF19AA89)),
                      SizedBox(height: 5),
                      CustomText(
                          text: 'Temperatura:',
                          fontSize: 15,
                          color: Color(0xFF19AA89)),

                      SizedBox(height: 10),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const SizedBox(height: 10),
                      CustomText(
                          text: predio.nombrePropietario,
                          fontSize: 15,
                          color: Colors.black),
                      const SizedBox(height: 5),
                      CustomText(
                          text: predio.departamento,
                          fontSize: 15,
                          color: Colors.black),
                      const SizedBox(height: 5),
                      CustomText(
                          text: predio.municipio,
                          fontSize: 15,
                          color: Colors.black),
                      const SizedBox(height: 5),
                      CustomText(
                          text: predio.corregimientoVereda,
                          fontSize: 15,
                          color: Colors.black),
                      const SizedBox(height: 5),
                      CustomText(
                          text: predio.latitud,
                          fontSize: 15,
                          color: Colors.black),
                      const SizedBox(height: 5),
                      CustomText(
                          text: predio.longitud,
                          fontSize: 15,
                          color: Colors.black),
                      const SizedBox(height: 5),
                      CustomText(
                          text: predio.msnm,
                          fontSize: 15,
                          color: Colors.black),
                      const SizedBox(height: 5),
                      CustomText(
                          text: predio.profundidadSB,
                          fontSize: 15,
                          color: Colors.black),
                      const SizedBox(height: 5),
                      CustomText(
                          text: predio.puntos,
                          fontSize: 15,
                          color: Colors.black),
                      const SizedBox(height: 5),
                      CustomText(
                          text: predio.temperatura,
                          fontSize: 15,
                          color: Colors.black),
                      const SizedBox(height: 10),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 16),
              const Text(
                "Historial de pruebas",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 26,
                    color: Color(0XFF636363)),
              ),
              const Divider(),

              //AQUI COMIENZO************************************************************

              FutureBuilder(
                future: _serviceFirebase.getAllPruebasPorPredio(predio.id),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    List<dynamic> pruebas =
                        snapshot.data as List<dynamic>;
                    if (pruebas.isEmpty) {
                      return const Card(
                        elevation: 2,
                        child: Padding(
                          padding: EdgeInsets.all(
                              16),
                          child: ListTile(
                            title: Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "¡Upss! 🤷‍♂️",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ],
                            ),
                            subtitle: Text(
                              'Parece que aún no tienes pruebas',
                              style: TextStyle(
                                fontSize: 17,
                              ),
                            ),
                          ),
                        ),
                      );
                    } else {
                      return SizedBox(
                        height: 600,
                        child: ListView(
                          padding: const EdgeInsets.symmetric(horizontal: 14),
                          children: pruebas.map((prueba) {
                            return GestureDetector(
                              onTap: () {
                                // Navegar a la pantalla de detalles de la prueba
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //     builder: (context) => DetallePruebaView(prueba: prueba),
                                //   ),
                                // );
                                if (prueba is PruebaSuelo) {
                                  createPruebaSueloPdf(prueba);
                                } else if (prueba is PruebaAgua) {
                                  createPruebaAguaPdf(prueba);
                                } else if (prueba is PruebaSistemaFoliar) {
                                  // Lógica para el PDF de Sistema foliar
                                  QuickAlertDialog.showAlert(
                                    context,
                                    QuickAlertType.warning,
                                    "Actualmente no generamos un reporte para esta prueba, pronto podrás usarlo",
                                  );
                                }

                              },
                              child: Card(
                                elevation: 2,
                                child: Padding(
                                  padding: const EdgeInsets.all(16),
                                  child: ListTile(
                                    title: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          prueba.cultivo,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          prueba.fechaPrueba.toString(),
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    subtitle: Text(
                                        prueba.tipoPrueba.toString()),
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      );
                    }
                  }
                },
              ),

              //AQUI TERMINO*************************************************************************
            ],
          ),
        ),
      ),
    );
  }
}
