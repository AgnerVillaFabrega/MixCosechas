import 'package:flutter/material.dart';
import 'package:mixcosechas_app/model/predios.dart';
import 'package:mixcosechas_app/model/pruebaSuelo.dart';
import 'package:mixcosechas_app/services/firebase_service.dart';

class PredioProfileView extends StatelessWidget {
  final Predio predio;
  final ServiceFirebase _serviceFirebase = ServiceFirebase();

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
                style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
              ),
              const SizedBox(height: 10),
              Text('Id Predio: ${predio.id}'),
              const SizedBox(height: 10),
              Text('Propietario: ${predio.nombrePropietario}'),
              const SizedBox(height: 10),
              Text('Departamento: ${predio.departamento}'),
              const SizedBox(height: 10),
              Text('Municipio: ${predio.municipio}'),
              const SizedBox(height: 10),
              Text('Corregimiento/Vereda: ${predio.corregimientoVereda}'),
              const SizedBox(height: 10),
              Text('Latitud: ${predio.latitud}'),
              const SizedBox(height: 10),
              Text('Longitud: ${predio.longitud}'),
              const SizedBox(height: 10),
              Text('MSNM: ${predio.msnm}'),
              const SizedBox(height: 16),
              Text('Profundidad Suelo Biotico: ${predio.profundidadSB}'),
              const SizedBox(height: 16),
              Text('Puntos: ${predio.puntos}'),
              const SizedBox(height: 16),
              Text('Temperatura: ${predio.temperatura}'),
              const SizedBox(height: 16),
              Text('Temperatura: ${predio.lotes}'),
              const SizedBox(height: 16),

              const Text(
                "Historial de pruebas",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 26,
                    color: Color(0XFF636363)),
              ),
              const Divider(),

              //AQUI COMIENZO************************************************************

              FutureBuilder(
                future: _serviceFirebase.getPruebaSueloPorPredio(predio.id),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    List<PruebaSuelo> pruebasSuelo =
                        snapshot.data as List<PruebaSuelo>;
                    if (pruebasSuelo.isEmpty) {
                      return const Card(
                        elevation: 2,
                        child: Padding(
                          padding: EdgeInsets.all(
                              16), // Aumenta el espacio de relleno
                          child: ListTile(
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "¡Upss! 🤷‍♂️",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize:
                                          20 // Aumenta el tamaño del texto
                                      ),
                                ),
                              ],
                            ),
                            subtitle: Text(
                              'Parece que aún no tienes pruebas',
                              style: TextStyle(
                                fontSize: 17, // Aumenta el tamaño del texto
                              ),
                            ),
                          ),
                        ),
                      );
                    } else {
                      return Container(
                        height: 600,  
                        child: ListView(
                          padding: const EdgeInsets.symmetric(horizontal: 14),
                          children: pruebasSuelo.map((pruebaSuelo) {
                            return GestureDetector(
                              child: Card(
                                elevation: 2,
                                child: Padding(
                                  padding: const EdgeInsets.all(16),
                                  child: ListTile(
                                    title: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          pruebaSuelo.cultivo,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          pruebaSuelo.fechaPrueba
                                              .toString(), // Aquí colocamos el código del predio
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    subtitle: Text(
                                        pruebaSuelo.fechaPrueba.toString()),
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      );
                    }
                  }
                },
              ),

              //AQUI TERMINO*************************************************************************
            ],
          ),
        ),
      ),
    );
  }
}
