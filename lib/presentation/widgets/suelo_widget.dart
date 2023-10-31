import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mixcosechas_app/model/pruebaSuelo.dart';
import 'package:mixcosechas_app/presentation/widgets/search_predio.dart';
import 'package:mixcosechas_app/presentation/widgets/show_result.dart';
import '../../services/firebase_service.dart';
import 'input_variables.dart';
import 'mensaje_show_dialog.dart';

class SueloWidget extends StatefulWidget {
  const SueloWidget({
    super.key,
  });

  @override
  State<SueloWidget> createState() => _SueloWidgetState();
}

class _SueloWidgetState extends State<SueloWidget> {
  int currentState = 0;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final ServiceFirebase _serviceFirebase = ServiceFirebase();
  final TextEditingController _nController = TextEditingController();
  final TextEditingController _nh4Controller = TextEditingController();
  final TextEditingController _no2Controller = TextEditingController();
  final TextEditingController _no3Controller = TextEditingController();
  final TextEditingController _pController = TextEditingController();
  final TextEditingController _kController = TextEditingController();
  final TextEditingController _caController = TextEditingController();
  final TextEditingController _mgController = TextEditingController();
  final TextEditingController _sController = TextEditingController();
  final TextEditingController _so4Controller = TextEditingController();
  final TextEditingController _feController = TextEditingController();
  final TextEditingController _mnController = TextEditingController();
  final TextEditingController _cuController = TextEditingController();
  final TextEditingController _alController = TextEditingController();
  final TextEditingController _clController = TextEditingController();
  final TextEditingController _znController = TextEditingController();
  final TextEditingController _naController = TextEditingController();
  final TextEditingController _salesdisueltasController =
      TextEditingController();
  final TextEditingController _phController = TextEditingController();
  final TextEditingController _ceController = TextEditingController();
  final TextEditingController _ciceController = TextEditingController();
  final TextEditingController _arcillaController = TextEditingController();
  final TextEditingController _limoController = TextEditingController();
  final TextEditingController _arenaController = TextEditingController();
  final TextEditingController _humusController = TextEditingController();

  //*INFORMACION DEL PREDIO */
  final TextEditingController _nombrePredioController = TextEditingController();
  CollectionReference prediosCollection =
      FirebaseFirestore.instance.collection('Predios');

