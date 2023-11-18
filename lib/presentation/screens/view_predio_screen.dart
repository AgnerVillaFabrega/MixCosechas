// ignore_for_file: must_be_immutable, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mixcosechas_app/presentation/provider/ClienteProvider.dart';
import 'package:provider/provider.dart';
import 'package:mixcosechas_app/presentation/screens/predio_profile_screen.dart';
import '../../model/predios.dart';
import 'package:mixcosechas_app/presentation/widgets/indicador_circle_progress.dart';

import '../widgets/icons/icon_add_predio.dart';

Widget cargarDatosPredios() {
  return StreamBuilder(
    stream: FirebaseFirestore.instance.collection('Predios').snapshots(),
    builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
      ClienteProvider watch =  context.watch<ClienteProvider>();
      switch (snapshot.connectionState) {
        case ConnectionState.waiting:
          return const Center(
            child: CircularProgressIndicator(),
          );
        case ConnectionState.active:
          if (snapshot.hasError) return const Text('Error');
          if (snapshot.data != null) {
            //* Se condiciona la lista de consulta dependiendo del rol
            if (watch.cliente.rol == 'Admin') return ViewPredioScreen(predios:conversiondelista(snapshot.data!.docs));
            final predios = conversiondelista(snapshot.data!.docs);
              final clienteId = watch.cliente.id;
              final prediosFiltrados = predios.where((predio) => predio.idPropietario == clienteId).toList();
              return prediosFiltrados.isNotEmpty
                  ? ViewPredioScreen(predios: prediosFiltrados)
                  : ViewPredioScreen(predios: prediosFiltrados);
          } else {
            return const Text('Sin datos');
          }
        default:
          return const Text('Presiona el botón para recargar');
      }
    },
  );
}

List<Predio> conversiondelista(List registro){
  List<Predio> resultado = [];
  for (var i = 0; i < registro.length; i++) {
    resultado.add(
      Predio(id: registro[i]['Id'],
        idPropietario:registro[i]['IdPropietario'] , 
        nombrePropietario: registro[i]['NombrePropietario'],
        correoPropietario: registro[i]['CorreoPropietario'],
        telefonoPropietario: registro[i]['TelefonoPropietario'],
        nombre: registro[i]['Nombre'], 
        corregimientoVereda: registro[i]['CorregimientoVereda'], 
        departamento: registro[i]['Departamento'], 
        municipio: registro[i]['Municipio'], 
        latitud: registro[i]['Latitud'],
        longitud: registro[i]['Longitud'],
        msnm: registro[i]['MSNM'],
        profundidadSB: registro[i]['ProfundidadSB'], 
        puntos: registro[i]['Puntos'],
        temperatura: registro[i]['Temperatura'],
        lotes: registro[i]['Lotes'],
      )
    );
  }
  return resultado;
}

class ViewPredioScreen extends StatefulWidget {
  
  List<Predio> predios = [];
  ViewPredioScreen({super.key,required this.predios});
  @override
  _PredioPageState createState() => _PredioPageState();
}

class _PredioPageState extends State<ViewPredioScreen> {
  List<Predio> filteredPredios = [];
  final bool _isLoading = false;
  String filtro="";

  @override
  void initState() {
    super.initState();
  }

  void _filterPredios(String query) {
    List<Predio> filteredList = widget.predios.where((predios) {
      return predios.nombre.toLowerCase().contains(query.toLowerCase()) ||
            predios.id.toLowerCase().contains(query.toLowerCase());
    }).toList();
    filteredPredios = filteredList;
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Predios'),
        actions:const [
          // Todo: despues de crear a los usuarios hay que condicionar el menu para que cambia dependendo del tipo
          //* Ejemplo: "if (user.userType == UserType.Cliente) IconAddPredio(),"
          IconAddPredio(),
        ],
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
                onChanged: _filterPredios,
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
                itemCount: filteredPredios.isEmpty ? widget.predios.length: filteredPredios.length,
                separatorBuilder: (context, index) => const Divider(),
                itemBuilder: (context, index) {
                  return filteredPredios.isEmpty ?ListTile(
                    title: Text(widget.predios[index].nombre),
                    subtitle: Text(widget.predios[index].id),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PredioProfileView(predio: widget.predios[index]),
                          ),
                        );
                    },
                  ):
                  ListTile(
                    title: Text(filteredPredios[index].nombre),
                    subtitle: Text(filteredPredios[index].id),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PredioProfileView(predio: filteredPredios[index]),
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