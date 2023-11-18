import 'dart:ui';

import 'package:syncfusion_flutter_pdf/pdf.dart';
import '../../../model/predios.dart';
import '../../../model/pruebaSuelo.dart';

// Future<void> createPruebaSueloPdf(PruebaSuelo pruebaSuelo, Predio predio){

//   PdfDocument document = PdfDocument();
//   final page = document.pages.add();
//   //String pattern = 'yyyy-MM-dd';

//   page.graphics.drawString('RESULTADOS ANÁLISIS DE SUELO AGRICOLA', PdfStandardFont( PdfFontFamily.timesRoman, 20));

//   PdfGrid grid = PdfGrid();
//   grid.style = PdfGridStyle(
//     cellPadding: PdfPaddings(left: 5,right: 2,top: 2,bottom: 2),
//     font: PdfStandardFont(PdfFontFamily.timesRoman,10)
//   );

//   grid.columns.add(count: 6);

//   PdfGridRow row = grid.rows.add();
//   row.cells[0].value = 'Nombre:';
//   row.cells[1].value =  pruebaSuelo.nombrepropietario;
//   row.cells[2].value = ' ';
//   row.cells[3].value = ' ';
//   row.cells[4].value = 'Fecha T. Muestra:';
//   row.cells[5].value = pruebaSuelo.fechaTomaMuestra;

//   row = grid.rows.add();
//   row.cells[0].value = 'Contacto:';
//   row.cells[1].value =  pruebaSuelo.telefonoPropietario;
//   row.cells[2].value = ' ';
//   row.cells[3].value = ' ';
//   row.cells[4].value = 'Fecha Recibido:';
//   row.cells[5].value = pruebaSuelo.fechaRecibido;

//   row = grid.rows.add();
//   row.cells[0].value = 'Nombre Predio:';
//   row.cells[1].value =  pruebaSuelo.nombrePredio;
//   row.cells[2].value = ' ';
//   row.cells[3].value = ' ';
//   row.cells[4].value = 'Fecha Analisis:';
//   row.cells[5].value = pruebaSuelo.fechaPrueba;

//   row = grid.rows.add();
//   row.cells[0].value = 'Corregimiento/Vereda:';
//   row.cells[1].value =  pruebaSuelo.corregimientoPredio;
//   row.cells[2].value = 'Municipio:';
//   row.cells[3].value = pruebaSuelo.municipioPredio;
//   row.cells[4].value = 'Departamento:';
//   row.cells[5].value = pruebaSuelo.dptoPredio;

//   row = grid.rows.add();
//   row.cells[0].value = 'Latitud:';
//   row.cells[1].value =  predio.latitud;
//   row.cells[2].value = 'Longitud:';
//   row.cells[3].value = predio.longitud;
//   row.cells[4].value = 'MSNM:';
//   row.cells[5].value = predio.msnm;

//   row = grid.rows.add();
//   row.cells[0].value = 'Cultivo:';
//   row.cells[1].value =  pruebaSuelo.cultivo;
//   row.cells[2].value = 'Variedad:';
//   row.cells[3].value = pruebaSuelo.variedad;
//   row.cells[4].value = 'Edad:';
//   row.cells[5].value = pruebaSuelo.edad;

//   row = grid.rows.add();
//   row.cells[0].value = 'Profundidad Suelo Biotico:';
//   row.cells[1].value =  predio.profundidadSB;
//   row.cells[2].value = 'Puntos:';
//   row.cells[3].value = predio.puntos;
//   row.cells[4].value = 'Temperatura:';
//   row.cells[5].value = predio.temperatura;

//   grid.draw(
//     page: page,
//     bounds: const Rect.fromLTWH(0,100,250,0)
//   );

// }