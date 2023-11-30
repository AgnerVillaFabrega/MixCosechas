import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';
import 'package:flutter/services.dart' show Rect, rootBundle;
import 'package:mixcosechas_app/model/pruebaAgua.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

Future<void> createPruebaAguaPdf(PruebaAgua pruebaAgua) async {
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
  rowEncabezado.cells[0].value ='                PROCESO: Análisis de Agua de uso Agricola';
  rowEncabezado.cells[1].value ='                CODIGO: FIRAA-01';

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
  const String title = 'RESULTADOS ANÁLISIS DE AGUA DE USO AGRÍCOLA';

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
  page.graphics.drawString('RESULTADOS ANÁLISIS DE AGUA DE USO AGRICOLA',
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
  rowInformacionCliente.cells[3].value = pruebaAgua.idPrueba.toString();
  rowInformacionCliente.cells[4].value = ' ';
  rowInformacionCliente.cells[5].value = 'Lote No. ${pruebaAgua.lote}';

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
  row.cells[1].value = pruebaAgua.nombrepropietario.toString();
  row.cells[2].value = ' ';
  row.cells[3].value = ' ';
  row.cells[4].value = 'Fecha T. Muestra:';
  row.cells[5].value = pruebaAgua.fechaTomaMuestra;

  row = gridInformacionGeneral.rows.add();
  row.cells[0].value = 'Contacto:';
  row.cells[1].value = pruebaAgua.telefonopropietario;
  row.cells[2].value = ' ';
  row.cells[3].value = ' ';
  row.cells[4].value = 'Fecha Recibido:';
  row.cells[5].value = pruebaAgua.fechaRecibido;

  row = gridInformacionGeneral.rows.add();
  row.cells[0].value = 'Nombre Predio:';
  row.cells[1].value = pruebaAgua.nombrePredio;
  row.cells[2].value = ' ';
  row.cells[3].value = ' ';
  row.cells[4].value = 'Fecha Analisis:';
  row.cells[5].value = pruebaAgua.fechaPrueba.toString();

  row = gridInformacionGeneral.rows.add();
  row.cells[0].value = 'Corregimiento/Vereda:';
  row.cells[1].value = pruebaAgua.corregimientoPredio;
  row.cells[2].value = 'Municipio:';
  row.cells[3].value = pruebaAgua.municipioPredio;
  row.cells[4].value = 'Departamento:';
  row.cells[5].value = pruebaAgua.dptoPredio;

  row = gridInformacionGeneral.rows.add();
  row.cells[0].value = 'Latitud:';
  row.cells[1].value = pruebaAgua.latitud; 
  row.cells[2].value = 'Longitud:';
  row.cells[3].value = pruebaAgua.longitud; 
  row.cells[4].value = 'MSNM:';
  row.cells[5].value = pruebaAgua.msnm;

  row = gridInformacionGeneral.rows.add();
  row.cells[0].value = 'Cultivo:';
  row.cells[1].value = pruebaAgua.cultivo;
  row.cells[2].value = 'Variedad:';
  row.cells[3].value = pruebaAgua.variedad;
  row.cells[4].value = 'Edad:';
  row.cells[5].value = pruebaAgua.edad;

  row = gridInformacionGeneral.rows.add();
  row.cells[0].value = 'Profundidad Suelo Biotico:';
  row.cells[1].value = pruebaAgua.profundidadSB;
  row.cells[2].value = 'Puntos:';
  row.cells[3].value = pruebaAgua.puntos;
  row.cells[4].value = 'Temperatura:';
  row.cells[5].value = pruebaAgua.temperatura;

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
  rowDatosPrueba1.cells[4].value = 'MICRONUTRIENTES';
  rowDatosPrueba1.cells[5].value = ' ';
  rowDatosPrueba1.cells[6].value = ' ';
  rowDatosPrueba1.cells[7].value = ' ';

  PdfGridRow rowDatosPrueba2 = gridDatosPrueba.rows.add();
  listaRows.add(rowDatosPrueba2);

  rowDatosPrueba2.cells[0].value = 'Nitrogeno Amoniacal NH4+';
  rowDatosPrueba2.cells[1].value = 'ppm';
  rowDatosPrueba2.cells[2].value = pruebaAgua.nh4.toString();
  rowDatosPrueba2.cells[3].value = pruebaAgua.nh4Interpretacion;
  rowDatosPrueba2.cells[4].value = 'Hierro - Fe';
  rowDatosPrueba2.cells[5].value = 'ppm';
  rowDatosPrueba2.cells[6].value = pruebaAgua.fe.toString();
  rowDatosPrueba2.cells[7].value = pruebaAgua.feInterpretacion;

  PdfGridRow rowDatosPrueba3 = gridDatosPrueba.rows.add();
  listaRows.add(rowDatosPrueba3);

  rowDatosPrueba3.cells[0].value = 'Nitritos NO2-N';
  rowDatosPrueba3.cells[1].value = 'ppm';
  rowDatosPrueba3.cells[2].value = pruebaAgua.no2.toString();
  rowDatosPrueba3.cells[3].value = pruebaAgua.no2Interpretacion;
  rowDatosPrueba3.cells[4].value = 'Manganeso - Mn';
  rowDatosPrueba3.cells[5].value = 'ppm';
  rowDatosPrueba3.cells[6].value = pruebaAgua.mn.toString();
  rowDatosPrueba3.cells[7].value = pruebaAgua.mnInterpretacion;

  PdfGridRow rowDatosPrueba4 = gridDatosPrueba.rows.add();
  listaRows.add(rowDatosPrueba4);

  rowDatosPrueba4.cells[0].value = 'Nitratos NO3-N';
  rowDatosPrueba4.cells[1].value = 'ppm';
  rowDatosPrueba4.cells[2].value = pruebaAgua.no3.toString();
  rowDatosPrueba4.cells[3].value = pruebaAgua.no3Interpretacion;
  rowDatosPrueba4.cells[4].value = 'Cobre - Cu';
  rowDatosPrueba4.cells[5].value = 'ppm';
  rowDatosPrueba4.cells[6].value = pruebaAgua.cu.toString();
  rowDatosPrueba4.cells[7].value = pruebaAgua.cuInterpretacion;

  PdfGridRow rowDatosPrueba5 = gridDatosPrueba.rows.add();
  listaRows.add(rowDatosPrueba5);

  rowDatosPrueba5.cells[0].value = 'Fosforo P';
  rowDatosPrueba5.cells[1].value = 'ppm';
  rowDatosPrueba5.cells[2].value = pruebaAgua.p.toString();
  rowDatosPrueba5.cells[3].value = pruebaAgua.pInterpretacion;
  rowDatosPrueba5.cells[4].value = 'Cloruro - Cl';
  rowDatosPrueba5.cells[5].value = 'ppm';
  rowDatosPrueba5.cells[6].value = pruebaAgua.cl.toString();
  rowDatosPrueba5.cells[7].value = pruebaAgua.clInterpretacion;

  PdfGridRow rowDatosPrueba6 = gridDatosPrueba.rows.add();
  listaRows.add(rowDatosPrueba6);

  rowDatosPrueba6.cells[0].value = 'Potasio K';
  rowDatosPrueba6.cells[1].value = 'ppm';
  rowDatosPrueba6.cells[2].value = pruebaAgua.k.toString();
  rowDatosPrueba6.cells[3].value = pruebaAgua.kInterpretacion;
  rowDatosPrueba6.cells[4].value = 'ANALISIS TRANSVERSALES';
  rowDatosPrueba6.cells[5].value = ' ';
  rowDatosPrueba6.cells[6].value = ' ';
  rowDatosPrueba6.cells[7].value = ' ';

  PdfGridRow rowDatosPrueba7 = gridDatosPrueba.rows.add();
  listaRows.add(rowDatosPrueba7);

  rowDatosPrueba7.cells[0].value = 'Calcio Ca';
  rowDatosPrueba7.cells[1].value = 'ppm';
  rowDatosPrueba7.cells[2].value = pruebaAgua.ca.toString();
  rowDatosPrueba7.cells[3].value = pruebaAgua.caInterpretacion;
  rowDatosPrueba7.cells[4].value = 'Acidez - pH';
  rowDatosPrueba7.cells[5].value = 'ppm';
  rowDatosPrueba7.cells[6].value = pruebaAgua.ph.toString();
  rowDatosPrueba7.cells[7].value = pruebaAgua.phInterpretacion;

  PdfGridRow rowDatosPrueba8 = gridDatosPrueba.rows.add();
  listaRows.add(rowDatosPrueba8);

  rowDatosPrueba8.cells[0].value = 'Magnesio Mg';
  rowDatosPrueba8.cells[1].value = 'ppm';
  rowDatosPrueba8.cells[2].value = pruebaAgua.mg.toString();
  rowDatosPrueba8.cells[3].value = pruebaAgua.mgInterpretacion;
  rowDatosPrueba8.cells[4].value = 'C.E';
  rowDatosPrueba8.cells[5].value = 'microS/cm';
  rowDatosPrueba8.cells[6].value = pruebaAgua.ce.toString();
  rowDatosPrueba8.cells[7].value = pruebaAgua.ceInterpretacion;

  PdfGridRow rowDatosPrueba9 = gridDatosPrueba.rows.add();
  listaRows.add(rowDatosPrueba9);

  rowDatosPrueba9.cells[0].value = 'Sulfato Azufre SO4';
  rowDatosPrueba9.cells[1].value = 'ppm';
  rowDatosPrueba9.cells[2].value = pruebaAgua.so4.toString();
  rowDatosPrueba9.cells[3].value = pruebaAgua.so4Interpretacion;
  rowDatosPrueba9.cells[4].value = 'Sales Disueltas';
  rowDatosPrueba9.cells[5].value = 'ppm';
  rowDatosPrueba9.cells[6].value = pruebaAgua.salesDisueltas.toStringAsFixed(2);
  rowDatosPrueba9.cells[7].value = pruebaAgua.salesDisueltasInterpretacion;


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
      if (cellIndex == 0 && ![0, 1].contains(rowIndex)) {
        cell.style.backgroundBrush = PdfSolidBrush(PdfColor(196, 217, 176));
        cell.style.font = PdfStandardFont(PdfFontFamily.timesRoman, 6,
            style: PdfFontStyle.bold);
      }

      // Cambia el color de fondo de las celdas en la columna 4 excepto en las filas 3, 8, 9, 15, 16
      if (cellIndex == 4 && ![0,1, 6,].contains(rowIndex)) {
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
      if (cellIndex == 4 && [1, 6].contains(rowIndex)) {
        cell.style = PdfGridCellStyle(
          font: PdfStandardFont(PdfFontFamily.helvetica, 6,
              style: PdfFontStyle.italic),
        );
        if (cellIndex == 4 && [1, 6].contains(rowIndex)) {
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
      'NOTA DATOS RESULTANTES: En la interpretación de resultados existen las siguientes' +
      ' (SR) Sin Riesgo, (CR) Con Riesgo, (P) Peligro.';

  gridNota.draw(page: page, bounds: const Rect.fromLTWH(0, 400, 0, 0));

  PdfGrid gridTituloInterpretacion = PdfGrid();

  gridTituloInterpretacion.style = PdfGridStyle(
      cellPadding: PdfPaddings(left: 5, right: 2, top: 2, bottom: 2),
      font: PdfStandardFont(PdfFontFamily.timesRoman, 10));

  gridTituloInterpretacion.columns.add(count: 1);

  PdfGridRow rowTituloInterpretacion = gridTituloInterpretacion.rows.add();
  rowTituloInterpretacion.cells[0].value ='INTERPRETACION DE LAS PRUEBAS REALIZADAS';

  rowTituloInterpretacion.style.backgroundBrush = PdfSolidBrush(PdfColor(55, 86, 58));
  rowTituloInterpretacion.cells[0].style= PdfGridCellStyle(textBrush: PdfSolidBrush(PdfColor(255, 255, 255)));
  PdfStringFormat stringFormat = PdfStringFormat();
  stringFormat.alignment = PdfTextAlignment.center;

  rowTituloInterpretacion.cells[0].stringFormat = stringFormat;

  gridTituloInterpretacion.draw(page: page, bounds: const Rect.fromLTWH(0, 430, 0, 0));

  PdfGrid gridInterpretacion = PdfGrid();

  gridInterpretacion.style = PdfGridStyle(
      cellPadding: PdfPaddings(left: 5, right: 2, top: 2, bottom: 2),
      font: PdfStandardFont(PdfFontFamily.timesRoman, 9));

  gridInterpretacion.columns.add(count: 1);

  PdfGridRow rowInterpretacion = gridInterpretacion.rows.add();
  rowInterpretacion.cells[0].value =
      'Una vez recibida la muestra de Agua de pozo tipo Subterránea, se realizaron pruebas de análisis a 15 parámetros '+ 
      'importantes, se identificaron sus niveles de riesgo para su aplicación en relación de las restricciones de uso y '+ 
      'se realizan recomendaciones para obtener resultados óptimos en el cultivo. Cualquier consulta, no dude en contactarnos.';

  gridInterpretacion.draw(page: page, bounds: const Rect.fromLTWH(0, 460, 0, 0));

  PdfGrid gridTituloRestriccionesRecomendaciones = PdfGrid();

  gridTituloRestriccionesRecomendaciones.style = PdfGridStyle(
      cellPadding: PdfPaddings(left: 5, right: 2, top: 2, bottom: 2),
      font: PdfStandardFont(PdfFontFamily.timesRoman, 10));

  gridTituloRestriccionesRecomendaciones.columns.add(count: 1);

  PdfGridRow rowRestricciones = gridTituloRestriccionesRecomendaciones.rows.add();
  rowRestricciones.cells[0].value ='Restricciones y Recomendaciones en el Uso del Agua para Riego ';
  rowRestricciones.cells[0].style= PdfGridCellStyle(textBrush: PdfSolidBrush(PdfColor(10, 191, 4)));
  rowRestricciones.cells[0].stringFormat = stringFormat;

  gridTituloRestriccionesRecomendaciones.draw(page: page, bounds: const Rect.fromLTWH(0, 510, 0, 0));


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
