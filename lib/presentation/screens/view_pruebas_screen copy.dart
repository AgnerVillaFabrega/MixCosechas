import 'package:flutter/material.dart';
import 'package:mixcosechas_app/model/pruebaAgua.dart';
import 'package:mixcosechas_app/model/pruebaSistemaFoliar.dart';
import 'package:mixcosechas_app/model/pruebaSuelo.dart';
import 'package:mixcosechas_app/presentation/screens/home_sceen.dart';
import '../../services/firebase_service.dart';
import '../widgets/icons/icon_add_prueba.dart';
import '../widgets/indicador_circle_progress.dart';

class ViewPruebasScreen extends StatefulWidget {
  const ViewPruebasScreen({Key? key}) : super(key: key);

  @override
  _ViewPruebasScreenState createState() => _ViewPruebasScreenState();
}

class _ViewPruebasScreenState extends State<ViewPruebasScreen> {
  final ServiceFirebase _serviceFirebase = ServiceFirebase();
  List<PruebaSuelo> pruebasSuelo = [];
  List<PruebaAgua> pruebasAgua = [];
  List<PruebaSistemaFoliar> pruebasSistemaFoliar = [];
  bool _isLoading = true; // Inicialmente, estamos cargando datos.

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    try {
      // Llama a la función para obtener la lista de PruebaSuelo.
      List<PruebaSuelo> pruebas = await _serviceFirebase.getPruebaSuelo();
      List<PruebaAgua> pruebas_agua = await _serviceFirebase.getPruebaAgua();
      List<PruebaSistemaFoliar> pruebas_sistemafoliar = await _serviceFirebase.getPruebaSistemaFoliar();
      setState(() {
        pruebasSuelo = pruebas;
        pruebasAgua= pruebas_agua;
        pruebasSistemaFoliar= pruebas_sistemafoliar;
        _isLoading = false; // Los datos se han cargado, establecemos _isLoading a falso.
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pruebas'),
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
        actions: const [
          IconAddPrueba(),
        ],
      ),
      body: Padding(
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
                ? const IndicadorCircularProgress() // Muestra un indicador de carga mientras se obtienen los datos.
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
                                subtitle: Text(pruebasSuelo[index].idPredio.toString()),
                                onTap: () {
                                  // Puedes implementar la navegación aquí si es necesario.
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
