import 'package:flutter/material.dart';

import '../screens/view_pruebas_screen.dart';

class IconMuestasMenu extends StatelessWidget {
  const IconMuestasMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.biotech),
      title: const Text('Muestreos'),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ViewPruebasScreen()),
          );
      },
    );
  }
}