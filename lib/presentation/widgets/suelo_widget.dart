import 'package:flutter/material.dart';

class SueloWidget extends StatelessWidget {
  const SueloWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        InputVariable(nombreVariable: 'Nitrato de Nitrógeno - N'),
        InputVariable(nombreVariable: 'Nitrógeno amoniacal - NH4+'),
        InputVariable(nombreVariable: 'Nitritos - NO2'),
        InputVariable(nombreVariable: 'Nitratos - NO3'),
        InputVariable(nombreVariable: 'Fósforo - P'),
        InputVariable(nombreVariable: 'Potasio - K'),
        InputVariable(nombreVariable: 'Calcio - Ca'),
        InputVariable(nombreVariable: 'Magnesio - Mg'),
        // InputVariable(nombreVariable: 'Sulfato - SO4'),
        // InputVariable(nombreVariable: 'Hierro Férrico - Fe '),
        // InputVariable(nombreVariable: 'Manganeso - Mn'),
        // InputVariable(nombreVariable: 'Cobre - Cu'),
        // InputVariable(nombreVariable: 'Aluminio - Al'),
        // InputVariable(nombreVariable: 'Cloruro - Cl'),
        // InputVariable(nombreVariable: 'Ph'),
        // InputVariable(nombreVariable: 'C.E'),
        // InputVariable(nombreVariable: 'Sales Disueltas'),
        // InputVariable(nombreVariable: 'C.I.C.E'),
        // InputVariable(nombreVariable: 'Arcilla %'),
        // InputVariable(nombreVariable: 'Limo %'),
        // InputVariable(nombreVariable: 'Arena %'),

        RegistrarPruebasButtom(),
      ],
    );
  }
}

class InputVariable extends StatelessWidget {
  const InputVariable({
    super.key, required this.nombreVariable,
  });
  final String nombreVariable;
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8.0),
      child: TextField(
        keyboardType: TextInputType.number,
        decoration:InputDecoration(
          labelText: nombreVariable,
          labelStyle: const TextStyle(color: Color(0xFF19AA89),fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
class RegistrarPruebasButtom extends StatelessWidget {
  const RegistrarPruebasButtom({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: ElevatedButton(
        onPressed: () {

        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF19AA89),
          padding: const EdgeInsets.symmetric(horizontal: 0),
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