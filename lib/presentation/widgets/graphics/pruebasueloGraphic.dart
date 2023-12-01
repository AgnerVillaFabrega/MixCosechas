import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class CompuestosChart extends StatelessWidget {
  final List<String> graficaCompuestos;
  final List<int> valorgraficaCompuestos;
  final key = GlobalKey();
  CompuestosChart(this.graficaCompuestos, this.valorgraficaCompuestos);

  @override
  Widget build(BuildContext context) {
    return BarChart(
      key: key,
      BarChartData(
        alignment: BarChartAlignment.spaceAround,
        maxY: 11.0,
        titlesData: FlTitlesData(
          leftTitles: SideTitles(showTitles: true),
          bottomTitles: SideTitles(
            showTitles: true,
            getTitles: (value) {
              // Define las etiquetas del eje X
              if (value.toInt() >= 0 &&
                  value.toInt() < graficaCompuestos.length) {
                return graficaCompuestos[value.toInt()];
              } else {
                return '';
              }
            },
          ),
        ),
        borderData: FlBorderData(
          show: true,
        ),
        barGroups: [
          for (int i = 0; i < graficaCompuestos.length; i++)
            BarChartGroupData(
              x: i,
              barRods: [
                BarChartRodData(
                  y: double.parse(valorgraficaCompuestos[i].toString()),
                  colors: [getBarColor(i)],
                  width: 20.0,
                ),
              ],
            ),
        ],
      ),
    );
  }

  Color getBarColor(int index) {
    switch (index) {
      case 0:
        return Color.fromRGBO(96, 173, 245, 0.847);
      case 1:
        return Color.fromRGBO(237, 124, 49, 1);
      case 2:
        return Color.fromRGBO(165, 165, 165, 1);
      case 3:
        return Color.fromRGBO(255, 251, 0, 1);
      case 4:
        return Color.fromRGBO(68, 114, 196, 40);
      case 5:
        return Color.fromRGBO(112, 173, 71, 40);
      case 6:
        return Color.fromRGBO(255, 0, 0, 1);
      case 7:
        return Color.fromRGBO(153, 115, 0, 40);
      case 8:
        return Color.fromRGBO(99, 99, 99, 10);
      case 9:
        return Color.fromRGBO(38, 68, 120, 10);
      case 10:
        return Color.fromRGBO(26, 217, 61, 60);
      case 11:
        return Color.fromRGBO(124, 175, 221, 40);
      case 12:
        return Color.fromRGBO(241, 151, 90, 40);
      case 13:
      default:
        return Color.fromRGBO(255, 0, 0, 84);
    }
  }
}
