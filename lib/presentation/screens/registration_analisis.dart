// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import '../widgets/agua_widget.dart';
import '../widgets/suelo_widget.dart';

int _index = 0;
List<Widget> _opciones = <Widget>[
  const SueloWidget(),
  const AguaWidget(),
];

class RegistrationPruebaScreen extends StatelessWidget {
  const RegistrationPruebaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const RegisterAnalisisPage();
  }
}

class RegisterAnalisisPage extends StatefulWidget {
  const RegisterAnalisisPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RegisterAnalisisPageState createState() => _RegisterAnalisisPageState();
}

class _RegisterAnalisisPageState extends State<RegisterAnalisisPage> {
  //controllers de los otros componentes
  Color activo = const Color(0xFF19AA89);
  Color inactivo = const Color(0xFFc3c6c9);
  
  Color cambiarColor(int index) { 
    Color colorActual;
    if (index == _index) {
      colorActual = activo;
    } else {
      colorActual = inactivo;
    }
    return colorActual;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registrar prueba'),
      ),
      body: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 50,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: <Widget>[
                              SizedBox(
                                height: 50,
                                width: 176,
                                child: TextButton(
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all<Color>(cambiarColor(0)),
                                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(6.0), // Establece el radio de borde deseado
                                      ),
                                    ),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _index = 0;
                                    });
                                  },
                                  child: const Text(
                                    "Suelo",
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Color.fromARGB(255, 255, 255, 255),
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 50,
                                width: 176,
                                child: TextButton(
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all<Color>(cambiarColor(1)),
                                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(6.0), // Establece el radio de borde deseado
                                      ),
                                    ),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _index = 1;
                                    });
                                  },
                                  child: const Text(
                                    "Agua",
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Color.fromARGB(255, 255, 255, 255),
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ),
        
                              //* OPT SISTEMA FOLIAR
                              // SizedBox(
                              //   height: 50,
                              //   width: 170,
                              //   child: TextButton(
                              //     style: ButtonStyle(
                              //       backgroundColor: MaterialStateProperty.all<Color>(cambiarColor(2)),
                              //       shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              //         RoundedRectangleBorder(
                              //           borderRadius: BorderRadius.circular(6.0), // Establece el radio de borde deseado
                              //         ),
                              //       ),
                              //     ),
                              //     onPressed: () {
                              //       setState(() {
                              //         //_index = 2;
                              //       });
                              //     },
                              //     child: const Text(
                              //       "Sistema foliar",
                              //       style: TextStyle(
                              //         fontSize: 18,
                              //         color: Color.fromARGB(255, 255, 255, 255),
                              //         fontWeight: FontWeight.w700,
                              //       ),
                              //     ),
                              //   ),
                              // )
                              
                            ],
                          ),
                        ),
                      
                        //!cambiar la vista
                        _opciones[_index],
                        
                        //! los botones los trabajos desde las vistas
                        // const SizedBox(height: 20),
                        // const RegistrarPruebasButtom(),
                      ],
                    ),
                ),
              ),
            ],
          ),
        ),
    );
  }
}

