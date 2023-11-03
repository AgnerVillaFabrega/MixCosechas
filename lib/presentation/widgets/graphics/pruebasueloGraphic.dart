import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

  class CompuestosChart extends StatelessWidget {
  final List<String> graficaCompuestos;
  final List<double> valorgraficaCompuestos;
  CompuestosChart(this.graficaCompuestos, this.valorgraficaCompuestos);

  @override
Widget build(BuildContext context) {
  return BarChart(
    BarChartData(
      alignment: BarChartAlignment.spaceAround,
      maxY: 10.0, 
      titlesData: FlTitlesData(
        leftTitles: SideTitles(showTitles: true),
        bottomTitles: SideTitles(
          showTitles: true,
          getTitles: (value) {
            // Define las etiquetas del eje X
            if (value.toInt() >= 0 && value.toInt() < graficaCompuestos.length) {
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
                y: valorgraficaCompuestos[i],  // Valor del compuesto actual
                colors: [Colors.greenAccent],  // Color de la barra
              ),
            ],
            //showingTooltipIndicators: [0],
          ),
      ],
    ),
  );
}


}
