import 'package:flutter/material.dart';
import 'package:mixcosechas_app/model/pruebaAgua.dart';
import 'package:mixcosechas_app/model/pruebaSuelo.dart';

class ShowAgua extends StatelessWidget {
  const ShowAgua(
      {super.key,
      required nombreCompuestos,
      required valorCompuestos,
      required interpretacionCompuestos,
      required pruebaagua})
      : _nombreCompuestos = nombreCompuestos,
        _valorCompuestos = valorCompuestos,
        _interpretacionCompuestos = interpretacionCompuestos,
        _pa = pruebaagua;

  final List<String> _nombreCompuestos;
  final List<double> _valorCompuestos;
  final List<String> _interpretacionCompuestos;
  final PruebaAgua _pa;
  

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
