import 'package:flutter/material.dart';

class ImgAnalista extends StatelessWidget {
  const ImgAnalista({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      radius: 30,
      backgroundImage: AssetImage('assets/images/analista.png'), // Ruta de la imagen
    );
  }
}