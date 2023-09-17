import 'package:flutter/material.dart';
import 'package:mixcosechas_app/model/clientes.dart';
import 'dart:math';
import '../../model/predios.dart';
import '../../services/firebase_service.dart';
import '../../theme/limpiarCampos.dart';
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
 
  final TextEditingController _identificacionPropietarioController = TextEditingController();
  final TextEditingController _nombrePropietarioController = TextEditingController();
  final TextEditingController _correoPropietarioController = TextEditingController();
  final TextEditingController _telefonoPropietarioController = TextEditingController();
  
  final TextEditingController _nombrePredioController = TextEditingController();
  final TextEditingController _corregimientoVeredaController = TextEditingController();
  final TextEditingController _departamentoController = TextEditingController();
  final TextEditingController _municipioController = TextEditingController();
  final TextEditingController _cultivoController = TextEditingController();
  final TextEditingController _variedadController = TextEditingController();
  final TextEditingController _edadController = TextEditingController();
  final ServiceFirebase _serviceFirebase = ServiceFirebase();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  List<String> departamentos = [];
  List<String> municipios = [];

  void cargarDepartamentos() async {

    String data = await DefaultAssetBundle.of(context).loadString('assets/departamentos_Municipios.csv');
    List<List<dynamic>> parsedCsv = const csv.CsvToListConverter(fieldDelimiter: ';').convert(data);
    
    Set<String> departamentosSet = Set<String>(); 
    
    for (var row in parsedCsv) {
      if (row.isNotEmpty) {
        departamentosSet.add(row[0].toString()); 
      }
    }
    
    setState(() {
      departamentos = departamentosSet.toList(); 
    });

  }
  void cargarMunicipios(String departamento) async {

    String data = await DefaultAssetBundle.of(context).loadString('assets/departamentos_Municipios.csv');
    List<List<dynamic>> parsedCsv = const csv.CsvToListConverter(fieldDelimiter: ';').convert(data);
    
    Set<String> muicipiosSet = Set<String>(); 
    
    for (var row in parsedCsv) {
      if (row.isNotEmpty && row[0].toString() == departamento ) {
        muicipiosSet.add(row[1].toString()); 
      }
    }
    
    setState(() {
      municipios = muicipiosSet.toList(); 
    });

  }

  @override
  Widget build(BuildContext context) {
    cargarDepartamentos();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
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
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical:8.0),
                  child: Form(
                    key: formKey,
                    child:Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              flex: 4,
                              child:TextFormField(
                                controller: _identificacionPropietarioController,
                                keyboardType: TextInputType.number,
                                decoration:const InputDecoration(
                                  labelText: 'Identificacion Propietario',
                                  labelStyle: TextStyle(color: Color(0xFF19AA89),fontWeight: FontWeight.w600),
                                ),
                                validator: (String? value){
                                  if (value ==null || value.isEmpty) {
                                      return "Se requiere propietario";
                                    }
                                    return null;
                                }
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: ElevatedButton(
                                onPressed:() async{
                                  
                                  Cliente? cliente = await _serviceFirebase.consultarClientePorId(_identificacionPropietarioController.text);
                                  if(cliente != null) {
                                    _nombrePropietarioController.text = cliente.nombre;
                                    _telefonoPropietarioController.text = cliente.telefono;
                                    _correoPropietarioController.text = cliente.correo;
                                  }else{
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return const MensajeShowDialog(title: "Error!!",message: "No se encontró el propietario");
                                      },
                                    );
                                    FormUtils.clearTextControllers([_nombrePropietarioController,_telefonoPropietarioController,_correoPropietarioController]);
                                  }
                                } ,
                                child:const Icon(Icons.search),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          enabled: false, 
                          controller: _nombrePropietarioController,
                          keyboardType: TextInputType.name,
                          decoration:const InputDecoration(
                            labelText: 'Nombre propietario',
                            labelStyle: TextStyle(color: Color(0xFF19AA89),fontWeight: FontWeight.w600),
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          enabled: false, 
                          controller: _correoPropietarioController,
                          keyboardType: TextInputType.name,
                          decoration:const InputDecoration(
                            labelText: 'Correo',
                            labelStyle: TextStyle(color: Color(0xFF19AA89),fontWeight: FontWeight.w600),
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          enabled: false, 
                          controller: _telefonoPropietarioController,
                          keyboardType: TextInputType.name,
                          decoration:const InputDecoration(
                            labelText: 'Telefono',
                            labelStyle: TextStyle(color: Color(0xFF19AA89),fontWeight: FontWeight.w600),
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          controller: _nombrePredioController,
                          keyboardType: TextInputType.name,
                          decoration:const InputDecoration(
                            labelText: 'Nombre del predio',
                            labelStyle: TextStyle(color: Color(0xFF19AA89),fontWeight: FontWeight.w600),
                          ),
                          validator: (String? value){
                            if (value ==null || value.isEmpty) {
                              return "Campo requerido";
                            }
                            return null;
                          }
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          controller: _corregimientoVeredaController,
                          keyboardType: TextInputType.name,
                          decoration:const  InputDecoration(
                            labelText: 'Corregimiento/Vereda',
                            labelStyle: TextStyle(color: Color(0xFF19AA89),fontWeight: FontWeight.w600),
                          ),
                          validator: (String? value){
                            if (value ==null || value.isEmpty) {
                              return "Campo requerido";
                            }
                            return null;
                          }
                        ),
                        const SizedBox(height: 10),
                        DropdownButtonFormField<String>(
                          value: _departamentoController.text,
                          onChanged: (String? newValue) {
                            setState(() {
                              _departamentoController.text = newValue!;
                              _municipioController.text = '';
                              cargarMunicipios(_departamentoController.text);
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
                            if (value == null||value.isEmpty ||value == 'Seleccione') {
                              return 'Por favor, selecciona un departamento';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 10),
                        DropdownButtonFormField<String>(
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
                            ...municipios.map((role) {
                              return DropdownMenuItem<String>(value: role, child: Text(role));
                            }).toList(),
                          ],
                          validator: (value) {
                            if (value == null||value.isEmpty ||value == 'Seleccione' ) {
                              return 'Por favor, selecciona un municipio';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          controller: _cultivoController,
                          keyboardType: TextInputType.name,
                          decoration: const InputDecoration(
                            labelText: 'Cultivo',
                            labelStyle: TextStyle(color: Color(0xFF19AA89),fontWeight: FontWeight.w600),
                          ),
                          validator: (String? value){
                            if (value ==null || value.isEmpty) {
                              return "Campo requerido";
                            }
                            return null;
                          }
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          controller: _variedadController,
                          keyboardType: TextInputType.name,
                          decoration:const InputDecoration(
                            labelText: 'Variedad',
                            labelStyle: TextStyle(color: Color(0xFF19AA89),fontWeight: FontWeight.w600),
                          ),
                          validator: (String? value){
                            if (value ==null || value.isEmpty) {
                              return "Campo requerido";
                            }
                            return null;
                          }
                        ),
                        const SizedBox(height: 10),
                        DropdownButtonFormField<String>(
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
                            if (value == null||value.isEmpty ||value == 'Seleccione') {
                              return 'Por favor, selecciona una edad';
                            }
                            return null;
                          },
                        ),
                      ],
                    )
                  )
                ),
                const SizedBox(height: 20),
                RegistrarseButtom(onTap: _handleRegistroPredio),
              ],
            ),
          ),
        ),
      ),
    );
  }

  int generateUniqueID() {
    return Random().nextInt(1000000);
  }

