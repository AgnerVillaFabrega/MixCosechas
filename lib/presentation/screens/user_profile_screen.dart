import 'package:flutter/material.dart';
import 'package:mixcosechas_app/model/clientes.dart';
import 'package:mixcosechas_app/presentation/screens/predio_profile_screen.dart';
import 'package:mixcosechas_app/services/firebase_service.dart';
import 'package:mixcosechas_app/model/predios.dart';

import '../widgets/img/img_admin.dart';
import '../widgets/img/img_agricultor.dart';
import '../widgets/img/img_analista.dart';

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
    background: Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFFFFFFFF), Color(0xFF19AA89)],
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
  actions: [
    PopupMenuButton<String>(
      onSelected: (value) {
        if (value == 'editar') {
          // Agregar lógica para editar el perfil aquí
        } else if (value == 'eliminar') {
          // Agregar lógica para eliminar el perfil aquí
        }
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
        const PopupMenuItem<String>(
          value: 'editar',
          child: ListTile(
            leading: Icon(Icons.edit),
            title: Text('Editar'),
          ),
        ),
        const PopupMenuItem<String>(
          value: 'eliminar',
          child: ListTile(
            leading: Icon(Icons.delete),
            title: Text('Eliminar'),
          ),
        ),
      ],
    ),
  ],
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
              Card(
                elevation: 0,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      const Row(
                        children: [
                          Icon(Icons.badge), 
                          SizedBox(width: 16), 
                          Text(
                            "Numero de identificacion",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const SizedBox(height: 17),
                      Container(
                        alignment: const Alignment(-0.6, 0.0),
                        child: Text(
                          usuario.id,
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Divider(),

                      const Row(
                        children: [
                          Icon(Icons.email), 
                          SizedBox(width: 16), 
                          Text(
                            "Correo electronico",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const SizedBox(height: 17),
                      Container(
                        alignment: const Alignment(-0.6, 0.0),
                        child: Text(
                          usuario.correo,
                        ),
                      ),
                      const SizedBox(height: 17),
                      const Divider(),

                      const Row(
                        children: [
                          Icon(Icons.phone_android), 
                          SizedBox(width: 16), 
                          Text(
                            "Telefono",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const SizedBox(height: 17),
                      Container(
                        alignment: const Alignment(-0.6, 0.0),
                        child: Text(
                          usuario.telefono,
                        ),
                      ),
                      const SizedBox(height: 17),
                      const Divider(),
                    ],
                  ),
                ),
              ),
              // Listado de predios
              FutureBuilder(
                future: _serviceFirebase.getPrediosPorPropietario(usuario.id),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    
                    List<Predio> predios = snapshot.data as List<Predio>;
                    if (predios.isEmpty){
                      return const Card(
                        elevation: 2,
                        child: Padding(
                          padding: EdgeInsets.all(7), // Aumenta el espacio de relleno
                          child: ListTile(
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "¡Upss! 🤷‍♂️",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20// Aumenta el tamaño del texto
                                  ),
                                ),
                              ],
                            ),
                            subtitle: Text(
                              'Parece que aún no tienes predios',
                              style: TextStyle(
                                fontSize: 17, // Aumenta el tamaño del texto
                              ),
                            ),
                          ),
                        ),
                      );
                    }else{
                      return ListView(
                        padding: const EdgeInsets.symmetric(horizontal: 14),
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
                              elevation: 2,
                              child: Padding(
                                padding: const EdgeInsets.all(7),
                                child: ListTile(
                                  title: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        predio.nombre,
                                        style: const TextStyle(fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        predio.id,  // Aquí colocamos el código del predio
                                        style: const TextStyle(fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  subtitle: Text('${predio.departamento}, ${predio.municipio}'),
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      );
                    }
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
