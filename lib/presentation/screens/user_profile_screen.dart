import 'package:flutter/material.dart';
import 'package:mixcosechas_app/model/clientes.dart';
import 'package:mixcosechas_app/presentation/screens/predio_profile_screen.dart';
import 'package:mixcosechas_app/services/firebase_service.dart';
import 'package:mixcosechas_app/model/predios.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class UserProfileView extends StatelessWidget {
  final Cliente usuario;
  final ServiceFirebase _serviceFirebase = ServiceFirebase();

  UserProfileView({Key? key, required this.usuario}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 3,
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
                        const CircleAvatar(
                          radius: 50.0, // Ajusta el tamaño de la imagen
                          backgroundImage: AssetImage('assets/images/admin.png'), // Reemplaza con la imagen del usuario
                        ),
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
                      Tab(icon: Icon(Icons.dashboard)),
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
              // Gráficas en 2 columnas
              Column(
                children: <Widget>[
                  const SizedBox(height: 16),
                  const Text(
                    'Gráficas:',
                    style: TextStyle(fontSize: 18, color: Color(0xFF19AA89)),
                    textAlign: TextAlign.start,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: 150,
                        height: 150,
                        child: _buildChart(),
                      ),
                      SizedBox(
                        width: 150,
                        height: 150,
                        child: _buildChart(),
                      ),
                    ],
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

// Ejemplo de gráfica
  Widget _buildChart() {
    final data = [
      GraphData('Predios A', 30),
      GraphData('Predios B', 40),
      GraphData('Predios C', 30),
    ];
    var seriesList = [
      charts.Series<GraphData, String>(
        id: 'Cantidad',
        domainFn: (GraphData data, _) => data.label,
        measureFn: (GraphData data, _) => data.value,
        data: data,
        labelAccessorFn: (GraphData data, _) => '${data.value}%',
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(const Color(0xFF19AA89)), // Cambia el color de la gráfica de pastel
      ),
    ];
    return charts.PieChart(
      seriesList,
      animate: true,
    );
  }
}


class GraphData {
  final String label;
  final int value;

  GraphData(this.label, this.value);
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
