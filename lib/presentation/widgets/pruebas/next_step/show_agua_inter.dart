import 'package:flutter/material.dart';
import 'package:mixcosechas_app/model/pruebaAgua.dart';
import 'package:mixcosechas_app/presentation/screens/registry_screens/registration_analisis_screen.dart';
import 'package:mixcosechas_app/presentation/widgets/graphics/pruebasueloGraphic.dart';
import 'package:mixcosechas_app/presentation/widgets/messages/quickalert_msg.dart';
import 'package:mixcosechas_app/services/firebase_service.dart';
import 'package:mixcosechas_app/theme/limpiarCampos.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';


class ShowAgua extends StatelessWidget {
  ShowAgua({
    Key? key,
    required this.nombreCompuestos,
    required this.valorCompuestos,
    required this.interpretacionCompuestos,
    required this.pruebaagua
  }): super(key: key);

  final List<String> nombreCompuestos;
  final List<double> valorCompuestos;
  final List<String> interpretacionCompuestos;
  final PruebaAgua pruebaagua;

  final ServiceFirebase _serviceFirebase = ServiceFirebase();
  final TextEditingController _recomendacionesController = TextEditingController();
  final TextEditingController _interpretacionController = TextEditingController();
  final TextEditingController _restriccionesController = TextEditingController();
  
  

  String recortarTexto(String texto, int maxLength) {
    if (texto.length > maxLength) {
      return texto.substring(0, maxLength) + '...';
    }
    return texto;
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Resultados de análisis'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Interpretacion'),
              Tab(text: 'Grafica'),
              Tab(text: 'Plan de Riego'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              child: SingleChildScrollView(
                child: DataTable(
                  headingRowColor: MaterialStateColor.resolveWith((Set<MaterialState> states) {
                    return const Color(0xFF19AA89);
                  }),
                  columns: const [
                    DataColumn(
                      label: Text(
                        'Parametro',
                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Resultado',
                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Interpretación',
                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ),
                  ],
                  rows: List<DataRow>.generate(
                    nombreCompuestos.length,
                    (index) => DataRow(
                      cells: [
                        DataCell(
                          Column(
                            children: [
                              Text(nombreCompuestos[index]),
                            ],
                          ),
                        ),
                        DataCell(
                          Text(valorCompuestos[index].toStringAsFixed(2)),
                        ),
                        DataCell(
                          Column(
                            children: [
                              Text(recortarTexto(interpretacionCompuestos[index], 50)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  const Text(
                    'Diagrama de Liebig',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 26,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    width: 500,
                    height: 300,
                    child: CompuestosChart(pruebaagua.graficaCompuestos,
                        pruebaagua.valorgraficaCompuestos),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    width: 500,
                    height: 300,
                    child: CompuestosChart(pruebaagua.graficaCompuestos2,
                        pruebaagua.valorgraficaCompuestos2),
                  )
                ],
              ),
            ),
            
            SingleChildScrollView(
              child: Center(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      const SizedBox(height: 16),
                      const Text(
                        'Recomendaciones y plan de Riego',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 23,
                        ),
                      ),

                      const SizedBox(height: 16),
                      _buildTextField('Interpretación', 'Ingresa el segundo texto aquí', _interpretacionController),
                      
                      const SizedBox(height: 16),
                      _buildTextField('Recomendaciones', 'Ingresa el primer texto aquí',_recomendacionesController),
                      const SizedBox(height: 16),

                      _buildTextField('Restricciones', 'Ingresa el tercer texto aquí', _restriccionesController),
                      const SizedBox(height: 16),
              
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(horizontal: 9),
                        child: ElevatedButton(
                          onPressed:(){
                            pruebaagua.recomendaciones = _recomendacionesController.text;
                            pruebaagua.interpretacion = _interpretacionController.text;
                            pruebaagua.restricciones = _restriccionesController.text;
                            _serviceFirebase.addPruebaAgua(pruebaagua);
                            Future<bool> response = _serviceFirebase.addPruebaAgua(pruebaagua);

                            if (response == true) {
                              QuickAlert.show(    
                                context: context,
                                type: QuickAlertType.success,
                                text: '¡Tu registro se ha completado con éxito!',
                                onConfirmBtnTap: () {
                                  Navigator.of(context).pop();
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(builder: (context) => const RegistrationPruebaScreen()),
                                      );
                                },
                              );
                            } else {
                              QuickAlertDialog.showAlert(context, QuickAlertType.error, "Error al registrar la prueba");
                            }
                            
                            // showDialog(
                            //   context: context,
                            //   builder: (context) {
                            //     return AlertDialog(
                            //       title: const Text('Registro exitoso'),
                            //       content: const Text('¡Tu registro se ha completado con éxito!'),
                            //       actions: [
                            //         ElevatedButton(
                            //           onPressed: () {
                            //             Navigator.of(context).pop();
                            //             Navigator.pushReplacement( // Reemplaza la vista actual
                            //               context,
                            //               MaterialPageRoute(builder: (context) => const RegistrationPruebaScreen()),
                            //             );
                            //           },
                            //           child: const Text('OK'),
                            //         ),
                            //       ],
                            //     );
                            //   },
                            // );

                            FormUtils.clearTextControllers([]);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF19AA89),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                          child: const Text(
                            'Registrar prueba',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Color(0XFFeeeeee),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget _buildTextField(String label, String hintText, TextEditingController controller) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: TextFormField(
      maxLines: null,
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        hintText: hintText,
        border: const OutlineInputBorder(),
      ),
    ),
  );
}

