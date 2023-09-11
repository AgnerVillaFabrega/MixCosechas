import 'package:flutter/material.dart';

class ImgAgricultor extends StatelessWidget {
  const ImgAgricultor({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      radius: 30,
      backgroundImage: AssetImage('assets/images/agricultor.png'), // Ruta de la imagen
    );
  }
}