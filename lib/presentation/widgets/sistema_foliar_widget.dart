import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mixcosechas_app/model/pruebaSistemaFoliar.dart';
import 'package:mixcosechas_app/presentation/widgets/search_predio.dart';
import 'package:quickalert/quickalert.dart';

import '../../services/firebase_service.dart';
import 'messages/quickalert_msg.dart';

class SistemaFoliarWidget extends StatefulWidget {
  const SistemaFoliarWidget({
    super.key,
  });

  @override
  State<SistemaFoliarWidget> createState() => _SistemaFoliarWidgetState();
}

class _SistemaFoliarWidgetState extends State<SistemaFoliarWidget> {
  int currentState = 0;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final ServiceFirebase _serviceFirebase = ServiceFirebase();
  final TextEditingController _caController = TextEditingController();
  final TextEditingController _mgController = TextEditingController();
  final TextEditingController _naController = TextEditingController();
  final TextEditingController _kController = TextEditingController();
  final TextEditingController _nController = TextEditingController();
  final TextEditingController _pController = TextEditingController();
  final TextEditingController _feController = TextEditingController();
  final TextEditingController _cuController = TextEditingController();
  final TextEditingController _znController = TextEditingController();
  final TextEditingController _mnController = TextEditingController();
  final TextEditingController _bController = TextEditingController();

  //*INFORMACION DEL PREDIO */
  final TextEditingController _nombrePredioController = TextEditingController();
  CollectionReference prediosCollection =FirebaseFirestore.instance.collection('Predios');

