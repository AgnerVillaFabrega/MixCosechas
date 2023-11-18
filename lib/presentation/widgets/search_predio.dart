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
    required TextEditingController municipioPredioController,
    required TextEditingController dptoPredioController,
    required TextEditingController idpropietarioPredioController,
    required TextEditingController nombrepropietarioPredioController,
    required TextEditingController telefonopropietarioPredioController,
    required TextEditingController correopropietarioPredioController,
    required TextEditingController latitudPredioController,
    required TextEditingController longitudPredioController,
    required TextEditingController msnmPredioController,
    required TextEditingController profundidadSBPredioController,
    required TextEditingController puntosPredioController,
    required TextEditingController temperaturaPredioController,
    required TextEditingController lotesPredioController,
  }) : _idPredioController = idPredioController, _corregimientoPredioController = corregimientoPredioController,  
      _municipioPredioController = municipioPredioController, _dptoPredioController = dptoPredioController,
      _idpropietarioPredioController = idpropietarioPredioController, _nombrepropietarioPredioController = nombrepropietarioPredioController, 
      _telefonopropietarioPredioController = telefonopropietarioPredioController, _correopropietarioPredioController = correopropietarioPredioController, 
      _latitudPredioController = latitudPredioController, _longitudPredioController = longitudPredioController, _msnmPredioController = msnmPredioController,
      _profundidadSBPredioController = profundidadSBPredioController, _puntosPredioController = puntosPredioController, 
      _temperaturaPredioController = temperaturaPredioController, _lotesPredioController = lotesPredioController;

  final TextEditingController predioFilterController;
  final CollectionReference<Object?> prediosCollection;
  
  final TextEditingController _idPredioController;
  final TextEditingController _corregimientoPredioController;
  final TextEditingController _municipioPredioController;
  final TextEditingController _dptoPredioController;
  final TextEditingController _idpropietarioPredioController;
  final TextEditingController _nombrepropietarioPredioController;
  final TextEditingController _telefonopropietarioPredioController;
  final TextEditingController _correopropietarioPredioController;

  
  final TextEditingController _latitudPredioController;
  final TextEditingController _longitudPredioController;
  final TextEditingController _msnmPredioController;
  final TextEditingController _profundidadSBPredioController;
  final TextEditingController _puntosPredioController;
  final TextEditingController _temperaturaPredioController;
  final TextEditingController _lotesPredioController;

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
            _municipioPredioController.text = predioData['Municipio'];
            _dptoPredioController.text =predioData['Departamento']; 
            _idpropietarioPredioController.text = predioData['IdPropietario'];
            _nombrepropietarioPredioController.text = predioData['NombrePropietario'];
            _telefonopropietarioPredioController.text =  predioData['TelefonoPropietario'];
            _correopropietarioPredioController.text = predioData['CorreoPropietario'];
            _latitudPredioController.text = predioData['Latitud'];
            _longitudPredioController.text = predioData['Longitud'];
            _msnmPredioController.text =predioData['MSNM']; 
            _profundidadSBPredioController.text = predioData['ProfundidadSB'];
            _puntosPredioController.text = predioData['Puntos'];
            _temperaturaPredioController.text =  predioData['Temperatura'];
            _lotesPredioController.text = predioData['Lotes'].toString();
          },
        ),

        TextFormField(
          enabled: false, 
          controller: _idPredioController,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            labelText: 'Identificación del predio',
            labelStyle: TextStyle(
                color: Color(0xFF19AA89), fontWeight: FontWeight.w600),
          ),
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
        Row(
          children: [
            Expanded(
              child:TextFormField(
                enabled: false, 
                controller: _msnmPredioController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'MSNM',
                  labelStyle: TextStyle(
                      color: Color(0xFF19AA89), fontWeight: FontWeight.w600),
                ),
              ),
            ),
            Expanded(
              child:TextFormField(
                enabled: false, 
                controller: _temperaturaPredioController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Temperatura °C',
                  labelStyle: TextStyle(
                      color: Color(0xFF19AA89), fontWeight: FontWeight.w600),
                ),
              ),
            ),
            Expanded(
              child:TextFormField(
                enabled: false, 
                controller: _lotesPredioController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Lotes',
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