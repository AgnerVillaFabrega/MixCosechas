// ignore_for_file: must_be_immutable, library_private_types_in_public_api

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mixcosechas_app/model/clientes.dart';
import 'package:mixcosechas_app/presentation/screens/home_sceen.dart';
import 'package:mixcosechas_app/presentation/screens/view_profile_screens/profile_user_screen.dart';
import 'package:mixcosechas_app/presentation/widgets/icons/icon_add_clientes.dart';
import 'package:mixcosechas_app/presentation/widgets/indicador_circle_progress.dart';

Widget cargarDatos(){
  return StreamBuilder(
    stream: FirebaseFirestore.instance.collection('Usuarios').snapshots(),
    builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
      switch(snapshot.connectionState){
        case ConnectionState.waiting: 
          return const Center(
            child: CircularProgressIndicator(),
          );
        case ConnectionState.active: 
          if(snapshot.hasError) return const Text('error');
          return snapshot.data != null? ViewClientScreen(cliente:conversiondelista(snapshot.data!.docs)): const Text('Sin datos');
        default: return const Text('Presiona el boton para recargar');
      }
    }
  );
}

List<Cliente> conversiondelista(List registro){
  List<Cliente> resultado = [];
  for (var i = 0; i < registro.length; i++) {
    resultado.add(Cliente(id: registro[i]['Id'], nombre: registro[i]['Nombre'], telefono: registro[i]['Telefono'], correo: registro[i]['Correo'], rol: registro[i]['Rol'], password: registro[i]['Password']));
  }
  return resultado;
}

class ViewClientScreen extends StatefulWidget {
  List<Cliente> cliente = [];
  ViewClientScreen({super.key,required this.cliente});

  @override
  _ViewClientScreenState createState() => _ViewClientScreenState();
}

class _ViewClientScreenState extends State<ViewClientScreen> {

  List<Cliente> _filteredClientes = [];
  final bool _isLoading = false;
  String filtro="";

  @override
  void initState() {
    super.initState();
  }


  void _filterClientes(String query) {
    List<Cliente> filteredList = widget.cliente.where((cliente) {
      return cliente.nombre.toLowerCase().contains(query.toLowerCase()) ||
            cliente.id.toLowerCase().contains(query.toLowerCase());
    }).toList();
    _filteredClientes = filteredList;
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Clientes'),
        actions:const [
          // Todo: despues de crear a los usuarios hay que condicionar el menu para que cambia dependendo del tipo
          //* Ejemplo: "if (user.userType == UserType.Cliente) IconAddClientes(),"
          IconAddClientes(),
        ],
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
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                //color: const Color.fromARGB(255, 227, 227, 227),
                borderRadius: BorderRadius.circular(6),
                border: Border.all(color: const Color(0xFFCFCFCF)),
              ),
              child: TextField(
                onChanged: _filterClientes,
                decoration: const InputDecoration(
                  hintText: 'Buscar',
                  prefixIcon: Icon(Icons.search),
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            _isLoading?const IndicadorCircularProgress()
              :Expanded(
              child: ListView.separated(
                itemCount: _filteredClientes.isEmpty ? widget.cliente.length: _filteredClientes.length,
                separatorBuilder: (context, index) => const Divider(),
                itemBuilder: (context, index) {
                  return _filteredClientes.isEmpty ?ListTile(
                    title: Text(widget.cliente[index].nombre),
                    subtitle: Text(widget.cliente[index].id),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UserProfileView(usuario: widget.cliente[index]),
                          ),
                        );
                    },
                  ):
                  ListTile(
                    title: Text(_filteredClientes[index].nombre),
                    subtitle: Text(_filteredClientes[index].id),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UserProfileView(usuario: _filteredClientes[index]),
                          ),
                        );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}