  final TextEditingController _corregimientoPredioController =
      TextEditingController();
  final TextEditingController _cultivoPredioController =
      TextEditingController();
  final TextEditingController _municipioPredioController =
      TextEditingController();
  final TextEditingController _variedadPredioController =
      TextEditingController();
  final TextEditingController _dptoPredioController = TextEditingController();
  final TextEditingController _edadPredioController = TextEditingController();
  final TextEditingController _nombrepropietarioPredioController =
      TextEditingController();
  final TextEditingController _telefonopropietarioPredioController =
      TextEditingController();
  final TextEditingController _correopropietarioPredioController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: formKey,
        child: Theme(
            data: Theme.of(context).copyWith(
              colorScheme: const ColorScheme.light(primary: Color(0xFF19AA89)),
            ),
            child: Stepper(
                physics: const ScrollPhysics(),
                currentStep: currentState,
                onStepTapped: (index) {
                  setState(() => currentState = index);
                },
                controlsBuilder:
                    (BuildContext context, ControlsDetails details) {
                  return Container();
                },
                steps: [
                  Step(
                    isActive: currentState >= 0,
                    title: const Text('Informacion del predio'),
                    content: SearchPredio(
                        predioFilterController: _nombrePredioController,
                        prediosCollection: prediosCollection,
                        corregimientoPredioController:
                            _corregimientoPredioController,
                        cultivoPredioController: _cultivoPredioController,
                        municipioPredioController: _municipioPredioController,
                        variedadPredioController: _variedadPredioController,
                        dptoPredioController: _dptoPredioController,
                        edadPredioController: _edadPredioController,
                        nombrepropietarioPredioController:
                            _nombrepropietarioPredioController,
                        telefonopropietarioPredioController:
                            _telefonopropietarioPredioController,
                        correopropietarioPredioController:
                            _correopropietarioPredioController),
                  ),
                  Step(
                    isActive: currentState >= 1,
                    title: const Text('Macronutrientes'),
                    content: Column(
                      children: [
                        ImputVariable(
                            nombreVariable: 'Nitrato de Nitrógeno - N',
                            controller: _nController),
                        ImputVariable(
                            nombreVariable: 'Nitrógeno amoniacal - NH4+',
                            controller: _nh4Controller),
                        ImputVariable(
                            nombreVariable: 'Nitritos - NO2',
                            controller: _no2Controller),
                        ImputVariable(
                            nombreVariable: 'Nitratos - NO3',
                            controller: _no3Controller),
                        ImputVariable(
                            nombreVariable: 'Fósforo - P',
                            controller: _pController),
                        ImputVariable(
                            nombreVariable: 'Potasio - K',
                            controller: _kController),
                        ImputVariable(
                            nombreVariable: 'Calcio - Ca',
                            controller: _caController),
                        ImputVariable(
                            nombreVariable: 'Magnesio - Mg',
                            controller: _mgController),
                        ImputVariable(
                            nombreVariable: 'Azufre - S',
                            controller: _sController),
                        ImputVariable(
                            nombreVariable: 'Sulfato - SO4',
                            controller: _so4Controller),
                      ],
                    ),
                  ),
                  Step(
                      isActive: currentState >= 2,
                      title: const Text('Micronutrientes'),
                      content: Column(
                        children: [
                          ImputVariable(
                              nombreVariable: 'Hierro Férrico - Fe',
                              controller: _feController),
                          ImputVariable(
                              nombreVariable: 'Manganeso - Mn',
                              controller: _mnController),
                          ImputVariable(
                              nombreVariable: 'Cobre - Cu',
                              controller: _cuController),
                          ImputVariable(
                              nombreVariable: 'Aluminio - Al',
                              controller: _alController),
                          ImputVariable(
                              nombreVariable: 'Cloruro - Cl',
                              controller: _clController),
                          ImputVariable(
                              nombreVariable: 'Zinc - Zn',
                              controller: _znController),
                          ImputVariable(
                              nombreVariable: 'Sodio - Na',
                              controller: _naController),
                          ImputVariable(
                              nombreVariable: 'Sales Disueltas',
                              controller: _salesdisueltasController),
                        ],
                      )),
                  Step(
                      isActive: currentState >= 3,
                      title: const Text('Extra'),
                      content: Column(
                        children: [
                          ImputVariable(
                              nombreVariable: 'Ph', controller: _phController),
                          ImputVariable(
                              nombreVariable: 'C.E', controller: _ceController),
                          ImputVariable(
                              nombreVariable: 'C.I.C.E',
                              controller: _ciceController),
                          ImputVariable(
                              nombreVariable: 'Arcilla %',
                              controller: _arcillaController),
                          ImputVariable(
                              nombreVariable: 'Limo %',
                              controller: _limoController),
                          ImputVariable(
                              nombreVariable: 'Arena %',
                              controller: _arenaController),
                          DropdownButtonFormField<String>(
                            value: _humusController.text,
                            onChanged: (String? newValue) {
                              setState(() {
                                _humusController.text = newValue!;
                              });
                            },
                            decoration: const InputDecoration(
                              labelText: 'Humus',
                              labelStyle: TextStyle(
                                  color: Color(0xFF19AA89),
                                  fontWeight: FontWeight.w600),
                            ),
                            items: [
                              const DropdownMenuItem<String>(
                                value: '',
                                child: Text(
                                    'Seleccione'), // O cualquier otro texto que desees
                              ),
                              ...['1', '2', '3', '4', '5'].map((role) {
                                return DropdownMenuItem<String>(
                                    value: role, child: Text(role));
                              }).toList(),
                            ],
                            validator: (value) {
                              if (value == null ||
                                  value.isEmpty ||
                                  value == 'Seleccione') {
                                return 'Por favor, seleccione un valor';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 20),
                          RegistrarPruebasButtom(onTap: _handleRegistroSuelo),
                        ],
                      )),
                ])));
  }

