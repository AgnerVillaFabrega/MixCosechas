// ignore_for_file: must_be_immutable, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../model/predios.dart';
import 'package:mixcosechas_app/presentation/widgets/indicador_circle_progress.dart';
import 'package:mixcosechas_app/presentation/widgets/icon_add_predio.dart';

Widget cargarDatosPredios(){
  return StreamBuilder(
    stream: FirebaseFirestore.instance.collection('Predios').snapshots(),
    builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
      switch(snapshot.connectionState){
        case ConnectionState.waiting: 
          return const Center(
            child: CircularProgressIndicator(),
          );
        case ConnectionState.active: 
          if(snapshot.hasError) return const Text('error');
          return snapshot.data != null? ViewPredioScreen(predios:conversiondelista(snapshot.data!.docs)): const Text('Sin datos');
        default: return const Text('Presiona el boton para recargar');
      }
    }
  );
}

List<Predio> conversiondelista(List registro){
  List<Predio> resultado = [];
  for (var i = 0; i < registro.length; i++) {
    resultado.add(
      Predio(id: registro[i]['Id'],
        idUsuario:registro[i]['IdUsuario'] , 
        nombre: registro[i]['Nombre'], 
        corregimientoVereda: registro[i]['CorregimientoVereda'], 
        departamento: registro[i]['Departamento'], 
        municipio: registro[i]['Municipio'], 
        cultivo: registro[i]['Cultivo'],
        variedad: registro[i]['variedad'],
        edad: registro[i]['edad'],
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
                color: const Color.fromARGB(255, 227, 227, 227),
                borderRadius: BorderRadius.circular(6),
                border: Border.all(color: const Color(0xFFCFCFCF)), // Contorno de color #cfcfcf
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
                      // Lógica para seleccionar un cliente
                    },
                  ):
                  ListTile(
                    title: Text(filteredPredios[index].nombre),
                    subtitle: Text(filteredPredios[index].id),
                    onTap: () {
                      // Lógica para seleccionar un cliente
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