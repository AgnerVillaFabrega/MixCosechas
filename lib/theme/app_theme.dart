import 'package:flutter/material.dart';

//
const Color _customColor = Color(0xFF19AA89);
const List<Color> _colorTheme = [
  _customColor,
  Colors.pink,
  Colors.green,
  Colors.yellow,
  Colors.orange,
  Colors.blue,
];

class AppTheme {
  final int selectedColor;

  AppTheme({this.selectedColor = 0})
      : assert(selectedColor >= 0 && selectedColor < _colorTheme.length,
            'Colors must be between 0 and ${_colorTheme.length}');

  ThemeData theme() {
    return ThemeData(
      fontFamily: 'Asap',
      useMaterial3: true,
      colorSchemeSeed: _colorTheme[selectedColor],
      appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color: _customColor), // Cambia el color de los íconos
        ),
      //* ACTIVAR MODO OSCURO
      //brightness: Brightness.dark
    );
  }
}
