// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../screens/login_screen.dart';

class IconLogout extends StatelessWidget {
  const IconLogout({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text('Cerrar Sesión'),
      leading: const Icon(Icons.exit_to_app), // Icono de salida
      onTap: () async {
        await FirebaseAuth.instance.signOut();
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) =>const LoginScreen()),
          (route) => false, // Elimina todas las rutas anteriores
        );
      },
    );
  }
}
