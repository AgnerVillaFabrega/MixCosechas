import 'package:flutter/material.dart';

class InfoHome extends StatelessWidget {
  const InfoHome({
    super.key,
    required String rutaimg,
    required String texto,
  }):_rutaimg =rutaimg, _texto= texto;

  final String _rutaimg;
  final String _texto;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150, // Ancho del contenedor de imagen
      height: 170, // Alto del contenedor de imagen y texto
      child: Column(
        children: [
          Image.asset(
            _rutaimg,
            width: 100,
            height: 100, 
          ),
          Text(
            _texto,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}