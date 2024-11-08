import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:provider/provider.dart';

import '../provider/ClienteProvider.dart';


class SearchPropietario extends StatelessWidget {
  const SearchPropietario({
    super.key,
    required this.propietarioFilterController,
    required this.propietarioCollection,
    required TextEditingController nombrepropietarioPredioController,
    required TextEditingController telefonopropietarioPredioController,
    required TextEditingController correopropietarioPredioController,
  }) : _nombrepropietarioPredioController = nombrepropietarioPredioController, _telefonopropietarioPredioController = telefonopropietarioPredioController, _correopropietarioPredioController = correopropietarioPredioController;

  final TextEditingController propietarioFilterController;
  final CollectionReference<Object?> propietarioCollection;
  final TextEditingController _nombrepropietarioPredioController;
  final TextEditingController _telefonopropietarioPredioController;
  final TextEditingController _correopropietarioPredioController;

  @override
  Widget build(BuildContext context) {
    ClienteProvider watch =  context.watch<ClienteProvider>();
    if (watch.cliente.rol != 'Admin') {
      propietarioFilterController.text = watch.cliente.id;
      _nombrepropietarioPredioController.text =  watch.cliente.nombre;
      _telefonopropietarioPredioController.text =   watch.cliente.telefono;
      _correopropietarioPredioController.text = watch.cliente.correo;

      return Column(
        children: [
          TextFormField(
            enabled: false, 
            controller: propietarioFilterController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'Identificacion',
              labelStyle: TextStyle(
                  color: Color(0xFF19AA89), fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(height: 10),
          TextFormField(
            enabled: false, 
            controller: _nombrepropietarioPredioController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'Propietario',
              labelStyle: TextStyle(
                  color: Color(0xFF19AA89), fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(height: 10),
          TextFormField(
            enabled: false, 
            controller: _telefonopropietarioPredioController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'Telefono',
              labelStyle: TextStyle(
                  color: Color(0xFF19AA89), fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(height: 10),
          TextFormField(
            enabled: false, 
            controller: _correopropietarioPredioController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'Correo electronico',
              labelStyle: TextStyle(
                  color: Color(0xFF19AA89), fontWeight: FontWeight.w600),
            ),
          ),
        ],
      );
    }else{
      return Column(
        children: [
          TypeAheadField<DocumentSnapshot>(
            textFieldConfiguration: TextFieldConfiguration(
              controller: propietarioFilterController,
              decoration: const InputDecoration(
                labelText: 'Buscar por identificacion',
              ),
            ),
            suggestionsCallback: (pattern) async {
              final querySnapshot = await propietarioCollection
                  .where('Id', isGreaterThanOrEqualTo: pattern.toLowerCase())
                  .where('Id', isLessThan: '${pattern.toLowerCase()}z')
                  .get();
              return querySnapshot.docs;
            },

            itemBuilder: (context, suggestion) {
              final predioData = suggestion.data() as Map<String, dynamic>;
              return ListTile(
                title: Text(predioData['Id']),
                subtitle: Text(predioData['Nombre']),
              );
            },
            noItemsFoundBuilder: (context) {
              return const Text('No se encontraron usuarios con esa identificacion');
            },
            onSuggestionSelected: (suggestion) {
              final predioData = suggestion.data() as Map<String, dynamic>;
              propietarioFilterController.text = predioData['Id'];
              _nombrepropietarioPredioController.text = predioData['Nombre'];
              _telefonopropietarioPredioController.text =  predioData['Telefono'];
              _correopropietarioPredioController.text = predioData['Correo'];
            },
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child:TextFormField(
                  enabled: false, 
                  controller: _nombrepropietarioPredioController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Propietario',
                    labelStyle: TextStyle(
                        color: Color(0xFF19AA89), fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                child:TextFormField(
                  enabled: false, 
                  controller: _telefonopropietarioPredioController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Telefono',
                    labelStyle: TextStyle(
                        color: Color(0xFF19AA89), fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          TextFormField(
            enabled: false, 
            controller: _correopropietarioPredioController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'Correo electronico',
              labelStyle: TextStyle(
                  color: Color(0xFF19AA89), fontWeight: FontWeight.w600),
            ),
          ),
        ],
      );
    }  
  }
}