import 'dart:io';
import 'dart:ui';

import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import '../../../model/predios.dart';
import '../../../model/pruebaSuelo.dart';

Future<void> createPruebaSueloPdf(PruebaSuelo pruebaSuelo) async {
  PdfDocument document = PdfDocument();
  final page = document.pages.add();
  //String pattern = 'yyyy-MM-dd';

  page.graphics.drawString('RESULTADOS ANÁLISIS DE SUELO AGRICOLA',
      PdfStandardFont(PdfFontFamily.timesRoman, 25));

  page.graphics.drawString(
      'Informacion Cliente', PdfStandardFont(PdfFontFamily.timesRoman, 18),
      bounds: const Rect.fromLTWH(0, 70, 0, 0));

  PdfGrid gridInformacionGeneral = PdfGrid();

  gridInformacionGeneral.style = PdfGridStyle(
      cellPadding: PdfPaddings(left: 5, right: 2, top: 2, bottom: 2),
      font: PdfStandardFont(PdfFontFamily.timesRoman, 10));

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
  row.cells[1].value = '0';  //predio.latitud;
  row.cells[2].value = 'Longitud:';
  row.cells[3].value = '0';  //predio.longitud;
  row.cells[4].value = 'MSNM:';
  row.cells[5].value = '0';  //predio.msnm;

  row = gridInformacionGeneral.rows.add();
  row.cells[0].value = 'Cultivo:';
  row.cells[1].value = pruebaSuelo.cultivo;
  row.cells[2].value = 'Variedad:';
  row.cells[3].value = pruebaSuelo.variedad;
  row.cells[4].value = 'Edad:';
  row.cells[5].value = pruebaSuelo.edad;

  row = gridInformacionGeneral.rows.add();
  row.cells[0].value = 'Profundidad Suelo Biotico:';
  row.cells[1].value = '0';  //predio.profundidadSB;
  row.cells[2].value = 'Puntos:';
  row.cells[3].value = '0';  //predio.puntos;
  row.cells[4].value = 'Temperatura:';
  row.cells[5].value = '0';  //predio.temperatura;

  gridInformacionGeneral.draw(
      page: page, bounds: const Rect.fromLTWH(0, 100, 250, 0));

  PdfGrid gridDatosPrueba = PdfGrid();

  gridDatosPrueba.style = PdfGridStyle(
      cellPadding: PdfPaddings(left: 5, right: 2, top: 2, bottom: 2),
      font: PdfStandardFont(PdfFontFamily.timesRoman, 10));

  gridDatosPrueba.columns.add(count: 8);
  gridDatosPrueba.headers.add(1);
  gridDatosPrueba.headers[0].cells[0].value = 'Parametro';
  gridDatosPrueba.headers[0].cells[1].value = 'Unidad';
  gridDatosPrueba.headers[0].cells[2].value = 'Resultado';
  gridDatosPrueba.headers[0].cells[3].value = 'Interpretación';
  gridDatosPrueba.headers[0].cells[4].value = 'Parametro';
  gridDatosPrueba.headers[0].cells[5].value = 'Unidad';
  gridDatosPrueba.headers[0].cells[6].value = 'Resultado';
  gridDatosPrueba.headers[0].cells[7].value = 'Interpretación';

  PdfGridRow rowDatosPrueba = gridDatosPrueba.rows.add();
  rowDatosPrueba.cells[0].value = 'MACRONUTRIENTES';
  rowDatosPrueba.cells[1].value = ' ';
  rowDatosPrueba.cells[2].value = ' ';
  rowDatosPrueba.cells[3].value = ' ';
  rowDatosPrueba.cells[4].value = ' ';
  rowDatosPrueba.cells[5].value = ' ';
  rowDatosPrueba.cells[6].value = ' ';
  rowDatosPrueba.cells[7].value = ' ';

  row = gridDatosPrueba.rows.add();

  rowDatosPrueba.cells[0].value = 'Nitrogeno Amoniacal NH4+';
  rowDatosPrueba.cells[1].value = 'ppm';
  rowDatosPrueba.cells[2].value = pruebaSuelo.n;
  rowDatosPrueba.cells[3].value = pruebaSuelo.nInterpretacion;
  rowDatosPrueba.cells[4].value = 'Analisis Transversales';
  rowDatosPrueba.cells[5].value = ' ';
  rowDatosPrueba.cells[6].value = ' ';
  rowDatosPrueba.cells[7].value = ' ';

  row = gridDatosPrueba.rows.add();

  rowDatosPrueba.cells[0].value = 'Nitritos NO2-N';
  rowDatosPrueba.cells[1].value = 'ppm';
  rowDatosPrueba.cells[2].value = pruebaSuelo.no2;
  rowDatosPrueba.cells[3].value = pruebaSuelo.no2Interpretacion;
  rowDatosPrueba.cells[4].value = 'Acidez Ph';
  rowDatosPrueba.cells[5].value = 'ppm';
  rowDatosPrueba.cells[6].value = pruebaSuelo.ph;
  rowDatosPrueba.cells[7].value = pruebaSuelo.phInterpretacion;

  row = gridDatosPrueba.rows.add();

  rowDatosPrueba.cells[0].value = 'Nitratos NO3-N';
  rowDatosPrueba.cells[1].value = 'ppm';
  rowDatosPrueba.cells[2].value = pruebaSuelo.no3;
  rowDatosPrueba.cells[3].value = pruebaSuelo.no3Interpretacion;
  rowDatosPrueba.cells[4].value = 'C.E';
  rowDatosPrueba.cells[5].value = 'microS/cm';
  rowDatosPrueba.cells[6].value = pruebaSuelo.ce;
  rowDatosPrueba.cells[7].value = pruebaSuelo.ceInterpretacion;

  row = gridDatosPrueba.rows.add();

  rowDatosPrueba.cells[0].value = 'Fosforo P';
  rowDatosPrueba.cells[1].value = 'ppm';
  rowDatosPrueba.cells[2].value = pruebaSuelo.p;
  rowDatosPrueba.cells[3].value = pruebaSuelo.pInterpretacion;
  rowDatosPrueba.cells[4].value = 'Sales Disueltas';
  rowDatosPrueba.cells[5].value = 'ppm';
  rowDatosPrueba.cells[6].value = pruebaSuelo.salesDisueltas;
  rowDatosPrueba.cells[7].value = pruebaSuelo.salesDisueltasInterpretacion;

  row = gridDatosPrueba.rows.add();

  rowDatosPrueba.cells[0].value = 'Potasio K';
  rowDatosPrueba.cells[1].value = 'ppm';
  rowDatosPrueba.cells[2].value = pruebaSuelo.k;
  rowDatosPrueba.cells[3].value = pruebaSuelo.kInterpretacion;
  rowDatosPrueba.cells[4].value = 'C.I.C.E';
  rowDatosPrueba.cells[5].value = 'meq/100g';
  rowDatosPrueba.cells[6].value = pruebaSuelo.cice;
  rowDatosPrueba.cells[7].value = pruebaSuelo.ciceInterpretacion;

  row = gridDatosPrueba.rows.add();

  rowDatosPrueba.cells[0].value = 'Calcio Ca';
  rowDatosPrueba.cells[1].value = 'ppm';
  rowDatosPrueba.cells[2].value = pruebaSuelo.ca;
  rowDatosPrueba.cells[3].value = pruebaSuelo.caInterpretacion;
  rowDatosPrueba.cells[4].value = ' ';
  rowDatosPrueba.cells[5].value = ' ';
  rowDatosPrueba.cells[6].value = ' ';
  rowDatosPrueba.cells[7].value = ' ';

  row = gridDatosPrueba.rows.add();

  rowDatosPrueba.cells[0].value = 'Magnesio Mg';
  rowDatosPrueba.cells[1].value = 'ppm';
  rowDatosPrueba.cells[2].value = pruebaSuelo.mg;
  rowDatosPrueba.cells[3].value = pruebaSuelo.mgInterpretacion;
  rowDatosPrueba.cells[4].value = 'RELACIONES CATIONICAS';
  rowDatosPrueba.cells[5].value = ' ';
  rowDatosPrueba.cells[6].value = ' ';
  rowDatosPrueba.cells[7].value = ' ';

  row = gridDatosPrueba.rows.add();

  rowDatosPrueba.cells[0].value = 'Sulfato Azufre SO4';
  rowDatosPrueba.cells[1].value = 'ppm';
  rowDatosPrueba.cells[2].value = pruebaSuelo.so4;
  rowDatosPrueba.cells[3].value = pruebaSuelo.so4Interpretacion;
  rowDatosPrueba.cells[4].value = 'Ca/Mg';
  rowDatosPrueba.cells[5].value = 'Und';
  rowDatosPrueba.cells[6].value = pruebaSuelo.camg;
  rowDatosPrueba.cells[7].value = pruebaSuelo.camgInterpretacion;

  row = gridDatosPrueba.rows.add();

  rowDatosPrueba.cells[0].value = 'MICRONURIENTES';
  rowDatosPrueba.cells[1].value = ' ';
  rowDatosPrueba.cells[2].value = ' ';
  rowDatosPrueba.cells[3].value = ' ';
  rowDatosPrueba.cells[4].value = 'Mg/K';
  rowDatosPrueba.cells[5].value = 'Und';
  rowDatosPrueba.cells[6].value = pruebaSuelo.mgk;
  rowDatosPrueba.cells[7].value = pruebaSuelo.mgkInterpretacion;

  row = gridDatosPrueba.rows.add();

  rowDatosPrueba.cells[0].value = 'Hierro Ferrico Fe';
  rowDatosPrueba.cells[1].value = 'ppm';
  rowDatosPrueba.cells[2].value = pruebaSuelo.fe;
  rowDatosPrueba.cells[3].value = pruebaSuelo.feInterpretacion;
  rowDatosPrueba.cells[4].value = 'Ca/K';
  rowDatosPrueba.cells[5].value = 'Und';
  rowDatosPrueba.cells[6].value = pruebaSuelo.cak;
  rowDatosPrueba.cells[7].value = pruebaSuelo.cakInterpretacion;

  row = gridDatosPrueba.rows.add();

  rowDatosPrueba.cells[0].value = 'Manganeso Mn';
  rowDatosPrueba.cells[1].value = 'ppm';
  rowDatosPrueba.cells[2].value = pruebaSuelo.mn;
  rowDatosPrueba.cells[3].value = pruebaSuelo.mnInterpretacion;
  rowDatosPrueba.cells[4].value = 'Ca+Mg/K';
  rowDatosPrueba.cells[5].value = 'Und';
  rowDatosPrueba.cells[6].value = pruebaSuelo.camgk;
  rowDatosPrueba.cells[7].value = pruebaSuelo.camgkInterpretacion;

  row = gridDatosPrueba.rows.add();

  rowDatosPrueba.cells[0].value = 'Zinc Zn';
  rowDatosPrueba.cells[1].value = 'ppm';
  rowDatosPrueba.cells[2].value = pruebaSuelo.zn;
  rowDatosPrueba.cells[3].value = pruebaSuelo.znInterpretacion;
  rowDatosPrueba.cells[4].value = ' ';
  rowDatosPrueba.cells[5].value = ' ';
  rowDatosPrueba.cells[6].value = ' ';
  rowDatosPrueba.cells[7].value = ' ';

  row = gridDatosPrueba.rows.add();

  rowDatosPrueba.cells[0].value = 'Cobre Cu';
  rowDatosPrueba.cells[1].value = 'ppm';
  rowDatosPrueba.cells[2].value = pruebaSuelo.cu;
  rowDatosPrueba.cells[3].value = pruebaSuelo.cuInterpretacion;
  rowDatosPrueba.cells[4].value = ' ';
  rowDatosPrueba.cells[5].value = ' ';
  rowDatosPrueba.cells[6].value = ' ';
  rowDatosPrueba.cells[7].value = ' ';

  row = gridDatosPrueba.rows.add();

  rowDatosPrueba.cells[0].value = 'Cloruro Cl';
  rowDatosPrueba.cells[1].value = 'ppm';
  rowDatosPrueba.cells[2].value = pruebaSuelo.cl;
  rowDatosPrueba.cells[3].value = pruebaSuelo.clInterpretacion;
  rowDatosPrueba.cells[4].value = ' ';
  rowDatosPrueba.cells[5].value = ' ';
  rowDatosPrueba.cells[6].value = ' ';
  rowDatosPrueba.cells[7].value = ' ';

  row = gridDatosPrueba.rows.add();

  rowDatosPrueba.cells[0].value = 'Aluminio Al';
  rowDatosPrueba.cells[1].value = 'T Color';
  rowDatosPrueba.cells[2].value = pruebaSuelo.al;
  rowDatosPrueba.cells[3].value = pruebaSuelo.alInterpretacion;
  rowDatosPrueba.cells[4].value = ' ';
  rowDatosPrueba.cells[5].value = ' ';
  rowDatosPrueba.cells[6].value = ' ';
  rowDatosPrueba.cells[7].value = ' ';

  row = gridDatosPrueba.rows.add();

  rowDatosPrueba.cells[0].value = 'Suelo Fisico';
  rowDatosPrueba.cells[1].value = ' ';
  rowDatosPrueba.cells[2].value = ' ';
  rowDatosPrueba.cells[3].value = ' ';
  rowDatosPrueba.cells[4].value = ' ';
  rowDatosPrueba.cells[5].value = ' ';
  rowDatosPrueba.cells[6].value = ' ';
  rowDatosPrueba.cells[7].value = ' ';

  row = gridDatosPrueba.rows.add();

  rowDatosPrueba.cells[0].value = 'Arcilla';
  rowDatosPrueba.cells[1].value = '%';
  rowDatosPrueba.cells[2].value = pruebaSuelo.arcilla;
  rowDatosPrueba.cells[3].value = 'NA';
  rowDatosPrueba.cells[4].value = ' ';
  rowDatosPrueba.cells[5].value = ' ';
  rowDatosPrueba.cells[6].value = ' ';
  rowDatosPrueba.cells[7].value = ' ';

  row = gridDatosPrueba.rows.add();

  rowDatosPrueba.cells[0].value = 'Limo';
  rowDatosPrueba.cells[1].value = '%';
  rowDatosPrueba.cells[2].value = pruebaSuelo.limo;
  rowDatosPrueba.cells[3].value = 'NA';
  rowDatosPrueba.cells[4].value = ' ';
  rowDatosPrueba.cells[5].value = ' ';
  rowDatosPrueba.cells[6].value = ' ';
  rowDatosPrueba.cells[7].value = ' ';

  row = gridDatosPrueba.rows.add();

  rowDatosPrueba.cells[0].value = 'Arena';
  rowDatosPrueba.cells[1].value = '%';
  rowDatosPrueba.cells[2].value = pruebaSuelo.arena;
  rowDatosPrueba.cells[3].value = 'NA';
  rowDatosPrueba.cells[4].value = ' ';
  rowDatosPrueba.cells[5].value = ' ';
  rowDatosPrueba.cells[6].value = ' ';
  rowDatosPrueba.cells[7].value = ' ';

  row = gridDatosPrueba.rows.add();

  rowDatosPrueba.cells[0].value = 'Textura';
  rowDatosPrueba.cells[1].value = '%';
  rowDatosPrueba.cells[2].value = '100%';
  rowDatosPrueba.cells[3].value = pruebaSuelo.textura;
  rowDatosPrueba.cells[4].value = ' ';
  rowDatosPrueba.cells[5].value = ' ';
  rowDatosPrueba.cells[6].value = ' ';
  rowDatosPrueba.cells[7].value = ' ';

  row = gridDatosPrueba.rows.add();

  rowDatosPrueba.cells[0].value = 'Humus';
  rowDatosPrueba.cells[1].value = 'T Color';
  rowDatosPrueba.cells[2].value = pruebaSuelo.humus;
  rowDatosPrueba.cells[3].value = pruebaSuelo.humusInterpretacion;
  rowDatosPrueba.cells[4].value = ' ';
  rowDatosPrueba.cells[5].value = ' ';
  rowDatosPrueba.cells[6].value = ' ';
  rowDatosPrueba.cells[7].value = ' ';

  //DEBO CAMBIAR LA UBICACION
  gridDatosPrueba.draw(page: page, bounds: const Rect.fromLTWH(0, 530, 0, 0));

  List<int> bytes = await document.save();
  document.dispose();
  await FileSaveHelper.saveAndLaunchFile(bytes, 'TablaPDFSyncfusion.pdf');
}

class FileSaveHelper {
  static Future<void> saveAndLaunchFile(
      List<int> bytes, String fileName) async {
    final String dir = (await getApplicationDocumentsDirectory()).path;
    final String path = '$dir/$fileName';
    final File file = File(path);

    await file.writeAsBytes(bytes, flush: true);
    OpenFile.open(path);
  }
}
