import 'package:flutter/material.dart';

class ImgAdmin extends StatelessWidget {
  const ImgAdmin({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      radius: 30,
      backgroundImage: AssetImage('assets/images/admin.png'), // Ruta de la imagen
    );
  }
}