import 'package:flutter/material.dart';
import 'package:mixcosechas_app/model/predios.dart';

class PredioProfileView extends StatelessWidget {
  final Predio predio;

  PredioProfileView({Key? key, required this.predio}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles del Predio'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Nombre del predio: ${predio.nombre}',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text('Ubicación: ${predio.departamento}, ${predio.municipio}'),
            // Agrega más detalles del predio aquí
          ],
        ),
      ),
    );
  }
}
