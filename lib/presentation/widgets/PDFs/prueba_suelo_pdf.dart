import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';
import 'package:flutter/services.dart' show Rect, rootBundle;
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import '../../../model/pruebaSuelo.dart';

Future<void> createPruebaSueloPdf(PruebaSuelo pruebaSuelo) async {
  PdfDocument document = PdfDocument();
  final page = document.pages.add();

  page.graphics.drawImage(
      PdfBitmap(await _readImageData('LogoMixcosechas3.png')),
      const Rect.fromLTWH(0, 0, 60, 50));

   page.graphics.drawRectangle(
    bounds: const Rect.fromLTWH(0, 0, 60, 50),
    pen: PdfPens.black,
  );

  page.graphics.drawImage(
      PdfBitmap(await _readImageData('LogoUnidax3.png')),
      const Rect.fromLTWH(455, 5, 60, 40));

  page.graphics.drawRectangle(
    bounds: const Rect.fromLTWH(455, 0, 60, 50),
    pen: PdfPens.black,
  );

  PdfGrid gridEncabezado = PdfGrid();

  gridEncabezado.style = PdfGridStyle(
      cellPadding: PdfPaddings(left: 5, right: 2, top: 5, bottom: 0),
      font: PdfStandardFont(PdfFontFamily.timesRoman, 9));

  gridEncabezado.columns.add(count: 2);

  PdfGridRow rowEncabezado = gridEncabezado.rows.add();
  rowEncabezado.cells[0].value ='                PROCESO: Análisis de Suelo Agricola';
  rowEncabezado.cells[1].value ='                CODIGO: FIRAS-01';

  rowEncabezado = gridEncabezado.rows.add();
  rowEncabezado.cells[0].value ='       \t\t FECHA DE ACTUALIZACIÓN: 20/05/2023';
  rowEncabezado.cells[1].value ='                VERSIÓN: 002';

  for (int cellIndex = 0; cellIndex < 2; cellIndex++) {
    
    if (cellIndex == 1) {
      // Ajusta el ancho de la columna y alto de la fila  según tus necesidades
      gridEncabezado.columns[cellIndex].width = 145;
      gridEncabezado.rows[cellIndex].height = 25;
    }

    if (cellIndex == 0) {
      // Ajusta el ancho de la columna y alto de la fila según tus necesidades
      gridEncabezado.columns[cellIndex].width = 250;
      gridEncabezado.rows[cellIndex].height = 25;
    }
  }

  gridEncabezado.draw(page: page, bounds: const Rect.fromLTWH(60, 0, 400, 0));

  // Definir el título
  const String title = 'RESULTADOS ANÁLISIS DE SUELO AGRÍCOLA';

  // Crear un elemento de texto con el título
  final PdfTextElement textElement = PdfTextElement(
    text: title,
    font: PdfStandardFont(PdfFontFamily.timesRoman, 10),
  );

  // Medir el tamaño del texto para crear un cuadro
  final PdfLayoutResult? result = textElement.draw(
    page: page,
    bounds: const Rect.fromLTWH(150, 70, 0, 0),
  );

  // Verificar si el resultado no es nulo antes de usarlo
  if (result != null) {
    // Crear un cuadro alrededor del título
    page.graphics.drawRectangle(
      brush: PdfSolidBrush(PdfColor(59, 89, 37)),
      pen: PdfPens.white,
      bounds: Rect.fromPoints(
        const Offset(0, 70),
        Offset(300 + result.bounds.width, 70 + result.bounds.height),
      ),
    );
  }
  page.graphics.drawString('RESULTADOS ANÁLISIS DE SUELO AGRICOLA',
      PdfStandardFont(PdfFontFamily.timesRoman, 10),
      brush: PdfSolidBrush(PdfColor(255, 255, 255)),
      bounds: const Rect.fromLTWH(150, 70, 0, 0));

  PdfGrid gridInformacionCliente = PdfGrid();

  gridInformacionCliente.style = PdfGridStyle(
      cellPadding: PdfPaddings(left: 5, right: 0, top: 2, bottom: 2),
      font: PdfStandardFont(PdfFontFamily.timesRoman, 9));

  gridInformacionCliente.columns.add(count: 6);

  PdfGridRow rowInformacionCliente = gridInformacionCliente.rows.add();
  rowInformacionCliente.cells[0].value = 'Informacion Cliente';
  rowInformacionCliente.cells[1].value = ' ';
  rowInformacionCliente.cells[2].value = '                      Código:';
  rowInformacionCliente.cells[3].value = pruebaSuelo.idPrueba.toString();
  rowInformacionCliente.cells[4].value = ' ';
  rowInformacionCliente.cells[5].value = 'Lote No. ${pruebaSuelo.lote}';

  for (int cellIndex = 0; cellIndex < 6; cellIndex++) {
    PdfGridCell cell = rowInformacionCliente.cells[cellIndex];
    if (cellIndex == 0 || cellIndex == 2 || cellIndex == 3 || cellIndex == 5) {
      cell.style = PdfGridCellStyle(
        textBrush: PdfSolidBrush(PdfColor(255, 255, 255)),
      );
      cell.style.backgroundBrush = PdfSolidBrush(PdfColor(59, 89, 37));
      cell.style.font = PdfStandardFont(PdfFontFamily.timesRoman, 9,
          style: PdfFontStyle.bold);
    }
    cell.style.borders.all = PdfPen(
      dashStyle: PdfDashStyle.custom,
      PdfColor(255, 255, 255), // Cambia el color a blanco
    );

    if (cellIndex == 3) {
      cell.style.borders.left = PdfPen(
        dashStyle: PdfDashStyle.custom,
        PdfColor(59, 89, 37), // Cambia el color a blanco
      );
    }
  }

  gridInformacionCliente.draw(
      page: page, bounds: const Rect.fromLTWH(0, 85, 0, 0));

  PdfGrid gridInformacionGeneral = PdfGrid();

  gridInformacionGeneral.style = PdfGridStyle(
      cellPadding: PdfPaddings(left: 5, right: 2, top: 2, bottom: 2),
      font: PdfStandardFont(PdfFontFamily.timesRoman, 6));

  gridInformacionGeneral.columns.add(count: 6);

  PdfGridRow row = gridInformacionGeneral.rows.add();
  row.cells[0].value = 'Nombre:';
  row.cells[1].value = pruebaSuelo.nombrepropietario.toString();
  row.cells[2].value = ' ';
  row.cells[3].value = ' ';
  row.cells[4].value = 'Fecha T. Muestra:';
  row.cells[5].value = pruebaSuelo.fechaTomaMuestra;

  row = gridInformacionGeneral.rows.add();
  row.cells[0].value = 'Contacto:';
  row.cells[1].value = pruebaSuelo.telefonoPropietario;
  row.cells[2].value = ' ';
  row.cells[3].value = ' ';
  row.cells[4].value = 'Fecha Recibido:';
  row.cells[5].value = pruebaSuelo.fechaRecibido;

  row = gridInformacionGeneral.rows.add();
  row.cells[0].value = 'Nombre Predio:';
  row.cells[1].value = pruebaSuelo.nombrePredio;
  row.cells[2].value = ' ';
  row.cells[3].value = ' ';
  row.cells[4].value = 'Fecha Analisis:';
  row.cells[5].value = pruebaSuelo.fechaPrueba.toString();

  row = gridInformacionGeneral.rows.add();
  row.cells[0].value = 'Corregimiento/Vereda:';
  row.cells[1].value = pruebaSuelo.corregimientoPredio;
  row.cells[2].value = 'Municipio:';
  row.cells[3].value = pruebaSuelo.municipioPredio;
  row.cells[4].value = 'Departamento:';
  row.cells[5].value = pruebaSuelo.dptoPredio;

  row = gridInformacionGeneral.rows.add();
  row.cells[0].value = 'Latitud:';
  row.cells[1].value = pruebaSuelo.latitud; 
  row.cells[2].value = 'Longitud:';
  row.cells[3].value = pruebaSuelo.longitud; 
  row.cells[4].value = 'MSNM:';
  row.cells[5].value = pruebaSuelo.msnm;

  row = gridInformacionGeneral.rows.add();
  row.cells[0].value = 'Cultivo:';
  row.cells[1].value = pruebaSuelo.cultivo;
  row.cells[2].value = 'Variedad:';
  row.cells[3].value = pruebaSuelo.variedad;
  row.cells[4].value = 'Edad:';
  row.cells[5].value = pruebaSuelo.edad;

  row = gridInformacionGeneral.rows.add();
  row.cells[0].value = 'Profundidad Suelo Biotico:';
  row.cells[1].value = pruebaSuelo.profundidadSB;
  row.cells[2].value = 'Puntos:';
  row.cells[3].value = pruebaSuelo.puntos;
  row.cells[4].value = 'Temperatura:';
  row.cells[5].value = pruebaSuelo.temperatura;

  for (int rowIndex = 0;
      rowIndex < gridInformacionGeneral.rows.count;
      rowIndex++) {
    PdfGridRow row = gridInformacionGeneral.rows[rowIndex];
    for (int cellIndex = 0; cellIndex < row.cells.count; cellIndex++) {
      PdfGridCell cell = row.cells[cellIndex];
      cell.style.borders.all = PdfPen(
        dashStyle: PdfDashStyle.custom,
        PdfColor(255, 255, 255), // Cambia el color a blanco
      );
      if (cellIndex == 0 ||
          cellIndex == 4 ||
          ((cellIndex == 2 && rowIndex != 0) &&
              (cellIndex == 2 && rowIndex != 1) &&
              (cellIndex == 2 && rowIndex != 2))) {
        cell.style.backgroundBrush = PdfSolidBrush(PdfColor(196, 217, 176));
        cell.style.font = PdfStandardFont(PdfFontFamily.timesRoman, 6,
            style: PdfFontStyle.bold);
      }
    }
  }

  gridInformacionGeneral.draw(
      page: page, bounds: const Rect.fromLTWH(0, 110, 0, 0));

  PdfGrid gridPruebasdeLaboratorio = PdfGrid();

  gridPruebasdeLaboratorio.style = PdfGridStyle(
      cellPadding: PdfPaddings(left: 5, right: 2, top: 2, bottom: 2),
      font: PdfStandardFont(PdfFontFamily.timesRoman, 9));

  gridPruebasdeLaboratorio.columns.add(count: 5);

  PdfGridRow rowPruebasdeLaboratorio = gridPruebasdeLaboratorio.rows.add();
  rowPruebasdeLaboratorio.cells[0].value = 'Pruebas de Laboratorio';
  rowPruebasdeLaboratorio.cells[1].value = ' ';
  rowPruebasdeLaboratorio.cells[2].value = ' ';
  rowPruebasdeLaboratorio.cells[3].value = ' ';
  rowPruebasdeLaboratorio.cells[4].value = ' ';

  for (int cellIndex = 0; cellIndex < 5; cellIndex++) {
    PdfGridCell cell = rowPruebasdeLaboratorio.cells[cellIndex];
    if (cellIndex == 0) {
      cell.style = PdfGridCellStyle(
        textBrush: PdfSolidBrush(PdfColor(255, 255, 255)),
      );
      cell.style.backgroundBrush = PdfSolidBrush(PdfColor(59, 89, 37));
      cell.style.font = PdfStandardFont(PdfFontFamily.timesRoman, 9,
          style: PdfFontStyle.bold);
    }
    cell.style.borders.all = PdfPen(
      dashStyle: PdfDashStyle.custom,
      PdfColor(255, 255, 255), // Cambia el color a blanco
    );
  }

  gridPruebasdeLaboratorio.draw(
      page: page, bounds: const Rect.fromLTWH(0, 220, 0, 0));
  ;

  PdfGrid gridDatosPrueba = PdfGrid();

  gridDatosPrueba.style = PdfGridStyle(
      cellPadding: PdfPaddings(left: 2, right: 2, top: 2, bottom: 2),
      font: PdfStandardFont(PdfFontFamily.timesRoman, 6));
  gridDatosPrueba.style.cellSpacing = 0;

  List<PdfGridRow> listaRows = [];

  gridDatosPrueba.columns.add(count: 8);
  PdfGridRow rowDatosPrueba0 = gridDatosPrueba.rows.add();
  listaRows.add(rowDatosPrueba0);

  rowDatosPrueba0.cells[0].value = 'Parametro';
  rowDatosPrueba0.cells[1].value = 'Unidad';
  rowDatosPrueba0.cells[2].value = 'Resultado';
  rowDatosPrueba0.cells[3].value = 'Interpretación';
  rowDatosPrueba0.cells[4].value = 'Parametro';
  rowDatosPrueba0.cells[5].value = 'Unidad';
  rowDatosPrueba0.cells[6].value = 'Resultado';
  rowDatosPrueba0.cells[7].value = 'Interpretación';

  PdfGridRow rowDatosPrueba1 = gridDatosPrueba.rows.add();
  listaRows.add(rowDatosPrueba1);

  rowDatosPrueba1.cells[0].value = 'MACRONUTRIENTES';
  rowDatosPrueba1.cells[1].value = ' ';
  rowDatosPrueba1.cells[2].value = ' ';
  rowDatosPrueba1.cells[3].value = ' ';
  rowDatosPrueba1.cells[4].value = ' ';
  rowDatosPrueba1.cells[5].value = ' ';
  rowDatosPrueba1.cells[6].value = ' ';
  rowDatosPrueba1.cells[7].value = ' ';

  PdfGridRow rowDatosPrueba2 = gridDatosPrueba.rows.add();
  listaRows.add(rowDatosPrueba2);

  rowDatosPrueba2.cells[0].value = 'Nitrogeno Amoniacal NH4+';
  rowDatosPrueba2.cells[1].value = 'ppm';
  rowDatosPrueba2.cells[2].value = pruebaSuelo.n.toString();
  rowDatosPrueba2.cells[3].value = pruebaSuelo.nInterpretacion;
  rowDatosPrueba2.cells[4].value = 'ANALISIS TRANSVERSALES';
  rowDatosPrueba2.cells[5].value = ' ';
  rowDatosPrueba2.cells[6].value = ' ';
  rowDatosPrueba2.cells[7].value = ' ';

  PdfGridRow rowDatosPrueba3 = gridDatosPrueba.rows.add();
  listaRows.add(rowDatosPrueba3);

  rowDatosPrueba3.cells[0].value = 'Nitritos NO2-N';
  rowDatosPrueba3.cells[1].value = 'ppm';
  rowDatosPrueba3.cells[2].value = pruebaSuelo.no2.toString();
  rowDatosPrueba3.cells[3].value = pruebaSuelo.no2Interpretacion;
  rowDatosPrueba3.cells[4].value = 'Acidez Ph';
  rowDatosPrueba3.cells[5].value = 'ppm';
  rowDatosPrueba3.cells[6].value = pruebaSuelo.ph.toString();
  rowDatosPrueba3.cells[7].value = pruebaSuelo.phInterpretacion;

  PdfGridRow rowDatosPrueba4 = gridDatosPrueba.rows.add();
  listaRows.add(rowDatosPrueba4);

  rowDatosPrueba4.cells[0].value = 'Nitratos NO3-N';
  rowDatosPrueba4.cells[1].value = 'ppm';
  rowDatosPrueba4.cells[2].value = pruebaSuelo.no3.toString();
  rowDatosPrueba4.cells[3].value = pruebaSuelo.no3Interpretacion;
  rowDatosPrueba4.cells[4].value = 'C.E';
  rowDatosPrueba4.cells[5].value = 'microS/cm';
  rowDatosPrueba4.cells[6].value = pruebaSuelo.ce.toString();
  rowDatosPrueba4.cells[7].value = pruebaSuelo.ceInterpretacion;

  PdfGridRow rowDatosPrueba5 = gridDatosPrueba.rows.add();
  listaRows.add(rowDatosPrueba5);

  rowDatosPrueba5.cells[0].value = 'Fosforo P';
  rowDatosPrueba5.cells[1].value = 'ppm';
  rowDatosPrueba5.cells[2].value = pruebaSuelo.p.toString();
  rowDatosPrueba5.cells[3].value = pruebaSuelo.pInterpretacion;
  rowDatosPrueba5.cells[4].value = 'Sales Disueltas';
  rowDatosPrueba5.cells[5].value = 'ppm';
  rowDatosPrueba5.cells[6].value = pruebaSuelo.salesDisueltas.toString();
  rowDatosPrueba5.cells[7].value = pruebaSuelo.salesDisueltasInterpretacion;

  PdfGridRow rowDatosPrueba6 = gridDatosPrueba.rows.add();
  listaRows.add(rowDatosPrueba6);

  rowDatosPrueba6.cells[0].value = 'Potasio K';
  rowDatosPrueba6.cells[1].value = 'ppm';
  rowDatosPrueba6.cells[2].value = pruebaSuelo.k.toString();
  rowDatosPrueba6.cells[3].value = pruebaSuelo.kInterpretacion;
  rowDatosPrueba6.cells[4].value = 'C.I.C.E';
  rowDatosPrueba6.cells[5].value = 'meq/100g';
  rowDatosPrueba6.cells[6].value = pruebaSuelo.cice.toString();
  rowDatosPrueba6.cells[7].value = pruebaSuelo.ciceInterpretacion;

  PdfGridRow rowDatosPrueba7 = gridDatosPrueba.rows.add();
  listaRows.add(rowDatosPrueba7);

  rowDatosPrueba7.cells[0].value = 'Calcio Ca';
  rowDatosPrueba7.cells[1].value = 'ppm';
  rowDatosPrueba7.cells[2].value = pruebaSuelo.ca.toString();
  rowDatosPrueba7.cells[3].value = pruebaSuelo.caInterpretacion;
  rowDatosPrueba7.cells[4].value = ' ';
  rowDatosPrueba7.cells[5].value = ' ';
  rowDatosPrueba7.cells[6].value = ' ';
  rowDatosPrueba7.cells[7].value = ' ';

  PdfGridRow rowDatosPrueba8 = gridDatosPrueba.rows.add();
  listaRows.add(rowDatosPrueba8);

  rowDatosPrueba8.cells[0].value = 'Magnesio Mg';
  rowDatosPrueba8.cells[1].value = 'ppm';
  rowDatosPrueba8.cells[2].value = pruebaSuelo.mg.toString();
  rowDatosPrueba8.cells[3].value = pruebaSuelo.mgInterpretacion;
  rowDatosPrueba8.cells[4].value = 'RELACIONES CATIONICAS';
  rowDatosPrueba8.cells[5].value = ' ';
  rowDatosPrueba8.cells[6].value = ' ';
  rowDatosPrueba8.cells[7].value = ' ';

  PdfGridRow rowDatosPrueba9 = gridDatosPrueba.rows.add();
  listaRows.add(rowDatosPrueba9);

  rowDatosPrueba9.cells[0].value = 'Sulfato Azufre SO4';
  rowDatosPrueba9.cells[1].value = 'ppm';
  rowDatosPrueba9.cells[2].value = pruebaSuelo.so4.toString();
  rowDatosPrueba9.cells[3].value = pruebaSuelo.so4Interpretacion;
  rowDatosPrueba9.cells[4].value = 'Ca/Mg';
  rowDatosPrueba9.cells[5].value = 'Und';
  rowDatosPrueba9.cells[6].value = pruebaSuelo.camg.toStringAsFixed(2);
  rowDatosPrueba9.cells[7].value = pruebaSuelo.camgInterpretacion;

  PdfGridRow rowDatosPrueba10 = gridDatosPrueba.rows.add();
  listaRows.add(rowDatosPrueba10);

  rowDatosPrueba10.cells[0].value = 'MICRONURIENTES';
  rowDatosPrueba10.cells[1].value = ' ';
  rowDatosPrueba10.cells[2].value = ' ';
  rowDatosPrueba10.cells[3].value = ' ';
  rowDatosPrueba10.cells[4].value = 'Mg/K';
  rowDatosPrueba10.cells[5].value = 'Und';
  rowDatosPrueba10.cells[6].value = pruebaSuelo.mgk.toStringAsFixed(2);
  rowDatosPrueba10.cells[7].value = pruebaSuelo.mgkInterpretacion;

  PdfGridRow rowDatosPrueba11 = gridDatosPrueba.rows.add();
  listaRows.add(rowDatosPrueba11);

  rowDatosPrueba11.cells[0].value = 'Hierro Ferrico Fe';
  rowDatosPrueba11.cells[1].value = 'ppm';
  rowDatosPrueba11.cells[2].value = pruebaSuelo.fe.toString();
  rowDatosPrueba11.cells[3].value = pruebaSuelo.feInterpretacion;
  rowDatosPrueba11.cells[4].value = 'Ca/K';
  rowDatosPrueba11.cells[5].value = 'Und';
  rowDatosPrueba11.cells[6].value = pruebaSuelo.cak.toStringAsFixed(2);
  rowDatosPrueba11.cells[7].value = pruebaSuelo.cakInterpretacion;

  PdfGridRow rowDatosPrueba12 = gridDatosPrueba.rows.add();
  listaRows.add(rowDatosPrueba12);

  rowDatosPrueba12.cells[0].value = 'Manganeso Mn';
  rowDatosPrueba12.cells[1].value = 'ppm';
  rowDatosPrueba12.cells[2].value = pruebaSuelo.mn.toString();
  rowDatosPrueba12.cells[3].value = pruebaSuelo.mnInterpretacion;
  rowDatosPrueba12.cells[4].value = 'Ca+Mg/K';
  rowDatosPrueba12.cells[5].value = 'Und';
  rowDatosPrueba12.cells[6].value = pruebaSuelo.camgk.toStringAsFixed(2);
  rowDatosPrueba12.cells[7].value = pruebaSuelo.camgkInterpretacion;

  PdfGridRow rowDatosPrueba13 = gridDatosPrueba.rows.add();
  listaRows.add(rowDatosPrueba13);

  rowDatosPrueba13.cells[0].value = 'Zinc Zn';
  rowDatosPrueba13.cells[1].value = 'ppm';
  rowDatosPrueba13.cells[2].value = pruebaSuelo.zn.toString();
  rowDatosPrueba13.cells[3].value = pruebaSuelo.znInterpretacion;
  rowDatosPrueba13.cells[4].value = 'Ca+Mg+K/Al';
  rowDatosPrueba13.cells[5].value = 'Und';
  rowDatosPrueba13.cells[6].value = pruebaSuelo.camgkal.toString();
  rowDatosPrueba13.cells[7].value = pruebaSuelo.camgkalInterpretacion;

  PdfGridRow rowDatosPrueba14 = gridDatosPrueba.rows.add();
  listaRows.add(rowDatosPrueba14);

  rowDatosPrueba14.cells[0].value = 'Cobre Cu';
  rowDatosPrueba14.cells[1].value = 'ppm';
  rowDatosPrueba14.cells[2].value = pruebaSuelo.cu.toString();
  rowDatosPrueba14.cells[3].value = pruebaSuelo.cuInterpretacion;
  rowDatosPrueba14.cells[4].value = 'BASES INTERCAMBIABLES';
  rowDatosPrueba14.cells[5].value = ' ';
  rowDatosPrueba14.cells[6].value = ' ';
  rowDatosPrueba14.cells[7].value = ' ';

  PdfGridRow rowDatosPrueba15 = gridDatosPrueba.rows.add();
  listaRows.add(rowDatosPrueba15);

  rowDatosPrueba15.cells[0].value = 'Cloruro Cl';
  rowDatosPrueba15.cells[1].value = 'ppm';
  rowDatosPrueba15.cells[2].value = pruebaSuelo.cl.toString();
  rowDatosPrueba15.cells[3].value = pruebaSuelo.clInterpretacion;
  rowDatosPrueba15.cells[4].value = 'Bases Totales';
  rowDatosPrueba15.cells[5].value = 'Und';
  rowDatosPrueba15.cells[6].value = pruebaSuelo.basesTotales.toString();
  rowDatosPrueba15.cells[7].value = pruebaSuelo.basesTotalesInterpretacion;

  PdfGridRow rowDatosPrueba16 = gridDatosPrueba.rows.add();
  listaRows.add(rowDatosPrueba16);

  rowDatosPrueba16.cells[0].value = 'Aluminio Al';
  rowDatosPrueba16.cells[1].value = 'T Color';
  rowDatosPrueba16.cells[2].value = pruebaSuelo.al.toString();
  rowDatosPrueba16.cells[3].value = pruebaSuelo.alInterpretacion;
  rowDatosPrueba16.cells[4].value = 'Saturacion Na';
  rowDatosPrueba16.cells[5].value = '%';
  rowDatosPrueba16.cells[6].value = pruebaSuelo.naSaturacion.toString();
  rowDatosPrueba16.cells[7].value = pruebaSuelo.naSaturacionInterpretacion;

  PdfGridRow rowDatosPrueba17 = gridDatosPrueba.rows.add();
  listaRows.add(rowDatosPrueba17);

  rowDatosPrueba17.cells[0].value = 'SUELO FÍSICO';
  rowDatosPrueba17.cells[1].value = ' ';
  rowDatosPrueba17.cells[2].value = ' ';
  rowDatosPrueba17.cells[3].value = ' ';
  rowDatosPrueba17.cells[4].value = 'Saturación de Al';
  rowDatosPrueba17.cells[5].value = '%';
  rowDatosPrueba17.cells[6].value = pruebaSuelo.alSaturacion.toString();
  rowDatosPrueba17.cells[7].value = pruebaSuelo.alSaturacionInterpretacion;

  PdfGridRow rowDatosPrueba18 = gridDatosPrueba.rows.add();
  listaRows.add(rowDatosPrueba18);

  rowDatosPrueba18.cells[0].value = 'Arcilla';
  rowDatosPrueba18.cells[1].value = '%';
  rowDatosPrueba18.cells[2].value = pruebaSuelo.arcilla.toString();
  rowDatosPrueba18.cells[3].value = 'NA';
  rowDatosPrueba18.cells[4].value = 'Saturacion de K';
  rowDatosPrueba18.cells[5].value = '%';
  rowDatosPrueba18.cells[6].value = pruebaSuelo.kSaturacion.toString();
  rowDatosPrueba18.cells[7].value = pruebaSuelo.kSaturacionInterpretacion;

  PdfGridRow rowDatosPrueba19 = gridDatosPrueba.rows.add();
  listaRows.add(rowDatosPrueba19);

  rowDatosPrueba19.cells[0].value = 'Limo';
  rowDatosPrueba19.cells[1].value = '%';
  rowDatosPrueba19.cells[2].value = pruebaSuelo.limo.toString();
  rowDatosPrueba19.cells[3].value = 'NA';
  rowDatosPrueba19.cells[4].value = 'Saturación de Ca';
  rowDatosPrueba19.cells[5].value = '%';
  rowDatosPrueba19.cells[6].value = pruebaSuelo.caSaturacion.toString();
  rowDatosPrueba19.cells[7].value = pruebaSuelo.caSaturacionInterpretacion;

  PdfGridRow rowDatosPrueba20 = gridDatosPrueba.rows.add();
  listaRows.add(rowDatosPrueba20);

  rowDatosPrueba20.cells[1].value = '%';
  rowDatosPrueba20.cells[0].value = 'Arena';
  rowDatosPrueba20.cells[2].value = pruebaSuelo.arena.toString();
  rowDatosPrueba20.cells[3].value = 'NA';
  rowDatosPrueba20.cells[4].value = 'Saturación de Mg';
  rowDatosPrueba20.cells[5].value = '%';
  rowDatosPrueba20.cells[6].value = pruebaSuelo.mgSaturacion.toString();
  rowDatosPrueba20.cells[7].value = pruebaSuelo.mgSaturacionInterpretacion;

  PdfGridRow rowDatosPrueba21 = gridDatosPrueba.rows.add();
  listaRows.add(rowDatosPrueba21);

  rowDatosPrueba21.cells[0].value = 'Textura';
  rowDatosPrueba21.cells[1].value = '%';
  rowDatosPrueba21.cells[2].value = '100%';
  rowDatosPrueba21.cells[3].value = pruebaSuelo.textura;
  rowDatosPrueba21.cells[4].value = 'Saturación BT';
  rowDatosPrueba21.cells[5].value = '%';
  rowDatosPrueba21.cells[6].value = pruebaSuelo.basesTotalesSaturacion.toString();
  rowDatosPrueba21.cells[7].value = pruebaSuelo.basesTotalesSaturacionInterpretacion;

  PdfGridRow rowDatosPrueba22 = gridDatosPrueba.rows.add();
  listaRows.add(rowDatosPrueba22);

  rowDatosPrueba22.cells[0].value = 'Humus';
  rowDatosPrueba22.cells[1].value = 'T Color';
  rowDatosPrueba22.cells[2].value = pruebaSuelo.humus.toString();
  rowDatosPrueba22.cells[3].value = pruebaSuelo.humusInterpretacion;
  rowDatosPrueba22.cells[4].value = 'Humedad';
  rowDatosPrueba22.cells[5].value = '%';
  rowDatosPrueba22.cells[6].value = ' ';
  rowDatosPrueba22.cells[7].value = ' ';

  for (int rowIndex = 0; rowIndex < listaRows.length; rowIndex++) {
    PdfGridRow row = listaRows[rowIndex];

    for (int cellIndex = 0; cellIndex < row.cells.count; cellIndex++) {
      PdfGridCell cell = row.cells[cellIndex];

      if (rowIndex == 0) {
        cell.style = PdfGridCellStyle(
          font: PdfStandardFont(PdfFontFamily.timesRoman, 6,
              style: PdfFontStyle.bold),
        );
      }

      // Cambia el color de fondo de las celdas en la columna 1 excepto en las filas 1, 2, 11, 18
      if (cellIndex == 0 && ![0, 1, 10, 17].contains(rowIndex)) {
        cell.style.backgroundBrush = PdfSolidBrush(PdfColor(196, 217, 176));
        cell.style.font = PdfStandardFont(PdfFontFamily.timesRoman, 6,
            style: PdfFontStyle.bold);
      }

      // Cambia el color de fondo de las celdas en la columna 4 excepto en las filas 3, 8, 9, 15, 16
      if (cellIndex == 4 && ![0, 1, 2, 7, 8, 14].contains(rowIndex)) {
        cell.style.backgroundBrush = PdfSolidBrush(PdfColor(196, 217, 176));
        cell.style.font = PdfStandardFont(PdfFontFamily.timesRoman, 6,
            style: PdfFontStyle.bold);
      }

      // Pone color y subtitulos en cursiva de la columna 0
      if (cellIndex == 0 && [1, 10, 17].contains(rowIndex)) {
        cell.style = PdfGridCellStyle(
          font: PdfStandardFont(PdfFontFamily.helvetica, 6,
              style: PdfFontStyle.italic),
        );
        if (cellIndex == 0 && [1, 10, 17].contains(rowIndex)) {
          cell.style = PdfGridCellStyle(
            textBrush: PdfSolidBrush(PdfColor(55, 86, 58)),
          );
        }
      }

      // Pone color y subtitulos en cursiva de la columna 4
      if (cellIndex == 4 && [0, 1, 2, 7, 8, 14].contains(rowIndex)) {
        cell.style = PdfGridCellStyle(
          font: PdfStandardFont(PdfFontFamily.helvetica, 6,
              style: PdfFontStyle.italic),
        );
        if (cellIndex == 4 && [2, 7, 8, 14, 15].contains(rowIndex)) {
          cell.style =
              PdfGridCellStyle(textBrush: PdfSolidBrush(PdfColor(55, 86, 58)));
        }
      }

      if (cellIndex == 0) {
        // Ajusta el ancho de la columna según tus necesidades
        gridDatosPrueba.columns[cellIndex].width = 95;
      }

      if (cellIndex == 4) {
        // Ajusta el ancho de la columna según tus necesidades
        gridDatosPrueba.columns[cellIndex].width = 85;
      }

      if (cellIndex == 1 ||
          cellIndex == 2 ||
          cellIndex == 5 ||
          cellIndex == 6) {
        // Ajusta el ancho de la columna según tus necesidades
        gridDatosPrueba.columns[cellIndex].width = 30;
      }

      if (cellIndex == 3 || cellIndex == 7) {
        // Ajusta el ancho de la columna según tus necesidades
        gridDatosPrueba.columns[cellIndex].width = 100;
      }

      if (cellIndex == 7) {
        // Ajusta el ancho de la columna según tus necesidades
        gridDatosPrueba.columns[cellIndex].width = 120;
      }

      cell.style.borders.all = PdfPen(
        dashStyle: PdfDashStyle.custom,
        PdfColor(255, 255, 255), // Cambia el color a blanco
      );
    }
  }

  gridDatosPrueba.draw(page: page, bounds: const Rect.fromLTWH(0, 240, 390, 0));

  PdfGrid gridNota = PdfGrid();

  gridNota.style = PdfGridStyle(
      cellPadding: PdfPaddings(left: 5, right: 2, top: 2, bottom: 2),
      font: PdfStandardFont(PdfFontFamily.timesRoman, 9));

  gridNota.columns.add(count: 1);

  PdfGridRow rowNota = gridNota.rows.add();
  rowNota.cells[0].value =
      'NOTA DATOS RESULTANTES: Los bajos niveles de fosforo y potasio, están directamenterelacionados al crecimiento de la planta y calidad de la cosecha, adecuada disponibilidad de micronutrientes,disponibilidad de calcio y magnesio óptimo y alto indica adecuado grado nutricional del suelo, no se requiere encalar';

  gridNota.draw(page: page, bounds: const Rect.fromLTWH(0, 590, 0, 0));

  PdfGrid gridMetodosAnaliticos = PdfGrid();

  gridMetodosAnaliticos.style = PdfGridStyle(
      cellPadding: PdfPaddings(left: 5, right: 2, top: 0, bottom: 0),
      font: PdfStandardFont(PdfFontFamily.timesRoman, 9));

  gridMetodosAnaliticos.columns.add(count: 6);

  PdfGridRow rowMetodosAnaliticos = gridMetodosAnaliticos.rows.add();
  rowMetodosAnaliticos.cells[0].value = 'Métodos Analíticos';
  rowMetodosAnaliticos.cells[1].value = ' ';
  rowMetodosAnaliticos.cells[2].value = ' ';
  rowMetodosAnaliticos.cells[3].value = ' ';
  rowMetodosAnaliticos.cells[4].value = ' ';
  rowMetodosAnaliticos.cells[5].value = ' ';

  for (int cellIndex = 0; cellIndex < 6; cellIndex++) {
    PdfGridCell cell = rowMetodosAnaliticos.cells[cellIndex];
    if (cellIndex == 0) {
      cell.style = PdfGridCellStyle(
        textBrush: PdfSolidBrush(PdfColor(255, 255, 255)),
      );
      cell.style.backgroundBrush = PdfSolidBrush(PdfColor(59, 89, 37));
      cell.style.font = PdfStandardFont(PdfFontFamily.timesRoman, 9,
          style: PdfFontStyle.bold);
    }
    cell.style.borders.all = PdfPen(
      dashStyle: PdfDashStyle.custom,
      PdfColor(255, 255, 255), // Cambia el color a blanco
    );
  }

  gridMetodosAnaliticos.draw(
      page: page, bounds: const Rect.fromLTWH(0, 640, 0, 0));

  page.graphics.drawImage(
      PdfBitmap(await _readImageData('Test Colorimetro.png')),
      const Rect.fromLTWH(80, 660, 300, 100));

  List<int> bytes = await document.save();
  document.dispose();
  await FileSaveHelper.saveAndLaunchFile(bytes, 'TablaPDFSyncfusion.pdf');
}

class FileSaveHelper {
  static Future<void> saveAndLaunchFile(
      List<int> bytes, String fileName) async {
    final String dir = (await getExternalStorageDirectory())!.path;
    final String path = '$dir/$fileName';
    final File file = File(path);

    await file.writeAsBytes(bytes, flush: true);
    OpenFile.open(path);
  }
}

Future<Uint8List> _readImageData(String name) async {
  final data = await rootBundle.load('assets/images/$name');
  return data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
}
