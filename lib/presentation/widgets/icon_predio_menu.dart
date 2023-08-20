import 'package:flutter/material.dart';
import 'package:mixcosechas_app/presentation/screens/view_predio_screen.dart';

class IconPredioMenu extends StatelessWidget {
  const IconPredioMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.domain),
      title: const Text('Predios'),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ViewPredioScreen()),
          );
      },
    );
  }
}