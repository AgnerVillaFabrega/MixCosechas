import 'package:flutter/material.dart';
import 'package:mixcosechas_app/model/pruebaSistemaFoliar.dart';
import 'package:mixcosechas_app/services/firebase_service.dart';  
import 'package:mixcosechas_app/presentation/widgets/indicador_circle_progress.dart';  
  
class ViewPruebaSistemaFoliarWidget extends StatefulWidget {  
  const ViewPruebaSistemaFoliarWidget({Key? key}) : super(key: key);  
  
  @override  
  _ViewPruebaSistemaFoliarWidgetState createState() => _ViewPruebaSistemaFoliarWidgetState();  
}  
  
class _ViewPruebaSistemaFoliarWidgetState extends State<ViewPruebaSistemaFoliarWidget> {  
  final ServiceFirebase _serviceFirebase = ServiceFirebase();  
  List<PruebaSistemaFoliar> _pruebasSistemaFoliar = [];  
  bool _isLoading = true;  
  
  @override  
  void initState() {  
    super.initState();  
    _loadData();  
  }  
  
  Future<void> _loadData() async {  
    try {  
      List<PruebaSistemaFoliar> pruebasSistemaFoliar = await _serviceFirebase.getPruebaSistemaFoliar();  
      setState(() {  
        _pruebasSistemaFoliar = pruebasSistemaFoliar;  
        _isLoading = false;  
      });  
    } catch (e) {  
      print("Error al obtener la lista de Pruebas de Suelo: $e");  
      setState(() {  
        _isLoading = false;  
      });  
    }  
  }  
  
  @override  
  Widget build(BuildContext context) {  
    return Padding(  
      padding: const EdgeInsets.all(16.0),  
      child: Column(  
        children: [  
          Container(  
            decoration: BoxDecoration(  
              borderRadius: BorderRadius.circular(6),  
              border: Border.all(color: const Color(0xFFCFCFCF)),  
            ),  
            child: const TextField(  
              decoration: InputDecoration(  
                hintText: 'Buscar',  
                prefixIcon: Icon(Icons.search),  
                border: InputBorder.none,  
              ),  
            ),  
          ),  
          const SizedBox(height: 16.0),  
          _isLoading  
              ? const IndicadorCircularProgress()  
              : Expanded(  
                  child: _pruebasSistemaFoliar.isEmpty  
                      ? const Center(  
                          child: Text('No hay datos disponibles'),  
                        )  
                      : ListView.separated(  
                          itemCount: _pruebasSistemaFoliar.length,  
                          separatorBuilder: (context, index) => const Divider(),  
                          itemBuilder: (context, index) {  
                            return ListTile(  
                              title: Text(_pruebasSistemaFoliar[index].nombrePredio.toString()),  
                              //subtitle: Text(ppruebasSistemaFoliar[index].alInterpretacion.toString()),  
                              onTap: () {},  
                            );  
                          },  
                        ),  
                ),  
        ],  
      ),  
    ); 
  }  
}  
