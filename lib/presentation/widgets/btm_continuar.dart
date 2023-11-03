import 'package:flutter/material.dart';

class ContinuarPruebasButtom extends StatelessWidget {
  const ContinuarPruebasButtom({super.key, required VoidCallback onTap})
      : _onTap = onTap;
  final VoidCallback _onTap;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: _onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF19AA89),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
        ),
        child: const Text(
          'Continuar',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Color(0XFFeeeeee),
          ),
        ),
      ),
    );
  }
}