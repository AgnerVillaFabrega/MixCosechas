import 'package:flutter/material.dart';
import 'package:mixcosechas_app/presentation/screens/list_view_sceens/view_clientes_screen.dart';

// ignore: camel_case_types
class IconClientesMenu extends StatelessWidget {
  const IconClientesMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.groups),
      title: const Text('Clientes'),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => cargarDatos()),
          );
      },
    );
  }
}