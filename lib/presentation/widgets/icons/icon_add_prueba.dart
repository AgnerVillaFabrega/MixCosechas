import 'package:flutter/material.dart';
import 'package:mixcosechas_app/presentation/screens/registry_screens/registration_analisis_screen.dart';

class IconAddPrueba extends StatelessWidget {
  const IconAddPrueba({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.add),
      onPressed: () {
        //Todo: Logica para registrar predios
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const RegistrationPruebaScreen()),
        );
      },
    );
  }
}
