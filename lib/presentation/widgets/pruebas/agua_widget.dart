// ignore_for_file: use_build_context_synchronously

import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mixcosechas_app/model/pruebaAgua.dart';
import 'package:mixcosechas_app/presentation/widgets/btm_continuar.dart';
import 'package:mixcosechas_app/presentation/widgets/input_variables.dart';
import 'package:mixcosechas_app/presentation/widgets/messages/quickalert_msg.dart';
import 'package:mixcosechas_app/presentation/widgets/pruebas/next_step/show_agua_inter.dart';
import 'package:mixcosechas_app/presentation/widgets/search_predio.dart';
import 'package:mixcosechas_app/services/firebase_service.dart';
import 'package:quickalert/models/quickalert_type.dart';

class AguaWidget extends StatefulWidget {
  const AguaWidget({
    super.key,
  });

  @override
  State<AguaWidget> createState() => _AguaWidgetState();
}

class _AguaWidgetState extends State<AguaWidget> {
  int currentState = 0;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController _fechaTomaMuestraController =TextEditingController();
  final TextEditingController _fechaRecibidoController =TextEditingController();

  final TextEditingController _loteController = TextEditingController();
  final TextEditingController _cultivoController = TextEditingController();
  final TextEditingController _variedadController = TextEditingController();
  final TextEditingController _edadController = TextEditingController();

  final TextEditingController _nh4Controller = TextEditingController();
  final TextEditingController _no2Controller = TextEditingController();
  final TextEditingController _no3Controller = TextEditingController();
  final TextEditingController _pController = TextEditingController();
  final TextEditingController _kController = TextEditingController();
  final TextEditingController _caController = TextEditingController();
  final TextEditingController _mgController = TextEditingController();
  final TextEditingController _so4Controller = TextEditingController();
  final TextEditingController _feController = TextEditingController();
  final TextEditingController _mnController = TextEditingController();
  final TextEditingController _cuController = TextEditingController();
  final TextEditingController _clController = TextEditingController();
  final TextEditingController _salesdisueltasController =TextEditingController();
  final TextEditingController _phController = TextEditingController();
  final TextEditingController _ceController = TextEditingController();
  final TextEditingController _fuenteaguaController = TextEditingController();

  //*INFORMACION DEL PREDIO */
  final ServiceFirebase _serviceFirebase = ServiceFirebase();
  final TextEditingController _nombrePredioController = TextEditingController();
  CollectionReference prediosCollection =FirebaseFirestore.instance.collection('Predios');

  final TextEditingController _idPredioController = TextEditingController();
  final TextEditingController _corregimientoPredioController =TextEditingController();
  final TextEditingController _municipioPredioController =TextEditingController();
  final TextEditingController _dptoPredioController = TextEditingController();

  final TextEditingController _idpropietarioPredioController =TextEditingController();
  final TextEditingController _nombrepropietarioPredioController =TextEditingController();
  final TextEditingController _telefonopropietarioPredioController =TextEditingController();
  final TextEditingController _correopropietarioPredioController =TextEditingController();

