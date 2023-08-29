import 'package:flutter/material.dart';
import 'dart:math';
import '../../model/predios.dart';
import '../../services/firebase_service.dart';
import '../widgets/mensaje_show_dialog.dart';
import 'package:csv/csv.dart' as csv;


class RegistrationPredioScreen extends StatelessWidget {
  const RegistrationPredioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const RegisterPage();
  }
}

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});
  
  @override
  // ignore: library_private_types_in_public_api
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  
  
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _corregimientoVeredaController = TextEditingController();
  final TextEditingController _departamentoController = TextEditingController();
  final TextEditingController _municipioController = TextEditingController();
  final TextEditingController _cultivoController = TextEditingController();
  final TextEditingController _variedadController = TextEditingController();
  final TextEditingController _edadController = TextEditingController();

  List<String> departamentos = [];

  void cargarOpciones() async {

    String data = await DefaultAssetBundle.of(context).loadString('assets/departamentos_Municipios.csv');
    List<List<dynamic>> parsedCsv = const csv.CsvToListConverter(fieldDelimiter: ';').convert(data);
    
    Set<String> departamentosSet = Set<String>(); // Usamos un Set para evitar repeticiones
    
    for (var row in parsedCsv) {
      if (row.isNotEmpty) {
        departamentosSet.add(row[0].toString()); // Agregamos el primer elemento de la fila al Set
      }
    }
    
    setState(() {
      departamentos = departamentosSet.toList(); // Convertimos el Set en una lista
    });

  }

  @override
  Widget build(BuildContext context) {
    cargarOpciones();
    return Scaffold(
      appBar: AppBar(
        //title: const Text('Registrar predio'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  alignment: const Alignment(-0.8, 0),
                  child: const Text(
                    'Registrar predio',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 26,
                      //color: Color(0XFF35424A)
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                 Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical:8.0),
                  child: TextField(
                    controller: _nombreController,
                    keyboardType: TextInputType.name,
                    decoration:const InputDecoration(
                      labelText: 'Nombre del predio',
                      labelStyle: TextStyle(color: Color(0xFF19AA89),fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                 Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8.0),
                  child: TextField(
                    controller: _corregimientoVeredaController,
                    keyboardType: TextInputType.name,
                    decoration:const  InputDecoration(
                      labelText: 'Corregimiento/Vereda',
                      labelStyle: TextStyle(color: Color(0xFF19AA89),fontWeight: FontWeight.w600),
                    ),
                  ),
                ),

                //Todo: Invertigar como cargar los departamentos de forma automatica
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8.0),
                  child: DropdownButtonFormField<String>(
                    value: _departamentoController.text,
                    onChanged: (String? newValue) {
                      setState(() {
                        _departamentoController.text = newValue!;
                      });
                    },
                    decoration: const InputDecoration(
                      labelText: 'Departamento',
                      labelStyle: TextStyle(color: Color(0xFF19AA89),fontWeight: FontWeight.w600),
                    ),
                    items: [
                      const DropdownMenuItem<String>(
                        value: '',
                        child: Text('Seleccione'),
                      ),
                      ...departamentos.map((role) {
                        return DropdownMenuItem<String>(value: role, child: Text(role));
                      }).toList(),
                    ],
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, selecciona un departamento';
                      }
                      return null;
                    },
                  ),
                ),

                //Todo: Investigar como cargar los municipios dependiendo del departamento
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8.0),
                  child: DropdownButtonFormField<String>(
                    value: _municipioController.text,
                    onChanged: (String? newValue) {
                      setState(() {
                        _municipioController.text = newValue!;
                      });
                    },
                    decoration: const InputDecoration(
                      labelText: 'Municipio',
                      labelStyle: TextStyle(color: Color(0xFF19AA89),fontWeight: FontWeight.w600),
                    ),
                    items: [
                      const DropdownMenuItem<String>(
                        value: '',
                        child: Text('Seleccione'), // O cualquier otro texto que desees
                      ),
                      ...['Andes', 'Medellin','Alejandria'].map((role) {
                        return DropdownMenuItem<String>(value: role, child: Text(role));
                      }).toList(),
                    ],
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, selecciona un municipio';
                      }
                      return null;
                    },
                  ),
                ),
                 Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8.0),
                  child: TextField(
                    controller: _cultivoController,
                    keyboardType: TextInputType.name,
                    decoration: const InputDecoration(
                      labelText: 'Cultivo',
                      labelStyle: TextStyle(color: Color(0xFF19AA89),fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                 Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8.0),
                  child: TextField(
                    controller: _variedadController,
                    keyboardType: TextInputType.name,
                    decoration:const InputDecoration(
                      labelText: 'Variedad',
                      labelStyle: TextStyle(color: Color(0xFF19AA89),fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8.0),
                  child: DropdownButtonFormField<String>(
                    value: _edadController.text,
                    onChanged: (String? newValue) {
                      setState(() {
                        _edadController.text = newValue!;
                      });
                    },
                    decoration: const InputDecoration(
                      labelText: 'Edad',
                      labelStyle: TextStyle(color: Color(0xFF19AA89),fontWeight: FontWeight.w600),
                    ),
                    items: [
                      const DropdownMenuItem<String>(
                        value: '',
                        child: Text('Seleccione'),
                      ),
                      ...['Presiembra', 'Siembra'].map((role) {
                        return DropdownMenuItem<String>(value: role, child: Text(role));
                      }).toList(),
                    ],
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, selecciona una edad';
                      }
                      return null;
                    },
                  ),
                ),
                
                const SizedBox(height: 20),
                RegistrarseButtom(
                  nombreController:_nombreController,
                  corregimientoVeredaController: _corregimientoVeredaController,
                  departamentoController: _departamentoController, 
                  municipioController: _municipioController,
                  cultivoController:_cultivoController, 
                  variedadController:_variedadController, 
                  edadController: _edadController
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class RegistrarseButtom extends StatelessWidget {
 RegistrarseButtom({
    super.key,
    required TextEditingController nombreController,
    required TextEditingController corregimientoVeredaController,
    required TextEditingController departamentoController,
    required TextEditingController municipioController,
    required TextEditingController cultivoController,
    required TextEditingController variedadController,
    required TextEditingController edadController,
  
  }):_nombreController = nombreController,
  _corregimientoVeredaController = corregimientoVeredaController,
  _departamentoController = departamentoController,
  _municipioController =municipioController,
  _cultivoController =cultivoController,
  _variedadController = variedadController,
  _edadController = edadController;


  final TextEditingController _nombreController;
  final TextEditingController _corregimientoVeredaController;
  final TextEditingController _departamentoController;
  final TextEditingController _municipioController;
  final TextEditingController _cultivoController;
  final TextEditingController _variedadController;
  final TextEditingController _edadController;
  final ServiceFirebase _serviceFirebase = ServiceFirebase();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: ElevatedButton(
        onPressed: () {
          
          if (_nombreController.text.isNotEmpty &&
            _corregimientoVeredaController.text.isNotEmpty &&
            _departamentoController.text.isNotEmpty &&
            _municipioController.text.isNotEmpty && 
            _cultivoController.text.isNotEmpty &&
            _variedadController.text.isNotEmpty && 
            _edadController.text.isNotEmpty){

            var idPredio = Random().nextInt(1000000);
            var iduser = Random().nextInt(1000000);

            Predio predio = Predio(id:idPredio.toString(),
             idUsuario: iduser.toString(),
             nombre: _nombreController.text,
             corregimientoVereda: _corregimientoVeredaController.text,
             departamento: _departamentoController.text,
             municipio: _municipioController.text,
             cultivo: _cultivoController.text,
             variedad: _variedadController.text,
             edad: _edadController.text
            );

            _serviceFirebase.addPredio(predio);

            showDialog(
                context: context,
                builder: (context) {
                  return const MensajeShowDialog(title: "Title",message: "Se registró correctamente el predio");
                },
              );

          }else{
            showDialog(
              context: context,
              builder: (context) {
                return const MensajeShowDialog(title: "OJO",message: "No puedes dejar campos vacios");
              },
            );

          }

        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF19AA89),
          padding: const EdgeInsets.symmetric(horizontal: 0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
        ),
        child: const Text(
          'Registrar',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Color(0XFFeeeeee),
          ),
        ),
      ),
    );
  }
}
