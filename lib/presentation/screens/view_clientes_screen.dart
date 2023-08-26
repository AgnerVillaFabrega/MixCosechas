// ignore_for_file: must_be_immutable, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:mixcosechas_app/presentation/widgets/indicador_circle_progress.dart';
import '../../model/clientes.dart';
import 'package:mixcosechas_app/presentation/widgets/icon_add_clientes.dart';


class ViewClientScreen extends StatefulWidget {
  List<Cliente> cliente = [];
  ViewClientScreen({super.key,required this.cliente});

  @override
  _ViewClientScreenState createState() => _ViewClientScreenState();
}

class _ViewClientScreenState extends State<ViewClientScreen> {

  List<Cliente> _filteredClientes = [];
  final bool _isLoading = false;
  String filtro="";

  @override
  void initState() {
    super.initState();
  }


  void _filterClientes(String query) {
    List<Cliente> filteredList = widget.cliente.where((cliente) {
      return cliente.nombre.toLowerCase().contains(query.toLowerCase()) ||
            cliente.id.toLowerCase().contains(query.toLowerCase());
    }).toList();
    _filteredClientes = filteredList;
    setState(() {
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
            _isLoading?const IndicadorCircularProgress()
              :Expanded(
              child: ListView.separated(
                itemCount: _filteredClientes.isEmpty ? widget.cliente.length: _filteredClientes.length,
                separatorBuilder: (context, index) => const Divider(),
                itemBuilder: (context, index) {
                  return _filteredClientes.isEmpty ?ListTile(
                    title: Text(widget.cliente[index].nombre),
                    subtitle: Text(widget.cliente[index].id),
                    onTap: () {
                      // Lógica para seleccionar un cliente
                    },
                  ):
                  ListTile(
                    title: Text(_filteredClientes[index].nombre),
                    subtitle: Text(_filteredClientes[index].id),
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


