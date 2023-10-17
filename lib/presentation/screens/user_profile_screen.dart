import 'package:flutter/material.dart';
import 'package:mixcosechas_app/model/clientes.dart';
import 'package:mixcosechas_app/presentation/screens/predio_profile_screen.dart';
import 'package:mixcosechas_app/presentation/widgets/img_admin.dart';
import 'package:mixcosechas_app/presentation/widgets/img_agricultor.dart';
import 'package:mixcosechas_app/presentation/widgets/img_analista.dart';
import 'package:mixcosechas_app/services/firebase_service.dart';
import 'package:mixcosechas_app/model/predios.dart';

class UserProfileView extends StatelessWidget {
  final Cliente usuario;
  final ServiceFirebase _serviceFirebase = ServiceFirebase();

  UserProfileView({Key? key, required this.usuario}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                pinned: false,
                expandedHeight: 250.0,
                flexibleSpace: FlexibleSpaceBar(
                  //title: Text(usuario.nombre, textScaleFactor: 1),
                  background: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Color(0xFFFFFFFF), Color(0xFF19AA89)], // Cambia los colores del degradado
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        if (usuario.rol == 'Admin')  const ImgAdmin(radio: 55,),
                        if(usuario.rol == 'Agricultor') const ImgAgricultor(radio: 55),
                        if(usuario.rol == 'Analista') const ImgAnalista(radio: 55),
                        const SizedBox(height: 10),
                        Text(
                          usuario.nombre,
                          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                        Text(
                          usuario.rol,
                          style: const TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  stretchModes: const [StretchMode.zoomBackground],
                ),
              ),
              SliverPersistentHeader(
                delegate: MySliverPersistentHeaderDelegate(
                  const TabBar(
                    tabs: [
                      Tab(icon: Icon(Icons.person)),
                      Tab(icon: Icon(Icons.location_city)),
                    ],
                  ),
                ),
                pinned: true,
              ),
            ];
          },
          body: TabBarView(
            children: [
              // Información del cliente
              Column(
                children: <Widget>[
                  const SizedBox(height: 16),
                  ListTile(
                    title: Text('Nombre: ${usuario.nombre}'),
                  ),
                  ListTile(
                    title: Text('Correo: ${usuario.correo}'),
                  ),
                  ListTile(
                    title: Text('Rol: ${usuario.rol}'),
                  ),
                ],
              ),
              // Listado de predios
              FutureBuilder(
                future: _serviceFirebase.getPrediosPorPropietario(usuario.id),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    List<Predio> predios = snapshot.data as List<Predio>;

                    return ListView(
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
                            margin: const EdgeInsets.only(bottom: 16),
                            child: ListTile(
                              title: Text(
                                'Nombre del predio: ${predio.nombre}',
                                style: const TextStyle(fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text('Ubicación: ${predio.departamento}, ${predio.municipio}'),
                            ),
                          ),
                        );
                      }).toList(),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class MySliverPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  final TabBar tabBar;

  MySliverPersistentHeaderDelegate(this.tabBar);

  @override
  double get minExtent => tabBar.preferredSize.height;
  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return tabBar;
  }

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
