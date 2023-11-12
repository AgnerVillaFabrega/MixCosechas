import 'package:flutter/material.dart';  
import 'package:mixcosechas_app/model/pruebaSuelo.dart';
import 'package:mixcosechas_app/services/firebase_service.dart';  
import 'package:mixcosechas_app/presentation/widgets/indicador_circle_progress.dart';  
  
class ViewPruebaSueloWidget extends StatefulWidget {  
  const ViewPruebaSueloWidget({Key? key}) : super(key: key);  
  
  @override  
  _ViewPruebaSueloWidgetState createState() => _ViewPruebaSueloWidgetState();  
}  
  
class _ViewPruebaSueloWidgetState extends State<ViewPruebaSueloWidget> {  
  final ServiceFirebase _serviceFirebase = ServiceFirebase();  
  List<PruebaSuelo> pruebasSuelo = [];  
  bool _isLoading = true;  
  
  @override  
  void initState() {  
    super.initState();  
    _loadData();  
  }  
  
  Future<void> _loadData() async {  
    try {  
      List<PruebaSuelo> pruebas = await _serviceFirebase.getPruebaSuelo();  
      setState(() {  
        pruebasSuelo = pruebas;  
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
                  child: pruebasSuelo.isEmpty  
                      ? const Center(  
                          child: Text('No hay datos disponibles'),  
                        )  
                      : ListView.separated(  
                          itemCount: pruebasSuelo.length,  
                          separatorBuilder: (context, index) => const Divider(),  
                          itemBuilder: (context, index) {  
                            return ListTile(  
                              title: Text(pruebasSuelo[index].nombrePredio.toString()),  
                              //subtitle: Text(pruebasSuelo[index].alInterpretacion.toString()),  
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
