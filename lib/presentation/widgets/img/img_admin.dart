import 'package:flutter/material.dart';

class ImgAdmin extends StatelessWidget {
  final double radio;
  const ImgAdmin({
    super.key, required this.radio,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radio,
      backgroundImage: const AssetImage('assets/images/admin.png'), // Ruta de la imagen
    );
  }
}