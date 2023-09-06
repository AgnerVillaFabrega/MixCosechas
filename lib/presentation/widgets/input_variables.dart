import 'package:flutter/material.dart';

class ImputVariable extends StatelessWidget {
  const ImputVariable({
    super.key,
    required String nombreVariable,
    required TextEditingController controller
  }) :_nombreVariable = nombreVariable, _controller = controller;

  final TextEditingController _controller;
  final String _nombreVariable;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: _nombreVariable,
        labelStyle: const TextStyle(color: Color(0xFF19AA89),fontWeight: FontWeight.w600),
      ),
      validator: (String? value){
        if (value ==null || value.isEmpty) {
          return "Campo requerido";
        }
        return null;
      }
    );
  }
}