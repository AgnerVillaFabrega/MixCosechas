import 'package:flutter/material.dart';
import 'package:mixcosechas_app/presentation/widgets/suelo_widget.dart';

class AguaWidget extends StatelessWidget {
  const AguaWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        InputVariable(nombreVariable: 'Nitrato de Nitrógeno - N'),
        InputVariable(nombreVariable: 'Nitrógeno amoniacal - NH4+'),
        InputVariable(nombreVariable: 'Nitritos - NO2-'),
        InputVariable(nombreVariable: 'Nitratos - NO3-'),
        InputVariable(nombreVariable: 'Sulfato - SO4'),
        InputVariable(nombreVariable: 'Hierro Férrico - Fe '),
        InputVariable(nombreVariable: 'Manganeso - Mn'),
        InputVariable(nombreVariable: 'Cobre - Cu'),
        // InputVariable(nombreVariable: 'Aluminio - Al'),
        // InputVariable(nombreVariable: 'Cloruro - Cl'),
        RegistrarPruebasButtom(),
      ],
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