import 'package:flutter/material.dart';
import 'package:mixcosechas_app/services/firebase_service.dart';
import '../../model/clientes.dart';
import 'registration_clients_scren.dart';
import 'package:mixcosechas_app/presentation/widgets/icon_add_clientes.dart';

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
  
  _ClientPageState createState() => _ClientPageState();
}

class _ClientPageState extends State<ClientPage> {


 ServiceFirebase _serviceFirebase = ServiceFirebase();

  List<Cliente> _users = [];
  List<Cliente> _filteredClientes = [];

  @override
  void initState() {
    super.initState();
    _getUsers();
  }

  void _getUsers() async {
    List<Cliente> users = await _serviceFirebase.getPeople();
    setState(() {
      _users = users;
      _filteredClientes = users;
    });
  }


  void _filterClientes(String query) {
    List<Cliente> filteredList = _users.where((cliente) {
      return cliente.nombre.toLowerCase().contains(query.toLowerCase()) ||
             cliente.id.toLowerCase().contains(query.toLowerCase());
    }).toList();

    setState(() {
      _filteredClientes = filteredList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Clientes'),
        actions:const [
          // Todo: despues de crear a los usuarios hay que condicionar el menu para que cambia dependendo del tipo
          //* Ejemplo: "if (user.userType == UserType.Cliente) IconAddClientes(),"
          IconAddClientes(),
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
                itemCount: _filteredClientes.length,
                separatorBuilder: (context, index) => const Divider(),
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_filteredClientes[index].nombre),
                    subtitle: Text(_filteredClientes[index].telefono),
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


