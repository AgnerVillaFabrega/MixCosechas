import 'package:flutter/material.dart';
import 'package:mixcosechas_app/presentation/widgets/icon_clientes_menu.dart';
import 'package:mixcosechas_app/presentation/widgets/icon_logout_menu.dart';
import 'package:mixcosechas_app/presentation/widgets/icon_predio_menu.dart';

import '../../model/clientes.dart';
import '../widgets/icon_muestras.dart';

class HomeScreen extends StatefulWidget {
  final Cliente cliente;
  
  const HomeScreen({super.key, 
    required this.cliente
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState(cliente);
}

class _HomeScreenState extends State<HomeScreen> {
  final Cliente _cliente;

  _HomeScreenState(this._cliente);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //title: const Text('Inicio'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children:  <Widget>[
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Color(0XFF19aa89),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //Todo: encontrar la forma de cargar la imagen o dejar un icono(Opcion mas viable)
                  const CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/images/admin.png'), // Ruta de la imagen
                  ),
                  const SizedBox(height: 10),
                  //Todo: El nombre y el correo se deben cargar con la informacion del usuario
                  Text(
                    _cliente.nombre,  //user.name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    _cliente.correo,//user.email,
                    // ignore: prefer_const_constructors
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            const Column(
              children: [
                //* Ejemplo: "if (_cliente.rol == 'RolType') IconClientesMenu(),"
                // if(_cliente.rol == 'Agricultor') const IconClientesMenu(),
                // if(_cliente.rol == 'Analista') const IconPredioMenu(),
                IconClientesMenu(),
                IconPredioMenu(),
                IconMuestasMenu(),
                Divider(),  
                IconLogout(),
              ],
            // Agrega más ítems del menú aquí
            ),
          ],
        ),
      ),
      body: const Center(
        child: Text('Contenido de la página principal'),
      ),
    );
  }
}