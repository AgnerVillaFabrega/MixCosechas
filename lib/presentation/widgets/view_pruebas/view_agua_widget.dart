import 'package:flutter/material.dart';
import 'package:mixcosechas_app/model/pruebaAgua.dart';
import 'package:mixcosechas_app/services/firebase_service.dart';  
import 'package:mixcosechas_app/presentation/widgets/indicador_circle_progress.dart';  
  
class ViewPruebaAguaWidget extends StatefulWidget {  
  const ViewPruebaAguaWidget({Key? key}) : super(key: key);  
  
  @override  
  _ViewPruebaAguaWidgetState createState() => _ViewPruebaAguaWidgetState();  
}  
  
class _ViewPruebaAguaWidgetState extends State<ViewPruebaAguaWidget> {  
  final ServiceFirebase _serviceFirebase = ServiceFirebase();  
  List<PruebaAgua> _pruebasAgua = [];  
  bool _isLoading = true;  
  
  @override  
  void initState() {  
    super.initState();  
    _loadData();  
  }  
  
  Future<void> _loadData() async {  
    try {  
      List<PruebaAgua> pruebasAgua = await _serviceFirebase.getPruebaAgua();  
      setState(() {  
        _pruebasAgua = pruebasAgua;  
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
                  child: _pruebasAgua.isEmpty  
                      ? const Center(  
                          child: Text('No hay datos disponibles'),  
                        )  
                      : ListView.separated(  
                          itemCount: _pruebasAgua.length,  
                          separatorBuilder: (context, index) => const Divider(),  
                          itemBuilder: (context, index) {  
                            return ListTile(  
                              title: Text(_pruebasAgua[index].nombrePredio.toString()),  
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
