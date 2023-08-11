import 'package:flutter/material.dart';
import 'package:mixcosechas_app/presentation/screens/login_screen.dart';
import 'package:mixcosechas_app/presentation/screens/view_clientes_screen.dart';
import 'package:mixcosechas_app/presentation/screens/view_predio_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  //final User user; // Asegúrate de tener un objeto User disponible


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
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
            ListTile(
              leading: const Icon(Icons.groups),
              title: const Text('Clientes'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ViewClientScreen()),
                  );
              },
            ),
            ListTile(
              leading: const Icon(Icons.domain),
              title: const Text('Predios'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ViewPredioScreen()),
                  );
              },
            ),
            
            const Divider(),
            ListTile(
                title: const Text('Cerrar Sesión'),
                leading: const Icon(Icons.exit_to_app), // Icono de salida
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) =>const LoginScreen()),
                    (route) => false, // Elimina todas las rutas anteriores
                  );
                },
              ),
            // Agrega más ítems del menú aquí
          ],
        ),
      ),
      body: const Center(
        child: Text('Contenido de la página principal'),
      ),
    );
  }
}
//*Ejemplo de la clase user y de como usarla
// class User {
//   final String name;
//   final String email;

//   User(this.name, this.email);
// }
