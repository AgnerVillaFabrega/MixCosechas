import 'package:flutter/material.dart';

class ImgAnalista extends StatelessWidget {
  final double radio;
  const ImgAnalista({
    super.key, required this.radio,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radio,
      backgroundImage: const AssetImage('assets/images/analista.png'), // Ruta de la imagen
    );
  }
}