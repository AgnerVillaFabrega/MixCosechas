import 'package:flutter/material.dart';
import 'package:mixcosechas_app/presentation/widgets/icon_add_predio.dart';

class ViewPredioScreen extends StatelessWidget {
  const ViewPredioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const PredioPage();
  }
}


class PredioPage extends StatefulWidget {
  const PredioPage({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _PredioPageState createState() => _PredioPageState();
}

class _PredioPageState extends State<PredioPage> {
  List<String> clientes = [
    'El Manglar',
    'Flora Real',
    'Tres Arroyos',
    'Villa María',
    'Finca Buena Vista',
    'Finca La Esperanza',
    'El Arenal',
    'Finca Villa María',
    'Rancho Los Álamos',
    // ... Agrega más clientes aquí
  ];

  List<String> filteredClientes = [];

  @override
  void initState() {
    super.initState();
    filteredClientes = clientes;
  }

  void _filterClientes(String searchText) {
    setState(() {
      filteredClientes = clientes
          .where(
              (cliente) => cliente.toLowerCase().contains(searchText.toLowerCase()))
          .toList();
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
                onChanged: _filterClientes,
                decoration: const InputDecoration(
                  hintText: 'Buscar',
                  prefixIcon: Icon(Icons.search),
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            Expanded(
              child: ListView.separated(
                itemCount: filteredClientes.length,
                separatorBuilder: (context, index) => const Divider(),
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(filteredClientes[index]),
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