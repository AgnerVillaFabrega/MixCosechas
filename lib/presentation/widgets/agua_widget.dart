import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mixcosechas_app/model/pruebaAgua.dart';
import 'package:mixcosechas_app/presentation/widgets/search_predio.dart';
import 'package:mixcosechas_app/presentation/widgets/show_result.dart';

import '../../services/firebase_service.dart';
import 'input_variables.dart';
import 'mensaje_show_dialog.dart';

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
    final ServiceFirebase _serviceFirebase = ServiceFirebase();
    //final TextEditingController _nController = TextEditingController();
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
    final TextEditingController _salesdisueltasController = TextEditingController();
    final TextEditingController _phController = TextEditingController();
    final TextEditingController _ceController = TextEditingController();

  //*INFORMACION DEL PREDIO */
  TextEditingController _nombrePredioController = TextEditingController();
  CollectionReference prediosCollection =
      FirebaseFirestore.instance.collection('Predios');

  final TextEditingController _corregimientoPredioController = TextEditingController();
  final TextEditingController _cultivoPredioController = TextEditingController();
  final TextEditingController _municipioPredioController = TextEditingController();
  final TextEditingController _variedadPredioController = TextEditingController();
  final TextEditingController _dptoPredioController = TextEditingController();
  final TextEditingController _edadPredioController = TextEditingController();
  final TextEditingController _nombrepropietarioPredioController = TextEditingController();
  final TextEditingController _telefonopropietarioPredioController = TextEditingController();
  final TextEditingController _correopropietarioPredioController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child:Theme(
        data:Theme.of(context).copyWith(
          colorScheme: const ColorScheme.light(
            primary: Color(0xFF19AA89)
          ),
        ), 
        child: Stepper(
          physics: const ScrollPhysics(),
          currentStep: currentState,
          onStepTapped:(index) {
            setState(() => currentState = index);
          },

          controlsBuilder: (BuildContext context, ControlsDetails details) {
            return Container();
          },
          
          steps: [
            Step(
              isActive: currentState >= 0,
              title: const Text('Informacion del predio'), 
              content: SearchPredio(predioFilterController: _nombrePredioController, prediosCollection: prediosCollection, corregimientoPredioController: _corregimientoPredioController, cultivoPredioController: _cultivoPredioController, municipioPredioController: _municipioPredioController, variedadPredioController: _variedadPredioController, dptoPredioController: _dptoPredioController, edadPredioController: _edadPredioController, nombrepropietarioPredioController: _nombrepropietarioPredioController, telefonopropietarioPredioController: _telefonopropietarioPredioController, correopropietarioPredioController: _correopropietarioPredioController),
            ),
            Step(
              isActive: currentState >= 1,
              title: const Text('Macronutrientes'), 
              content: Column(
                children: [
                  //ImputVariable(nombreVariable: 'Nitrato de Nitrógeno - N',controller: _nController),
                  ImputVariable(nombreVariable: 'Nitrógeno amoniacal - NH4+',controller:  _nh4Controller),
                  ImputVariable(nombreVariable: 'Nitritos - NO2',controller: _no2Controller),
                  ImputVariable(nombreVariable: 'Nitratos - NO3',controller: _no3Controller),
                  ImputVariable(nombreVariable: 'Fósforo - P',controller: _pController),
                  ImputVariable(nombreVariable: 'Potasio - K',controller: _kController),
                  ImputVariable(nombreVariable: 'Calcio - Ca',controller: _caController),
                  ImputVariable(nombreVariable: 'Magnesio - Mg',controller: _mgController),
                  ImputVariable(nombreVariable: 'Sulfato - SO4',controller: _so4Controller),
                ],
              ),
            ),
            Step(
              isActive: currentState >= 2,
              title: const Text('Micronutrientes'), 
              content: Column(
                children: [
                  ImputVariable(nombreVariable: 'Hierro Férrico - Fe',controller: _feController),
                  ImputVariable(nombreVariable: 'Manganeso - Mn',controller: _mnController),
                  ImputVariable(nombreVariable: 'Cobre - Cu',controller: _cuController),
                  ImputVariable(nombreVariable: 'Cloruro - Cl',controller: _clController),
                  ImputVariable(nombreVariable: 'Sales Disueltas',controller: _salesdisueltasController),
                  ImputVariable(nombreVariable: 'Ph',controller: _phController),
                  ImputVariable(nombreVariable: 'C.E',controller: _ceController),
                  const SizedBox(height: 20),
                  RegistrarPruebasButtom(onTap:_handleRegistroAgua),
                ],
              )
            ),
          ],
        )
      )
    );
  }
  void _handleRegistroAgua(){
    if (_nombrePredioController.text.isNotEmpty && _corregimientoPredioController.text.isNotEmpty && _cultivoPredioController.text.isNotEmpty &&
      _municipioPredioController.text.isNotEmpty && _variedadPredioController.text.isNotEmpty && _dptoPredioController.text.isNotEmpty && 
      _edadPredioController.text.isNotEmpty && _nombrepropietarioPredioController.text.isNotEmpty && _telefonopropietarioPredioController.text.isNotEmpty 
      && _correopropietarioPredioController.text.isNotEmpty) {
      if (formKey.currentState!.validate()) {
        //Todo: LOGICA PARA EL ANALISIS Y REGISTRO
        PruebaAgua pruebaAgua = PruebaAgua(
        nombrePredio: _nombrePredioController.text,
        corregimientoPredio: _corregimientoPredioController.text,
        cultivoPredio: _cultivoPredioController.text,
        municipioPredio: _municipioPredioController.text,
        variedadPredio: _variedadPredioController.text,
        dptoPredio: _dptoPredioController.text ,
        edadPredio: _edadPredioController.text,
        nombrepropietario: _nombrepropietarioPredioController.text,
        telefonopropietario: _telefonopropietarioPredioController.text ,
        correopropietario:_correopropietarioPredioController.text,
        //N: double.parse(_nController.text), 
        NH4: double.parse(_nh4Controller.text), 
        NO2: double.parse(_no2Controller.text), 
        NO3: double.parse(_no3Controller.text), 
        P: double.parse(_pController.text), 
        K: double.parse(_kController.text), 
        Ca: double.parse(_caController.text), 
        Mg: double.parse(_mgController.text), 
        SO4: double.parse(_so4Controller.text),
        Fe: double.parse(_feController.text), 
        Mn: double.parse(_mnController.text), 
        Cu: double.parse(_cuController.text), 
        Cl: double.parse(_clController.text), 
        Ph: double.parse(_phController.text), 
        C_E: double.parse(_ceController.text), 
        salesDisueltas: double.parse(_salesdisueltasController.text)
      );

        _serviceFirebase.addPruebaAgua(pruebaAgua);
        
        final List<String> nombreCompuestos = pruebaAgua.nombreCompuestos;

        final List<double> valorCompuestos = pruebaAgua.valorCompuestos;

        final List<String> interpretacionCompuestos = pruebaAgua.interpretacionCompuestos;

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ShowResult(nombreCompuestos: nombreCompuestos,valorCompuestos:valorCompuestos, interpretacionCompuestos: interpretacionCompuestos )),
        );

      }else{
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
    }else{
      showDialog(
        context: context,
        builder: (context) {
          return const MensajeShowDialog(title: "Ups!",message: "Debes elegir un propietario");
        },
      );
    }
  }
}

class RegistrarPruebasButtom extends StatelessWidget {
  const RegistrarPruebasButtom({super.key, required  VoidCallback onTap}):_onTap = onTap;
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