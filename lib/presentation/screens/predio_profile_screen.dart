import 'package:flutter/material.dart';
import 'package:mixcosechas_app/model/predios.dart';
import 'package:mixcosechas_app/model/pruebaSuelo.dart';
import 'package:mixcosechas_app/presentation/widgets/custom_text.dart';
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    predio.nombre,
                    style:
                      const TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
                  ),
                  Text(
                    predio.id,
                    style:
                      const TextStyle(fontSize: 26),
                  ),
                  const SizedBox(height: 15),
                ],
              ),
              Row(
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10),
                      CustomText(text: 'Propietario:', fontSize: 15, color: Color(0xFF19AA89)),
                      SizedBox(height: 5),
                      CustomText(text: 'Departamento:', fontSize: 15, color: Color(0xFF19AA89)),
                      SizedBox(height: 5),
                      CustomText(text: 'Municipio:', fontSize: 15, color: Color(0xFF19AA89)),
                      SizedBox(height: 5),
                      CustomText(text: 'Corregimiento/Vereda:', fontSize: 15, color: Color(0xFF19AA89)),
                      SizedBox(height: 5),
                      CustomText(text: 'Latitud:', fontSize: 15, color: Color(0xFF19AA89)),
                      SizedBox(height: 5),
                      CustomText(text: 'Longitud:', fontSize: 15, color: Color(0xFF19AA89)),
                      SizedBox(height: 5),
                      CustomText(text: 'MSNM:', fontSize: 15, color: Color(0xFF19AA89)),
                      SizedBox(height: 5),
                      CustomText(text: 'Profundidad Suelo Biotico:', fontSize: 15, color: Color(0xFF19AA89)),
                      SizedBox(height: 5),
                      CustomText(text: 'Puntos:', fontSize: 15, color: Color(0xFF19AA89)),
                      SizedBox(height: 5),
                      CustomText(text: 'Temperatura:', fontSize: 15, color: Color(0xFF19AA89)),
                      
                      SizedBox(height: 10),
                    ],
                  ),
                  
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const SizedBox(height: 10),
                      CustomText(text: predio.nombrePropietario, fontSize: 15, color: Colors.black),
                      const SizedBox(height: 5),
                      CustomText(text: predio.departamento, fontSize: 15, color: Colors.black),
                      const SizedBox(height: 5),
                      CustomText(text: predio.municipio, fontSize: 15, color: Colors.black),
                      const SizedBox(height: 5),
                      CustomText(text: predio.corregimientoVereda, fontSize: 15, color: Colors.black),
                      const SizedBox(height: 5),
                      CustomText(text: predio.latitud, fontSize: 15, color: Colors.black),
                      const SizedBox(height: 5),
                      CustomText(text: predio.longitud, fontSize: 15, color: Colors.black),
                      const SizedBox(height: 5),
                      CustomText(text: predio.msnm, fontSize: 15, color: Colors.black),
                      const SizedBox(height: 5),
                      CustomText(text: predio.profundidadSB, fontSize: 15, color: Colors.black),
                      const SizedBox(height: 5),
                      CustomText(text: predio.puntos, fontSize: 15, color: Colors.black),
                      const SizedBox(height: 5),
                      CustomText(text: predio.temperatura, fontSize: 15, color: Colors.black),
                      const SizedBox(height: 10),
                    ],
                  ),
                ],
              ),
              
              
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