  final TextEditingController _latitudPredioController =TextEditingController();
  final TextEditingController _longitudPredioController =TextEditingController();
  final TextEditingController _msnmPredioController = TextEditingController();
  final TextEditingController _profundidadSBPredioController =TextEditingController();
  final TextEditingController _puntosPredioController = TextEditingController();
  final TextEditingController _temperaturaPredioController =TextEditingController();
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
                      idPredioController: _idPredioController,
                      corregimientoPredioController:
                          _corregimientoPredioController,
                      municipioPredioController: _municipioPredioController,
                      dptoPredioController: _dptoPredioController,
                      idpropietarioPredioController:
                          _idpropietarioPredioController,
                      nombrepropietarioPredioController:
                          _nombrepropietarioPredioController,
                      telefonopropietarioPredioController:
                          _telefonopropietarioPredioController,
                      correopropietarioPredioController:
                          _correopropietarioPredioController,
                      latitudPredioController: _latitudPredioController,
                      longitudPredioController: _longitudPredioController,
                      msnmPredioController: _msnmPredioController,
                      profundidadSBPredioController:
                          _profundidadSBPredioController,
                      puntosPredioController: _puntosPredioController,
                      temperaturaPredioController: _temperaturaPredioController,
                      lotesPredioController: _lotesPredioController),
                ),
                Step(
                  isActive: currentState >= 1,
                  title: const Text('Información de la prueba'),
                  content: Column(
                    children: [
                      TextField(
                        controller:
                            _fechaTomaMuestraController, //editing controller of this TextField
                        decoration: const InputDecoration(
                            icon:
                                Icon(Icons.calendar_today), //icon of text field
                            labelText:
                                "Fecha Toma de Muestra" //label text of field
                            ),
                        readOnly:
                            true, //set it true, so that user will not able to edit text
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(
                                  2000), //DateTime.now() - not to allow to choose before today.
                              lastDate: DateTime(2101));

                          if (pickedDate != null) {
                            String formattedDate =DateFormat('yyyy-MM-dd').format(pickedDate);
                            setState(() {
                              _fechaTomaMuestraController.text =
                                  formattedDate; //set output date to TextField value.
                            });
                          } else {
                            QuickAlertDialog.showAlert(
                                context, QuickAlertType.error, 
                                "Fecha no seleccionada");
                          }
                        },
                      ),
                      TextField(
                        controller: _fechaRecibidoController,
                        decoration: const InputDecoration(
                            icon:
                                Icon(Icons.calendar_today), //icon of text field
                            labelText:
                                "Fecha Muestra Recibida" //label text of field
                            ),
                        readOnly:
                            true,
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(
                                  2000), 
                              lastDate: DateTime(2101));

                          if (pickedDate != null) {
                            String formattedDate =
                                DateFormat('yyyy-MM-dd').format(pickedDate);

                            setState(() {
                              _fechaRecibidoController.text =
                                  formattedDate;
                            });
                          } else {
                            QuickAlertDialog.showAlert(
                                context, QuickAlertType.error, 
                                "Fecha no seleccionada");
                          }
                        },
                      ),
                      TextFormField(
                          controller: _cultivoController,
                          keyboardType: TextInputType.text,
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
                        TextFormField(
                          controller: _variedadController,
                          keyboardType: TextInputType.text,
                          decoration: const InputDecoration(
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
                      TextFormField(
                          controller: _loteController,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            labelText: "Lote_",
                            labelStyle: TextStyle(color: Color(0xFF19AA89),fontWeight: FontWeight.w600),
                          ),
                          validator: (String? value){
                            if (value ==null || value.isEmpty) {
                              return "Campo requerido";
                            }else if(int.parse(value) > int.parse(_lotesPredioController.text)){
                              return "El lote excede el numero de lotes del predio";
                              
                            }
                            return null;
                          }
                        ),
                    ],
                  ),
                ),
                Step(
                  isActive: currentState >= 2,
                  title: const Text('Macronutrientes'),
                  content: Column(
                    children: [
                      //ImputVariable(nombreVariable: 'Nitrato de Nitrógeno - N',controller: _nController),
                      DropdownButtonFormField<String>(
                        value: _fuenteaguaController.text,
                        onChanged: (String? newValue) {
                          setState(() {
                            _fuenteaguaController.text = newValue!;
                          });
                        },
                        decoration: const InputDecoration(
                          labelText: 'Fuente de agua',
                          labelStyle: TextStyle(
                              color: Color(0xFF19AA89),
                              fontWeight: FontWeight.w600),
                        ),
                        items: [
                          const DropdownMenuItem<String>(
                            value: '',
                            child: Text('Seleccione'),
                          ),
                          ...[
                            'Conduccion',
                            'Rio',
                            'Manantial',
                            'Lluvia',
                            'Cienega',
                            'Arroyos',
                            'Pozo',
                            'Lago',
                            'Estanque',
                            'Jaguey'
                          ].map((role) {
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
                          nombreVariable: 'Sulfato - SO4',
                          controller: _so4Controller),
                    ],
                  ),
                ),
                Step(
                    isActive: currentState >= 3,
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
                            nombreVariable: 'Cloruro - Cl',
                            controller: _clController),
                        ImputVariable(
                            nombreVariable: 'Sales Disueltas',
                            controller: _salesdisueltasController),
                        ImputVariable(
                            nombreVariable: 'Ph', controller: _phController),
                        ImputVariable(
                            nombreVariable: 'C.E', controller: _ceController),
                        const SizedBox(height: 20),
                        ContinuarPruebasButtom(onTap: _handleRegistroAgua),
                      ],
                    )),
              ],
            )));
  }

  int generateUniqueID() {
    return Random().nextInt(1000000);
  }

  void _handleRegistroAgua() async {
    if (_idPredioController.text.isNotEmpty &&
        _nombrePredioController.text.isNotEmpty &&
        _corregimientoPredioController.text.isNotEmpty &&
        _municipioPredioController.text.isNotEmpty &&
        _dptoPredioController.text.isNotEmpty &&
        _latitudPredioController.text.isNotEmpty &&
        _longitudPredioController.text.isNotEmpty &&
        _msnmPredioController.text.isNotEmpty &&
        _profundidadSBPredioController.text.isNotEmpty &&
        _puntosPredioController.text.isNotEmpty &&
        _temperaturaPredioController.text.isNotEmpty &&
        _lotesPredioController.text.isNotEmpty &&
        _idpropietarioPredioController.text.isNotEmpty &&
        _nombrepropietarioPredioController.text.isNotEmpty &&
        _telefonopropietarioPredioController.text.isNotEmpty &&
        _correopropietarioPredioController.text.isNotEmpty) {
      if (formKey.currentState!.validate()) {
        //Todo: LOGICA PARA EL ANALISIS Y REGISTRO

        int idPrueba = generateUniqueID(); // Genera un ID único
        bool isUnique =
            await _serviceFirebase.isIDUniquePruebaAgua(idPrueba.toString());
        while (!isUnique) {
          idPrueba = generateUniqueID();
          isUnique =
              await _serviceFirebase.isIDUniquePruebaAgua(idPrueba.toString());
        }

        PruebaAgua pruebaAgua = PruebaAgua(
            idPrueba: idPrueba.toString(),
            idPredio: _idPredioController.text,
            nombrePredio: _nombrePredioController.text,
            corregimientoPredio: _corregimientoPredioController.text,
            municipioPredio: _municipioPredioController.text,
            dptoPredio: _dptoPredioController.text,
            latitud: _latitudPredioController.text,
            longitud: _longitudPredioController.text,
            msnm: _msnmPredioController.text,
            profundidadSB: _profundidadSBPredioController.text,
            puntos: _puntosPredioController.text,
            temperatura: _temperaturaPredioController.text,
            lotes: int.parse(_lotesPredioController.text),
            cultivo: _cultivoController.text,
            variedad: _variedadController.text,
            edad: _edadController.text,
            idPropietario: _idpropietarioPredioController.text,
            nombrepropietario: _nombrepropietarioPredioController.text,
            telefonopropietario: _telefonopropietarioPredioController.text,
            correopropietario: _correopropietarioPredioController.text,
            lote: _loteController.text,
            fechaRecibido: _fechaRecibidoController.text,
            fechaTomaMuestra: _fechaTomaMuestraController.text,
            fechaPrueba: '${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}',
            interpretacion: '',
            recomendaciones: '',
            restricciones: '',
            //N: double.parse(_nController.text),
            nh4: double.parse(_nh4Controller.text),
            no2: double.parse(_no2Controller.text),
            no3: double.parse(_no3Controller.text),
            p: double.parse(_pController.text),
            k: double.parse(_kController.text),
            ca: double.parse(_caController.text),
            mg: double.parse(_mgController.text),
            so4: double.parse(_so4Controller.text),
            fe: double.parse(_feController.text),
            mn: double.parse(_mnController.text),
            cu: double.parse(_cuController.text),
            cl: double.parse(_clController.text),
            ph: double.parse(_phController.text),
            ce: double.parse(_ceController.text),
            salesDisueltas: double.parse(_salesdisueltasController.text),
            tipoAgua: _fuenteaguaController.text);

        final List<String> nombreCompuestos = pruebaAgua.nombreCompuestos;
        final List<double> valorCompuestos = pruebaAgua.valorCompuestos;
        final List<String> interpretacionCompuestos =
            pruebaAgua.interpretacionCompuestos;

        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ShowAgua(
                  pruebaagua: pruebaAgua,
                  nombreCompuestos: nombreCompuestos,
                  valorCompuestos: valorCompuestos,
                  interpretacionCompuestos: interpretacionCompuestos)),
        );
      } else {
        QuickAlertDialog.showAlert(
            context, QuickAlertType.error, "Debes llenar todos los campos");
      }
    } else {
      QuickAlertDialog.showAlert(
          context, QuickAlertType.warning, "Debes elegir un predio");
    }
  }
}