  void _handleRegistroSuelo() {
    if (_nombrePredioController.text.isNotEmpty &&
        _corregimientoPredioController.text.isNotEmpty &&
        _cultivoPredioController.text.isNotEmpty &&
        _municipioPredioController.text.isNotEmpty &&
        _variedadPredioController.text.isNotEmpty &&
        _dptoPredioController.text.isNotEmpty &&
        _edadPredioController.text.isNotEmpty &&
        _nombrepropietarioPredioController.text.isNotEmpty &&
        _telefonopropietarioPredioController.text.isNotEmpty &&
        _correopropietarioPredioController.text.isNotEmpty) {
      if (formKey.currentState!.validate()) {
        //Todo: LOGICA PARA EL ANALISIS Y REGISTRO
        PruebaSuelo pruebaSuelo = PruebaSuelo(
            nombrePredio: _nombrePredioController.text,
            corregimientoPredio: _corregimientoPredioController.text,
            cultivoPredio: _cultivoPredioController.text,
            municipioPredio: _municipioPredioController.text,
            variedadPredio: _variedadPredioController.text,
            dptoPredio: _dptoPredioController.text,
            edadPredio: _edadPredioController.text,
            nombrepropietario: _nombrepropietarioPredioController.text,
            telefonopropietario: _telefonopropietarioPredioController.text,
            correopropietario: _correopropietarioPredioController.text,
            n: double.parse(_nController.text),
            nh4: double.parse(_nh4Controller.text),
            no2: double.parse(_no2Controller.text),
            no3: double.parse(_no3Controller.text),
            p: double.parse(_pController.text),
            k: double.parse(_kController.text),
            ca: double.parse(_caController.text),
            mg: double.parse(_mgController.text),
            s: double.parse(_sController.text),
            so4: double.parse(_so4Controller.text),
            fe: double.parse(_feController.text),
            mn: double.parse(_mnController.text),
            cu: double.parse(_cuController.text),
            al: double.parse(_alController.text),
            cl: double.parse(_clController.text),
            zn: double.parse(_znController.text),
            na: double.parse(_naController.text),
            ph: double.parse(_phController.text),
            ce: double.parse(_ceController.text),
            salesDisueltas: double.parse(_salesdisueltasController.text),
            cice: double.parse(_ciceController.text),
            arcilla: double.parse(_arcillaController.text),
            limo: double.parse(_limoController.text),
            arena: double.parse(_arenaController.text),
            humus: double.parse(_humusController.text));

        _serviceFirebase.addPruebaSuelo(pruebaSuelo);

        final List<String> nombreCompuestos = pruebaSuelo.nombreCompuestos;

        final List<double> valorCompuestos = pruebaSuelo.valorCompuestos;

        final List<String> interpretacionCompuestos =
            pruebaSuelo.interpretacionCompuestos;

        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ShowResult(
                  nombreCompuestos: nombreCompuestos,
                  valorCompuestos: valorCompuestos,
                  interpretacionCompuestos: interpretacionCompuestos)),
        );
      } else {
        showDialog(
          context: context,
          builder: (context) {
            return const AlertDialog(
              title: Text("Upss!"),
              content: Text("Debes llenar todos los campos"),
            );
          },
        );
      }
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return const MensajeShowDialog(
              title: "Ups!", message: "Debes elegir un propietario");
        },
      );
    }
  }
}

class RegistrarPruebasButtom extends StatelessWidget {
  const RegistrarPruebasButtom({super.key, required VoidCallback onTap})
      : _onTap = onTap;
  final VoidCallback _onTap;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: _onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF19AA89),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
        ),
        child: const Text(
          'Registrar analisis',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Color(0XFFeeeeee),
          ),
        ),
      ),
    );
  }
}
