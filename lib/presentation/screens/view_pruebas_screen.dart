import 'package:flutter/material.dart';
import 'package:mixcosechas_app/model/pruebaAgua.dart';
import 'package:mixcosechas_app/model/pruebaSuelo.dart';
import 'package:mixcosechas_app/model/pruebaSistemaFoliar.dart';
import 'package:mixcosechas_app/presentation/screens/home_sceen.dart';
import 'package:mixcosechas_app/presentation/widgets/PDFs/prueba_agua_pdf.dart';
import 'package:mixcosechas_app/presentation/widgets/PDFs/prueba_suelo_pdf.dart';
import 'package:mixcosechas_app/presentation/widgets/icons/icon_add_prueba.dart';
import 'package:mixcosechas_app/presentation/widgets/indicador_circle_progress.dart';
import 'package:mixcosechas_app/presentation/widgets/messages/quickalert_msg.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:mixcosechas_app/services/firebase_service.dart';

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
  List<dynamic> _pruebas = [];
  String _selectedMuestra = 'Todos';
  final List<String> _options = ['Todos', 'Suelo', 'Agua', 'Sistema foliar'];
  TextEditingController _searchController = TextEditingController();

  Future<void> _loadData() async {
    try {
      List<dynamic> pruebas = [];

      if (_selectedMuestra == 'Todos') {
        pruebas.addAll(await _serviceFirebase.getPruebaSuelo());
        pruebas.addAll(await _serviceFirebase.getPruebaAgua());
        pruebas.addAll(await _serviceFirebase.getPruebaSistemaFoliar());
      } else if (_selectedMuestra == 'Suelo') {
        pruebas.addAll(await _serviceFirebase.getPruebaSuelo());
      } else if (_selectedMuestra == 'Agua') {
        pruebas.addAll(await _serviceFirebase.getPruebaAgua());
      } else if (_selectedMuestra == 'Sistema foliar') {
        pruebas.addAll(await _serviceFirebase.getPruebaSistemaFoliar());
      }

      setState(() {
        _pruebas = pruebas;
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
                      _filterPruebas(value);
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
                                },
                              ).toList(),
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
                : _pruebas.isEmpty
                    ? const Text('No hay pruebas disponibles')
                    : _buildListView(),
          ],
        ),
      ),
    );
  }

  Widget _buildListView() {
    return Expanded(
      child: ListView.builder(
        itemCount: _pruebas.length,
        itemBuilder: (context, index) {
          return _buildListItem(_pruebas[index]);
        },
      ),
    );
  }

  Widget _buildListItem(dynamic prueba) {
    return ListTile(
      title: Text(prueba.nombrePredio),
      subtitle: Text(prueba.nombrepropietario),
      onTap: () {
        if (prueba is PruebaSuelo) {
          createPruebaSueloPdf(prueba);
        } else if (prueba is PruebaAgua) {
          createPruebaAguaPdf(prueba);
        } else if (prueba is PruebaSistemaFoliar) {
          // Lógica para el PDF de Sistema foliar
          QuickAlertDialog.showAlert(
            context,
            QuickAlertType.warning,
            "Actualmente no generamos un reporte para esta prueba, pronto podrás usarlo",
          );
        }
      },
    );
  }

  void _filterPruebas(String searchText) {
    setState(() {
      if (searchText.isNotEmpty) {
        _pruebas = _pruebas
            .where((item) =>
                item.nombrePredio.toLowerCase().contains(searchText.toLowerCase()))
            .toList();
      } else {
        _loadData();
      }
    });
  }
}
