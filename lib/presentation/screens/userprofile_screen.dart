import 'package:flutter/material.dart';
import 'package:mixcosechas_app/model/clientes.dart';
import 'package:mixcosechas_app/presentation/screens/predioprofile_screen.dart';
import 'package:mixcosechas_app/services/firebase_service.dart';
import 'package:mixcosechas_app/model/predios.dart';

class UserProfileView extends StatelessWidget {
  final Cliente usuario;
  final ServiceFirebase _serviceFirebase = ServiceFirebase();

  UserProfileView({Key? key, required this.usuario}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil de Usuario'),// Cambia el color del AppBar
      ),
      body: FutureBuilder(
        future: _serviceFirebase.getPrediosPorPropietario(usuario.id),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                'Error: ${snapshot.error}',
                style: TextStyle(color: Colors.red), // Personaliza el color del texto de error
              ),
            );
          } else {
            List<Predio> predios = snapshot.data as List<Predio>;

            return ListView(
              padding: EdgeInsets.all(16),
              children: <Widget>[
                ListTile(
                  title: Text(
                    'Nombre: ${usuario.nombre}',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text('Teléfono: ${usuario.telefono}'),
                ),
                ListTile(
                  title: Text('Correo: ${usuario.correo}'),
                  subtitle: Text('Rol: ${usuario.rol}'),
                ),
                SizedBox(height: 16),
                Text(
                  'Predios:',
                  style: TextStyle(fontSize: 18, color: Color(0xFF19AA89)), // Cambia el color del título
                ),
                Column(
                  children: predios.map((predio) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PredioProfileView(predio: predio),
                          ),
                        );
                      },
                      child: Card(
                        elevation: 3,
                        margin: EdgeInsets.only(bottom: 16),
                        child: ListTile(
                          title: Text(
                            'Nombre del predio: ${predio.nombre}',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text('Ubicación: ${predio.departamento}, ${predio.municipio}'),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
