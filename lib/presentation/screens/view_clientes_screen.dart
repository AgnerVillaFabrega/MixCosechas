import 'package:flutter/material.dart';
import 'registration_clients_scren.dart';

class ViewClientScreen extends StatelessWidget {
  const ViewClientScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ClientPage();
  }
}

class ClientPage extends StatefulWidget {
  const ClientPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ClientPageState createState() => _ClientPageState();
}

class _ClientPageState extends State<ClientPage> {
  List<String> clientes = [
    'Carlos Ward',
    'Johnny Kelly',
    'Martha Long',
    'Rachel Williamson',
    'Earl Turner',
    'Theresa Peterson',
    'Laureano Aviles',
    'Angelica Sala',
    'Orlando Baez',
    'Irina Borras',
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
        title: const Text('Clientes'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const RegistrationClientScreen()),
              );
            },
          ),
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
