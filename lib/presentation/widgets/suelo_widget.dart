import 'package:flutter/material.dart';
import 'input_variables.dart';

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
  final TextEditingController _nController = TextEditingController();
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
  final TextEditingController _alController = TextEditingController();
  final TextEditingController _clController = TextEditingController();
  final TextEditingController _salesdisueltasController = TextEditingController();
  final TextEditingController _phController = TextEditingController();
  final TextEditingController _ceController = TextEditingController();
  final TextEditingController _ciceController = TextEditingController();
  final TextEditingController _arcillaController = TextEditingController();
  final TextEditingController _limoController = TextEditingController();
  final TextEditingController _arenaController = TextEditingController();
  final TextEditingController _humusController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Theme(
        data: Theme.of(context).copyWith(
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
          onStepContinue: () {
            if (currentState != 2) {
              setState(() => currentState++);
            }
          },

          onStepCancel: () {
            if (currentState != 0) {
              setState(() => currentState--);
            }
          },

          steps:[
            Step(
              isActive: currentState >= 0,
              title: const Text('Macronutrientes'), 
              content: Column(
                children: [
                  ImputVariable(nombreVariable: 'Nitrato de Nitrógeno - N',controller: _nController),
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
              isActive: currentState >= 1,
              title: const Text('Micronutrientes'), 
              content: Column(
                children: [
                  ImputVariable(nombreVariable: 'Hierro Férrico - Fe',controller: _feController),
                  ImputVariable(nombreVariable: 'Manganeso - Mn',controller: _mnController),
                  ImputVariable(nombreVariable: 'Cobre - Cu',controller: _cuController),
                  ImputVariable(nombreVariable: 'Aluminio - Al',controller: _alController),
                  ImputVariable(nombreVariable: 'Cloruro - Cl',controller: _clController),
                  ImputVariable(nombreVariable: 'Sales Disueltas',controller: _salesdisueltasController),
                ],
              )
            ),
            Step(
              isActive: currentState >= 2,
              title: const Text('Extra'), 
              content: Column(
                children: [
                  ImputVariable(nombreVariable: 'Ph',controller: _phController),
                  ImputVariable(nombreVariable: 'C.E',controller: _ceController),
                  ImputVariable(nombreVariable: 'C.I.C.E',controller: _ciceController),
                  ImputVariable(nombreVariable: 'Arcilla %',controller: _arcillaController),
                  ImputVariable(nombreVariable: 'Limo %',controller: _limoController),
                  ImputVariable(nombreVariable: 'Arena %',controller: _arenaController),
                  
                  DropdownButtonFormField<String>(
                    value: _humusController.text,
                    onChanged: (String? newValue) {
                      setState(() {
                        _humusController.text = newValue!;
                      });
                    },
                    decoration: const InputDecoration(
                      labelText: 'Humus',
                      labelStyle: TextStyle(color: Color(0xFF19AA89),fontWeight: FontWeight.w600),
                    ),
                    items: [
                      const DropdownMenuItem<String>(
                        value: '',
                        child: Text('Seleccione'), // O cualquier otro texto que desees
                      ),
                      ...['1','2','3','4','5'].map((role) {
                        return DropdownMenuItem<String>(value: role, child: Text(role));
                      }).toList(),
                    ],
                    validator: (value) {
                      if (value == null||value.isEmpty ||value == 'Seleccione') {
                        return 'Por favor, seleccione un valor';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  RegistrarPruebasButtom(onTap:_handleRegistroSuelo),
                ],
              )
            ),
          ]
        )
      )
    );
  }
  void _handleRegistroSuelo(){
    if (formKey.currentState!.validate()) {
      //Todo: LOGICA PARA EL ANALISIS Y REGISTRO
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(_nController.text),
            content: Text(_nh4Controller.text),
          );
        },
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