// Función para verificar si el ID ya existe en la base de datos
  

  void _handleRegistroPredio() async {
    if (formKey.currentState!.validate()) {
      
      int idPredio = generateUniqueID(); // Genera un ID único
      bool isUnique = await _serviceFirebase.isIDUnique(idPredio.toString());
      while (!isUnique) {
        idPredio = generateUniqueID();
        isUnique = await _serviceFirebase.isIDUnique(idPredio.toString());
      }

      Predio predio = Predio(id:idPredio.toString(),
        idPropietario: _identificacionPropietarioController.text,
        nombrePropietario: _nombrePropietarioController.text,
        correoPropietario: _correoPropietarioController.text,
        telefonoPropietario: _telefonoPropietarioController.text,
        nombre: _nombrePredioController.text,
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
          return const MensajeShowDialog(title: "Registro Exitoso",message: "Se registró correctamente el predio");
        },
      );
      FormUtils.clearTextControllers([_identificacionPropietarioController,_nombrePropietarioController,_correoPropietarioController,_telefonoPropietarioController,_nombrePredioController,_corregimientoVeredaController,
        _departamentoController,_municipioController,_cultivoController,_variedadController,_edadController 
      ]);
      FocusScope.of(context).unfocus();
    }
  }
}

class RegistrarseButtom extends StatelessWidget {
  
  final VoidCallback _onTap;

  const RegistrarseButtom({
    super.key,
    required VoidCallback onTap
  }):_onTap = onTap;
  

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: ElevatedButton(
        onPressed: _onTap,
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
