import 'package:flutter/material.dart';
import 'package:mixcosechas_app/model/clientes.dart';
import 'package:mixcosechas_app/presentation/screens/user_profile_screen.dart';

class IconUserProfile extends StatelessWidget {
  final Cliente cliente;
  
  const IconUserProfile({
    super.key, required this.cliente,
  });
  
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.person),
      title: const Text('Perfil'),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  UserProfileView(usuario: cliente)),
        );
      },
    );
  }
}