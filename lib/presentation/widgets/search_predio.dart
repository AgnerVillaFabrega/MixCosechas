import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class SearchPredio extends StatelessWidget {
  const SearchPredio({
    super.key,
    required this.predioFilterController,
    required this.prediosCollection,
    required TextEditingController idPredioController,
    required TextEditingController corregimientoPredioController,
    required TextEditingController cultivoPredioController,
    required TextEditingController municipioPredioController,
    required TextEditingController variedadPredioController,
    required TextEditingController dptoPredioController,
    required TextEditingController edadPredioController,
    required TextEditingController idpropietarioPredioController,
    required TextEditingController nombrepropietarioPredioController,
    required TextEditingController telefonopropietarioPredioController,
    required TextEditingController correopropietarioPredioController,
  }) : _idPredioController = idPredioController, _corregimientoPredioController = corregimientoPredioController, _cultivoPredioController = cultivoPredioController, 
      _municipioPredioController = municipioPredioController, _variedadPredioController = variedadPredioController, _dptoPredioController = dptoPredioController,
      _edadPredioController = edadPredioController,_idpropietarioPredioController = idpropietarioPredioController, _nombrepropietarioPredioController = nombrepropietarioPredioController, 
      _telefonopropietarioPredioController = telefonopropietarioPredioController, _correopropietarioPredioController = correopropietarioPredioController;

  final TextEditingController predioFilterController;
  final CollectionReference<Object?> prediosCollection;
  
  final TextEditingController _idPredioController;
  final TextEditingController _corregimientoPredioController;
  final TextEditingController _cultivoPredioController;
  final TextEditingController _municipioPredioController;
  final TextEditingController _variedadPredioController;
  final TextEditingController _dptoPredioController;
  final TextEditingController _edadPredioController;
  final TextEditingController _idpropietarioPredioController;
  final TextEditingController _nombrepropietarioPredioController;
  final TextEditingController _telefonopropietarioPredioController;
  final TextEditingController _correopropietarioPredioController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TypeAheadField<DocumentSnapshot>(
          textFieldConfiguration: TextFieldConfiguration(
            controller: predioFilterController,
            decoration: const InputDecoration(
              labelText: 'Buscar un predio',
            ),
          ),
          suggestionsCallback: (pattern) async {
            final querySnapshot = await prediosCollection
                .where('Nombre', isGreaterThanOrEqualTo: pattern.toLowerCase())
                .where('Nombre', isLessThan: '${pattern.toLowerCase()}z')
                .get();
            return querySnapshot.docs; // Convierte a lista de DocumentSnapshot
          },

          itemBuilder: (context, suggestion) {
            final predioData = suggestion.data() as Map<String, dynamic>;
            return ListTile(
              title: Text(predioData['Nombre']),
              subtitle: Text(predioData['NombrePropietario']),
            );
          },
          noItemsFoundBuilder: (context) {
            return const Text('No se encontraron predios');
          },
          onSuggestionSelected: (suggestion) {
            final predioData = suggestion.data() as Map<String, dynamic>;
            predioFilterController.text = predioData['Nombre'];

            _idPredioController.text = predioData['Id'];
            _corregimientoPredioController.text = predioData['CorregimientoVereda'];
            _cultivoPredioController.text = predioData['Cultivo']; 
            _municipioPredioController.text = predioData['Municipio'];
            _variedadPredioController.text = predioData['Variedad'];
            _dptoPredioController.text =predioData['Departamento']; 
            _edadPredioController.text = predioData['Edad']; 
            _idpropietarioPredioController.text = predioData['IdPropietario'];
            _nombrepropietarioPredioController.text = predioData['NombrePropietario'];
            _telefonopropietarioPredioController.text =  predioData['TelefonoPropietario'];
            _correopropietarioPredioController.text = predioData['CorreoPropietario'];
          },
        ),
        Row(
          children: [
            Expanded(
              child:TextFormField(
                enabled: false, 
                controller: _idpropietarioPredioController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Identificación',
                  labelStyle: TextStyle(
                      color: Color(0xFF19AA89), fontWeight: FontWeight.w600),
                ),
              ),
            ),
            Expanded(
              child:TextFormField(
                enabled: false, 
                controller: _nombrepropietarioPredioController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Nombre Propietario',
                  labelStyle: TextStyle(
                      color: Color(0xFF19AA89), fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ],
        ),
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
        Row(
          children: [
            Expanded(
              child:TextFormField(
                enabled: false, 
                controller: _dptoPredioController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Departamento',
                  labelStyle: TextStyle(
                      color: Color(0xFF19AA89), fontWeight: FontWeight.w600),
                ),
              ),
            ),
            Expanded(
              child:TextFormField(
                enabled: false, 
                controller: _municipioPredioController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Municipio',
                  labelStyle: TextStyle(
                      color: Color(0xFF19AA89), fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ],
        ),
        TextFormField(
          enabled: false, 
          controller: _corregimientoPredioController,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            labelText: 'Corregimiento',
            labelStyle: TextStyle(
                color: Color(0xFF19AA89), fontWeight: FontWeight.w600),
          ),
        ),
        TextFormField(
          enabled: false, 
          controller: _cultivoPredioController,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            labelText: 'Cultivo',
            labelStyle: TextStyle(
                color: Color(0xFF19AA89), fontWeight: FontWeight.w600),
          ),
        ),
        Row(
          children: [
            Expanded(
              child:TextFormField(
                enabled: false, 
                controller: _variedadPredioController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Variedad',
                  labelStyle: TextStyle(
                      color: Color(0xFF19AA89), fontWeight: FontWeight.w600),
                ),
              ),
            ),
            Expanded(
              child:TextFormField(
                enabled: false, 
                controller: _edadPredioController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Edad del cultivo',
                  labelStyle: TextStyle(
                      color: Color(0xFF19AA89), fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}