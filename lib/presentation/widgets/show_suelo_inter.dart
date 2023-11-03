import 'package:flutter/material.dart';
import 'package:mixcosechas_app/model/pruebaSuelo.dart';
import 'package:mixcosechas_app/presentation/screens/registration_analisis_screen.dart';
import 'package:mixcosechas_app/presentation/screens/view_pruebas_screen.dart';
import 'package:mixcosechas_app/presentation/widgets/mensaje_show_dialog.dart';
import 'package:mixcosechas_app/services/firebase_service.dart';
import 'package:mixcosechas_app/theme/limpiarCampos.dart';


class ShowSuelo extends StatelessWidget {
  ShowSuelo({
    Key? key,
    required this.nombreCompuestos,
    required this.valorCompuestos,
    required this.interpretacionCompuestos,
    required this.pruebasuelo,
  }) : super(key: key);

  final List<String> nombreCompuestos;
  final List<double> valorCompuestos;
  final List<String> interpretacionCompuestos;
  final PruebaSuelo pruebasuelo;
  
  final ServiceFirebase _serviceFirebase = ServiceFirebase();
  final TextEditingController _recomendacionesController = TextEditingController();
  final TextEditingController _siembraController = TextEditingController();
  final TextEditingController _presiembraController = TextEditingController();
  final TextEditingController _mantenimientoController = TextEditingController();


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
              Tab(text: 'Graficas'),
              Tab(text: 'Plan fertilizacion'),
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
                        'Nombre\nCompuesto',
                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Valor\nCompuesto',
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
            const SingleChildScrollView(
              child: Center(
                child: Text('Contenido de la Pestaña 2'),
              ),
            ),
            
            SingleChildScrollView(
              child: Center(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      const Text('Ingresa la información en cada campo:'),
                      const SizedBox(height: 16), // Espacio entre el texto y los campos
                
                      _buildTextField('Recomendaciones', 'Ingresa el primer texto aquí',_recomendacionesController),
                      const SizedBox(height: 16),
                
                      _buildTextField('Presiembra', 'Ingresa el segundo texto aquí', _presiembraController),
                      const SizedBox(height: 16),
                
                      _buildTextField('Siembra', 'Ingresa el tercer texto aquí', _siembraController),
                      const SizedBox(height: 16),
                
                      _buildTextField('Mantenimiento', 'Ingresa el cuarto texto aquí', _mantenimientoController),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed:(){
                            pruebasuelo.recomendaciones = _recomendacionesController.text;
                            pruebasuelo.presiembra = _presiembraController.text;
                            pruebasuelo.siembra = _siembraController.text;
                            pruebasuelo.mantenimiento = _mantenimientoController.text;
                            _serviceFirebase.addPruebaSuelo(pruebasuelo);
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text('Registro exitoso'),
                                  content: const Text('¡Tu registro se ha completado con éxito!'),
                                  actions: [
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                        Navigator.pushReplacement( // Reemplaza la vista actual
                                          context,
                                          MaterialPageRoute(builder: (context) => const RegistrationPruebaScreen()),
                                        );
                                      },
                                      child: const Text('OK'),
                                    ),
                                  ],
                                );
                              },
                            );
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
