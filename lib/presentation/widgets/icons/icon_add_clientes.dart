import 'package:flutter/material.dart';
import 'package:mixcosechas_app/presentation/screens/registry_screens/registration_clients_scren.dart';

class IconAddClientes extends StatelessWidget {
  const IconAddClientes({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.add),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const RegistrationClientScreen(isFirstTime: false,)),
        );
      },
    );
  }
}