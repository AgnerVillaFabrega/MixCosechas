import 'package:flutter/material.dart';

class ImgAgricultor extends StatelessWidget {
  final double radio;
  const ImgAgricultor({
    super.key, required this.radio,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radio,
      backgroundImage: const AssetImage('assets/images/agricultor.png'), // Ruta de la imagen
    );
  }
}