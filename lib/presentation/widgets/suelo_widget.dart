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
  final TextEditingController _phcontroller = TextEditingController();
  

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
                  ImputVariable(nombreVariable: 'Nitrato de Nitrógeno - N',phcontroller: _phcontroller),
                  ImputVariable(nombreVariable: 'Nitrógeno amoniacal - NH4+',phcontroller: _phcontroller),
                  ImputVariable(nombreVariable: 'Nitritos - NO2',phcontroller: _phcontroller),
                  ImputVariable(nombreVariable: 'Nitratos - NO3',phcontroller: _phcontroller),
                  ImputVariable(nombreVariable: 'Fósforo - P',phcontroller: _phcontroller),
                  ImputVariable(nombreVariable: 'Potasio - K',phcontroller: _phcontroller),
                  ImputVariable(nombreVariable: 'Calcio - Ca',phcontroller: _phcontroller),
                  ImputVariable(nombreVariable: 'Magnesio - Mg',phcontroller: _phcontroller),
                  ImputVariable(nombreVariable: 'Sulfato - SO4',phcontroller: _phcontroller),
                ],
              ),
            ),
            Step(
              isActive: currentState >= 1,
              title: const Text('Micronutrientes'), 
              content: Column(
                children: [
                  ImputVariable(nombreVariable: 'Hierro Férrico - Fe',phcontroller: _phcontroller),
                  ImputVariable(nombreVariable: 'Manganeso - Mn',phcontroller: _phcontroller),
                  ImputVariable(nombreVariable: 'Cobre - Cu',phcontroller: _phcontroller),
                  ImputVariable(nombreVariable: 'Aluminio - Al',phcontroller: _phcontroller),
                  ImputVariable(nombreVariable: 'Cloruro - Cl',phcontroller: _phcontroller),
                  ImputVariable(nombreVariable: 'Sales Disueltas',phcontroller: _phcontroller),
                ],
              )
            ),
            Step(
              isActive: currentState >= 2,
              title: const Text('Extra'), 
              content: Column(
                children: [
                  ImputVariable(nombreVariable: 'Ph',phcontroller: _phcontroller),
                  ImputVariable(nombreVariable: 'C.E',phcontroller: _phcontroller),
                  ImputVariable(nombreVariable: 'C.I.C.E',phcontroller: _phcontroller),
                  ImputVariable(nombreVariable: 'Arcilla %',phcontroller: _phcontroller),
                  ImputVariable(nombreVariable: 'Limo %',phcontroller: _phcontroller),
                  ImputVariable(nombreVariable: 'Arena %',phcontroller: _phcontroller),
                  
                  DropdownButtonFormField<String>(
                    //value: _rolController.text,
                    onChanged: (String? newValue) {
                      setState(() {
                        //_rolController.text = newValue!;
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
                  const RegistrarPruebasButtom(),
                ],
              )
            ),
          ]
        )
      )
    );
  }
}

class RegistrarPruebasButtom extends StatelessWidget {
  const RegistrarPruebasButtom({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {

        },
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