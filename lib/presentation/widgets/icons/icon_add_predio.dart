import 'package:flutter/material.dart';
import 'package:mixcosechas_app/presentation/screens/registry_screens/registration_predio_screen.dart';

class IconAddPredio extends StatelessWidget {
  const IconAddPredio({
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
          MaterialPageRoute(builder: (context) => const RegistrationPredioScreen()),
        );
      },
    );
  }
}
