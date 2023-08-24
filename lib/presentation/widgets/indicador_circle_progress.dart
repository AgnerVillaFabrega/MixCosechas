import 'package:flutter/material.dart';

class IndicadorCircularProgress extends StatelessWidget {
  const IndicadorCircularProgress({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF19AA89)),
        backgroundColor: Colors.grey,
        strokeWidth: 4.0,
      );
  }
}