  final TextEditingController _idPredioController =TextEditingController();
  final TextEditingController _corregimientoPredioController =TextEditingController();
  final TextEditingController _cultivoPredioController =TextEditingController();
  final TextEditingController _municipioPredioController =TextEditingController();
  final TextEditingController _variedadPredioController =TextEditingController();
  final TextEditingController _dptoPredioController = TextEditingController();
  final TextEditingController _edadPredioController = TextEditingController();
  final TextEditingController _idpropietarioPredioController =TextEditingController();
  final TextEditingController _nombrepropietarioPredioController =TextEditingController();
  final TextEditingController _telefonopropietarioPredioController =TextEditingController();
  final TextEditingController _correopropietarioPredioController =TextEditingController();
  final TextEditingController _latitudPredioController = TextEditingController();
  final TextEditingController _longitudPredioController = TextEditingController();
  final TextEditingController _msnmPredioController = TextEditingController();
  final TextEditingController _profundidadSBPredioController = TextEditingController();
  final TextEditingController _puntosPredioController = TextEditingController();
  final TextEditingController _temperaturaPredioController = TextEditingController();
  final TextEditingController _lotesPredioController = TextEditingController();

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
              controlsBuilder: (BuildContext context, ControlsDetails details) {
                return Container();
              },
              steps: [
                Step(
                  isActive: currentState >= 0,
                  title: const Text('Informacion del predio'),
                  content: SearchPredio(
                      predioFilterController: _nombrePredioController,
                      prediosCollection: prediosCollection,
                      idPredioController:_idPredioController,
                      corregimientoPredioController:_corregimientoPredioController,
                     // cultivoPredioController: _cultivoPredioController,
                      municipioPredioController: _municipioPredioController,
                    //  variedadPredioController: _variedadPredioController,
                      dptoPredioController: _dptoPredioController,
                    //  edadPredioController: _edadPredioController,
                      idpropietarioPredioController:_idpropietarioPredioController,
                      nombrepropietarioPredioController:_nombrepropietarioPredioController,
                      telefonopropietarioPredioController:_telefonopropietarioPredioController,
                      correopropietarioPredioController:_correopropietarioPredioController,
                      latitudPredioController: _latitudPredioController,
                      longitudPredioController: _longitudPredioController,
                      msnmPredioController: _msnmPredioController,
                      profundidadSBPredioController:_profundidadSBPredioController,
                      puntosPredioController: _puntosPredioController,
                      temperaturaPredioController:_temperaturaPredioController,
                      lotesPredioController: _lotesPredioController),
                ),
                Step(
                  isActive: currentState >= 1,
                  title: const Text('Macronutrientes'),
                  content: Column(
                    children: [
                      DropdownButtonFormField<String>(
                        value: _caController.text,
                        onChanged: (String? newValue) {
                          setState(() {
                            _caController.text = newValue!;
                          });
                        },
                        decoration: const InputDecoration(
                          labelText: 'Calcio - Ca',
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
                          ...['Presente', 'No Presente'].map((role) {
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
                      DropdownButtonFormField<String>(
                        value: _mgController.text,
                        onChanged: (String? newValue) {
                          setState(() {
                            _mgController.text = newValue!;
                          });
                        },
                        decoration: const InputDecoration(
                          labelText: 'Magnesio - Mg',
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
                          ...['Presente', 'No Presente'].map((role) {
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
                      DropdownButtonFormField<String>(
                        value: _naController.text,
                        onChanged: (String? newValue) {
                          setState(() {
                            _naController.text = newValue!;
                          });
                        },
                        decoration: const InputDecoration(
                          labelText: 'Sodio - Na',
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
                          ...['Presente', 'No Presente'].map((role) {
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
                      DropdownButtonFormField<String>(
                        value: _kController.text,
                        onChanged: (String? newValue) {
                          setState(() {
                            _kController.text = newValue!;
                          });
                        },
                        decoration: const InputDecoration(
                          labelText: 'Potasio - K',
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
                          ...['Presente', 'No Presente'].map((role) {
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
                      DropdownButtonFormField<String>(
                        value: _nController.text,
                        onChanged: (String? newValue) {
                          setState(() {
                            _nController.text = newValue!;
                          });
                        },
                        decoration: const InputDecoration(
                          labelText: 'Nitrógeno - N',
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
                          ...['Presente', 'No Presente'].map((role) {
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
                      DropdownButtonFormField<String>(
                        value: _pController.text,
                        onChanged: (String? newValue) {
                          setState(() {
                            _pController.text = newValue!;
                          });
                        },
                        decoration: const InputDecoration(
                          labelText: 'Fósforo - P',
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
                          ...['Presente', 'No Presente'].map((role) {
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
                    ],
                  ),
                ),
                Step(
                    isActive: currentState >= 2,
                    title: const Text('Micronutrientes'),
                    content: Column(
                      children: [
                        DropdownButtonFormField<String>(
                          value: _feController.text,
                          onChanged: (String? newValue) {
                            setState(() {
                              _feController.text = newValue!;
                            });
                          },
                          decoration: const InputDecoration(
                            labelText: 'Hierro Férrico - Fe',
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
                            ...['Presente', 'No Presente'].map((role) {
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
                        DropdownButtonFormField<String>(
                          value: _cuController.text,
                          onChanged: (String? newValue) {
                            setState(() {
                              _cuController.text = newValue!;
                            });
                          },
                          decoration: const InputDecoration(
                            labelText: 'Cobre - Cu',
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
                            ...['Presente', 'No Presente'].map((role) {
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
                        DropdownButtonFormField<String>(
                          value: _znController.text,
                          onChanged: (String? newValue) {
                            setState(() {
                              _znController.text = newValue!;
                            });
                          },
                          decoration: const InputDecoration(
                            labelText: 'Zinc - Zn',
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
                            ...['Presente', 'No Presente'].map((role) {
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
                        DropdownButtonFormField<String>(
                          value: _mnController.text,
                          onChanged: (String? newValue) {
                            setState(() {
                              _mnController.text = newValue!;
                            });
                          },
                          decoration: const InputDecoration(
                            labelText: 'Manganeso - Mn',
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
                            ...['Presente', 'No Presente'].map((role) {
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
                        DropdownButtonFormField<String>(
                          value: _bController.text,
                          onChanged: (String? newValue) {
                            setState(() {
                              _bController.text = newValue!;
                            });
                          },
                          decoration: const InputDecoration(
                            labelText: 'Boro - B',
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
                            ...['Presente', 'No Presente'].map((role) {
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
                        RegistrarPruebasButtom(onTap: _handleRegistroAgua),
                      ],
                    )),
              ],
            )));
  }

  void _handleRegistroAgua() {
    if (_idPredioController.text.isNotEmpty &&
      _nombrePredioController.text.isNotEmpty &&
      _corregimientoPredioController.text.isNotEmpty &&
      _cultivoPredioController.text.isNotEmpty &&
      _municipioPredioController.text.isNotEmpty &&
      _variedadPredioController.text.isNotEmpty &&
      _dptoPredioController.text.isNotEmpty &&
      _edadPredioController.text.isNotEmpty &&
      _idpropietarioPredioController.text.isNotEmpty &&
      _nombrepropietarioPredioController.text.isNotEmpty &&
      _telefonopropietarioPredioController.text.isNotEmpty &&
      _correopropietarioPredioController.text.isNotEmpty) {
      if (formKey.currentState!.validate()) {
        //Todo: LOGICA PARA EL ANALISIS Y REGISTRO
        PruebaSistemaFoliar pruebaSistemaFoliar = PruebaSistemaFoliar(
          idPredio: _idPredioController.text,
          nombrePredio: _nombrePredioController.text,
          corregimientoPredio: _corregimientoPredioController.text,
          cultivoPredio: _cultivoPredioController.text,
          municipioPredio: _municipioPredioController.text,
          variedadPredio: _variedadPredioController.text,
          dptoPredio: _dptoPredioController.text,
          edadPredio: _edadPredioController.text,
          idPropietario: _idpropietarioPredioController.text,
          nombrepropietario: _nombrepropietarioPredioController.text,
          telefonopropietario: _telefonopropietarioPredioController.text,
          correopropietario: _correopropietarioPredioController.text,
          ca: _caController.text,
          mg: _mgController.text,
          na: _naController.text,
          k: _kController.text,
          n: _nController.text,
          p: _pController.text,
          fe: _feController.text,
          cu: _cuController.text,
          zn: _znController.text,
          mn: _mnController.text,
          b: _bController.text,
        );

        _serviceFirebase.addPruebaSistemaFoliar(pruebaSistemaFoliar);
        
        QuickAlertDialog.showAlert(context, QuickAlertType.success,"Se registró la prueba correctamente");
        _idPredioController.text = '';
        _nombrePredioController.text = '';
        _corregimientoPredioController.text = '';
        _cultivoPredioController.text = '';
        _municipioPredioController.text = '';
        _variedadPredioController.text = '';
        _dptoPredioController.text = '';
        _edadPredioController.text = '';
        _idpropietarioPredioController.text = '';
        _nombrepropietarioPredioController.text = '';
        _telefonopropietarioPredioController.text = '';
        _correopropietarioPredioController.text = '';

        _caController.text = '';
        _mgController.text = '';
        _naController.text = '';
        _kController.text = '';
        _nController.text = '';
        _pController.text = '';
        _feController.text = '';
        _cuController.text = '';
        _znController.text = '';
        _mnController.text = '';
        _bController.text = '';
        FocusScope.of(context).unfocus();
      } else {
        QuickAlertDialog.showAlert(context, QuickAlertType.error,"Debes llenar todos los campos");
      }
    } else {
      QuickAlertDialog.showAlert(context, QuickAlertType.warning,"Debes elegir un predio");
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
