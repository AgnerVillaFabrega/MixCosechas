// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:mixcosechas_app/presentation/screens/home_sceen.dart';
import 'package:mixcosechas_app/presentation/widgets/icons/icon_add_prueba.dart';
import 'package:mixcosechas_app/presentation/widgets/view_pruebas/view_agua_widget.dart';
import 'package:mixcosechas_app/presentation/widgets/view_pruebas/view_sistemafoliar_widget.dart';
import 'package:mixcosechas_app/presentation/widgets/view_pruebas/view_suelo_widget.dart';

int _index = 0;
List<Widget> _opciones = <Widget>[
  const ViewPruebaSueloWidget(),
  const ViewPruebaAguaWidget(),
  const ViewPruebaSistemaFoliarWidget(),
];

class ViewPruebasScreen extends StatelessWidget {
  const ViewPruebasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ViewPruebasPage();
  }
}

class ViewPruebasPage extends StatefulWidget {
  const ViewPruebasPage({Key? key}) : super(key: key);

  @override
  _ViewPruebasPageState createState() => _ViewPruebasPageState();
}

class _ViewPruebasPageState extends State<ViewPruebasPage> {

  Color activo = const Color(0xFF19AA89);
  Color inactivo = const Color(0xFFc3c6c9);

  Color cambiarColor(int index) {
    return index == _index ? activo : inactivo;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pruebas'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()),
            );
          },
        ),
        actions: const [
          IconAddPrueba(),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 50,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: cambiarColor(0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6.0),
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
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: cambiarColor(1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6.0),
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
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: cambiarColor(2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      _index = 2;
                    });
                  },
                  child: const Text(
                    "Sistema foliar",
                    style: TextStyle(
                      fontSize: 18,
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: _opciones[_index],
          ),
        ],
      ),
    );
  }
}
