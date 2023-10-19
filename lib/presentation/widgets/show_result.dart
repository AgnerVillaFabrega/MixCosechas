import 'package:flutter/material.dart';

class ShowResult extends StatelessWidget {
  const ShowResult({
    super.key, 
    required nombreCompuestos, 
    required valorCompuestos, 
    required interpretacionCompuestos
  }):_nombreCompuestos= nombreCompuestos, _valorCompuestos= valorCompuestos, _interpretacionCompuestos= interpretacionCompuestos ;
  
  final List<String> _nombreCompuestos;
  final List<double> _valorCompuestos;
  final List<String> _interpretacionCompuestos;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resultados de analisis'),
      ),
      body: SingleChildScrollView(
        child: DataTable(
          columns: const [
            DataColumn(label: Text('Nombre\nCompuesto')),
            DataColumn(label: Text('Valor\nCompuesto')),
            DataColumn(label: Text('Interpretación')),
          ],
          rows: List<DataRow>.generate(
            _nombreCompuestos.length,
            (index) => DataRow(
              cells: [
                DataCell(Text(_nombreCompuestos[index])),
                
                DataCell(Text(_valorCompuestos[index].toStringAsFixed(3))),
                DataCell(Text(_interpretacionCompuestos[index])),
              ],
            ),
          ),
        ),
      ),
    );
  }
}