import 'package:flutter/material.dart';
import 'package:mixcosechas_app/presentation/widgets/icon_clientes_menu.dart';
import 'package:mixcosechas_app/presentation/widgets/icon_logout_menu.dart';
import 'package:mixcosechas_app/presentation/widgets/icon_predio_menu.dart';
import 'package:mixcosechas_app/presentation/widgets/icon_userprofile.dart';
import 'package:mixcosechas_app/presentation/widgets/info_home.dart';

import '../../model/clientes.dart';
import '../widgets/icon_muestras.dart';
import '../widgets/img_admin.dart';
import '../widgets/img_agricultor.dart';
import '../widgets/img_analista.dart';

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
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        //title: const Text('MixCosechas'),
        backgroundColor: Colors.transparent,
        elevation: 0,
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
                  if (_cliente.rol == 'Admin')  const ImgAdmin(),
                  if(_cliente.rol == 'Agricultor') const ImgAgricultor(),
                  if(_cliente.rol == 'Analista') const ImgAnalista(),   
                  const SizedBox(height: 10),
                  Text(
                    _cliente.nombre,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    _cliente.correo,
                    style: const TextStyle(
                      color: Colors.white,
                      //color: Color(0XFFb3b3ba),
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                //Todo: que el menu cambie dependiendo del rol
                // if(_cliente.rol == 'Agricultor') const IconClientesMenu(),
                // if(_cliente.rol == 'Analista') const IconPredioMenu(),
                IconUserProfile(cliente: _cliente),
                const IconClientesMenu(),
                const IconPredioMenu(),
                const IconMuestasMenu(),
                const Divider(),  
                const IconLogout(),
              ],
            ),
          ],
        ),
        
      ),
      body:Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height*1,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: Image.asset(
              'assets/images/hoverTry.png',
            ).image,
          ),
          borderRadius: BorderRadius.circular(0),
        ),
        child: Stack(
          children: [
            Align(
              alignment:const AlignmentDirectional(0, -.88),
              child: Image.asset(
                'assets/images/_MIXCOSECHAS.png',
                width: 380,
                height: 170,
              ),
            ),
            Align(
              alignment: const AlignmentDirectional(0, 1),
              child: Container(
                height: MediaQuery.of(context).size.height * .7,
                decoration: const BoxDecoration(
                  color: Color(0XFFFAFDF9),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Padding(
                  padding:  const EdgeInsetsDirectional.fromSTEB(30, 15, 15,20),
                  child: ListView(
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.vertical,
                    children:  const [
                      SizedBox(height: 10),
                      //! CONTENIDO DEL HOME
                      Text(
                        '!No pierda su dinero enviando muestras!',
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 20,
                          //color: Color(0XFF614C1B),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Contrate nuestro servicio especializado de laboratorio agrícola',
                        style: TextStyle(
                          fontSize: 17,
                          color: Color(0XFF989EB1),
                        ),
                      ),
                      SizedBox(height: 10),
                      Divider(), 
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // Primera columna con dos elementos
                          Column(
                            children: [
                              // Primer elemento
                              InfoHome(rutaimg: 'assets/images/ahorro.png', texto:'Ahorre 30% en insumos agrícolas',),
                              InfoHome(rutaimg: 'assets/images/rendimiento.png', texto:'30% más en rendimiento de fruto',),
                            ],
                          ),
                          // Segunda columna con dos elementos
                          Column(
                            children: [
                              InfoHome(rutaimg: 'assets/images/organico.png', texto:'Desarrolle cultivos orgánicos',),
                              InfoHome(rutaimg: 'assets/images/cronometro.png', texto:'Conozca directamente sus resultados',),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ),
            )
          ],
        ),
      ),
    );
  }
}