import 'package:flutter/material.dart';
import 'package:mixcosechas_app/presentation/widgets/icon_clientes_menu.dart';
import 'package:mixcosechas_app/presentation/widgets/icon_logout_menu.dart';
import 'package:mixcosechas_app/presentation/widgets/icon_predio_menu.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inicio'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: const <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0XFF19aa89),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //Todo: encontrar la forma de cargar la imagen o dejar un icono(Opcion mas viable)
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/images/3135768.png'), // Ruta de la imagen
                  ),
                  SizedBox(height: 10),
                  //Todo: El nombre y el correo se deben cargar con la informacion del usuario
                  Text(
                    'Agner Villa Fabrega',  //user.name,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'adejesusvilla@unicesar.edu.co',//user.email,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                // Todo: despues de crear a los usuarios hay que condicionar el menu para que cambia dependendo del tipo
                //* Ejemplo: "if (user.userType == RolType.Cliente) IconClientesMenu(),"
                IconClientesMenu(),
                IconPredioMenu(),
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