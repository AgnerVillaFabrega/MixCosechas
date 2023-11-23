import 'package:flutter/material.dart';
import 'package:mixcosechas_app/model/pruebaAgua.dart';
import 'package:mixcosechas_app/model/pruebaSistemaFoliar.dart';
import 'package:mixcosechas_app/model/pruebaSuelo.dart';
import 'package:mixcosechas_app/presentation/screens/home_sceen.dart';
import 'package:mixcosechas_app/presentation/widgets/PDFs/prueba_suelo_pdf.dart';

//import 'package:mixcosechas_app/presentation/widgets/PDFs/prueba_agua_pdf.dart';
import 'package:mixcosechas_app/presentation/widgets/icons/icon_add_prueba.dart';
import 'package:mixcosechas_app/presentation/widgets/indicador_circle_progress.dart';
import 'package:mixcosechas_app/presentation/widgets/messages/quickalert_msg.dart';
import 'package:mixcosechas_app/services/firebase_service.dart';
import 'package:quickalert/models/quickalert_type.dart';

class ViewPruebasScreen extends StatelessWidget {
  const ViewPruebasScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return const ViewPruebasPage();
  }
}

class ViewPruebasPage extends StatefulWidget {
  const ViewPruebasPage({Key? key}) : super(key: key);

  @override
  _ViewPruebasPageState createState() => _ViewPruebasPageState();
}

class _ViewPruebasPageState extends State<ViewPruebasPage> {
  bool _isLoading = true;
  final ServiceFirebase _serviceFirebase = ServiceFirebase();
  List<PruebaSuelo> _pruebasSuelo = [];
  List<PruebaAgua> _pruebaAgua = [];
  List<PruebaSistemaFoliar> _pruebaSistemaFoliar = [];
  String _selectedMuestra = 'Todos';
  final List<String> _options = ['Todos', 'Suelo', 'Agua', 'Sistema foliar'];
  TextEditingController _searchController = TextEditingController();

  Future<void> _loadData() async {
    try {
      List<PruebaSuelo> pruebasSuelo = [];
      List<PruebaAgua> pruebaAgua = [];
      List<PruebaSistemaFoliar> pruebasSistemaFoliar = [];

      if (_selectedMuestra == 'Todos') {
        pruebasSuelo = await _serviceFirebase.getPruebaSuelo();
        pruebaAgua = await _serviceFirebase.getPruebaAgua();
        pruebasSistemaFoliar = await _serviceFirebase.getPruebaSistemaFoliar();
      } else if (_selectedMuestra == 'Suelo') {
        pruebasSuelo = await _serviceFirebase.getPruebaSuelo();
      } else if (_selectedMuestra == 'Agua') {
        pruebaAgua = await _serviceFirebase.getPruebaAgua();
      } else if (_selectedMuestra == 'Sistema foliar') {
        pruebasSistemaFoliar = await _serviceFirebase.getPruebaSistemaFoliar();
      }

      setState(() {
        _pruebasSuelo = pruebasSuelo;
        _pruebaAgua = pruebaAgua;
        _pruebaSistemaFoliar = pruebasSistemaFoliar;
        _isLoading = false;
      });
    } catch (e) {
      QuickAlertDialog.showAlert(
        context,
        QuickAlertType.error,
        "Error al obtener la lista de Pruebas: $e",
      );
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  List<String> list = <String>['One', 'Two', 'Three', 'Four'];

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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(color: const Color(0xFFCFCFCF)),
                    ),
                    child: TextField(
                      controller: _searchController,
                      onChanged: (value) {
                        _filterPredios(value);
                      },
                      decoration: const InputDecoration(
                        hintText: 'Buscar',
                        prefixIcon: Icon(Icons.search),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Filtrar por tipo de prueba',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(color: const Color(0xFFCFCFCF)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                          child: DropdownButtonHideUnderline(
                            child: ButtonTheme(
                              alignedDropdown: true,
                              child: DropdownButton<String>(
                                value: _selectedMuestra,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    _selectedMuestra = newValue!;
                                  });
                                  _loadData();
                                },
                                items: _options.map<DropdownMenuItem<String>>(
                                    (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Divider(),
              const SizedBox(height: 10),
              _isLoading
                  ? const IndicadorCircularProgress()
                  : Expanded(
                      child: _buildListView(),
                    ),
            ],
          ),
        ));
  }

  Widget _buildListView() {
    List<Widget> listWidgets = [];

    if (_pruebasSuelo.isNotEmpty) {
      listWidgets.add(_buildList("Suelo", _pruebasSuelo));
    }

    if (_pruebaAgua.isNotEmpty) {
      listWidgets.add(_buildList("Agua", _pruebaAgua));
    }

    if (_pruebaSistemaFoliar.isNotEmpty) {
      listWidgets.add(_buildList("Sistema foliar", _pruebaSistemaFoliar));
    }

    return ListView(
      children: listWidgets,
    );
  }

  _buildList(String title, List<dynamic> data) {
    List<dynamic> filteredData = data;

    if (_searchController.text.isNotEmpty) {
      filteredData = data.where((item) {
        return item.nombrePredio
            .toLowerCase()
            .contains(_searchController.text.toLowerCase());
      }).toList();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title,
            style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
          ),
        ),
        ListView.separated(
          shrinkWrap: true,
          itemCount: filteredData.length,
          separatorBuilder: (context, index) => const Divider(),
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(filteredData[index].nombrePredio.toString()),
              subtitle: Text(filteredData[index].nombrepropietario.toString()),
              onTap: () {
                // Acción al presionar el elemento
                // Puedes abrir una pantalla de detalles o realizar alguna otra acción

                createPruebaSueloPdf(filteredData[index]);
              },
            );
          },
        ),
      ],
    );
  }

  void _filterPredios(String searchText) {
    setState(() {
      if (searchText.isNotEmpty) {
        _pruebasSuelo = _pruebasSuelo
            .where((item) => item.nombrePredio
                .toLowerCase()
                .contains(searchText.toLowerCase()))
            .toList();
        _pruebaAgua = _pruebaAgua
            .where((item) => item.nombrePredio
                .toLowerCase()
                .contains(searchText.toLowerCase()))
            .toList();
        _pruebaSistemaFoliar = _pruebaSistemaFoliar
            .where((item) => item.nombrePredio
                .toLowerCase()
                .contains(searchText.toLowerCase()))
            .toList();
      } else {
        _loadData();
      }
    });
  }
}
