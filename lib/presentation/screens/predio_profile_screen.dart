import 'package:flutter/material.dart';
import 'package:mixcosechas_app/model/predios.dart';

class PredioProfileView extends StatelessWidget {
  final Predio predio;

  PredioProfileView({Key? key, required this.predio}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //title: const Text('Detalles del Predio'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                predio.nombre,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 26
                ),
              ),
              const SizedBox(height: 10),
              Text('Propietario: ${predio.nombrePropietario}'),
              const SizedBox(height: 10),
              Text('Departamento: ${predio.departamento}'),
              const SizedBox(height: 10),
              Text('Municipio: ${predio.municipio}'),
              const SizedBox(height: 10),
              Text('Corregimiento/Vereda: ${predio.corregimientoVereda}'),
              const SizedBox(height: 10),
              Text('Cultivo: ${predio.cultivo}'),
              const SizedBox(height: 10),
              Text('Variedad: ${predio.variedad}'),
              const SizedBox(height: 10),
              Text('Edad del cultivo: ${predio.edad}'),
              const SizedBox(height: 16),
              const Text(
                "Historial de pruebas",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 26,
                  color: Color(0XFF636363)
                ),
              ),
              const Divider(),
              const Column(
                
              ),

            // ListView(
            //   padding: const EdgeInsets.symmetric(horizontal: 14),
            //   children: predios.map((predio) {
            //     return GestureDetector(
            //       onTap: () {
            //         Navigator.push(
            //           context,
            //           MaterialPageRoute(
            //             builder: (context) => PredioProfileView(predio: predio),
            //           ),
            //         );
            //       },
            //       child: Card(
            //         elevation: 2,
            //         child: Padding(
            //           padding: const EdgeInsets.all(7),
            //           child: ListTile(
            //             title: Row(
            //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //               children: [
            //                 Text(
            //                   predio.nombre,
            //                   style: const TextStyle(fontWeight: FontWeight.bold),
            //                 ),
            //                 Text(
            //                   predio.id,  // Aquí colocamos el código del predio
            //                   style: const TextStyle(fontWeight: FontWeight.bold),
            //                 ),
            //               ],
            //             ),
            //             subtitle: Text('${predio.departamento}, ${predio.municipio}'),
            //           ),
            //         ),
            //       ),
            //     );
            //   }).toList(),
            // );

            ],
          ),
        ),
      ),
    );
  }
}
