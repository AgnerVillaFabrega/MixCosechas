class PruebaSuelo {
  final String idPredio;
  final String nombrePredio;
  final String corregimientoPredio;
  final String municipioPredio;
  final String dptoPredio;
  final String latitud;
  final String longitud;
  final String msnm;
  final String profundidadSB;
  final String puntos;
  final String temperatura;
  final int lotes;

  final String idPropietario;
  final String nombrepropietario;
  final String telefonoPropietario;
  final String correoPropietario;

  final String idPrueba;
  String? fechaPrueba = '${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}';
  final String fechaTomaMuestra;
  final String fechaRecibido;
  final String edad;
  final String cultivo;
  final String variedad;
  final String lote;
  late String recomendaciones;
  late String presiembra;
  late String siembra;
  late String mantenimiento;

  final double n;
  final double nh4;
  final double no2;
  final double no3;
  final double p;
  final double k;
  final double ca;
  final double s;
  final double mg;
  final double so4;
  final double fe;
  final double mn;
  final double cu;
  final double al;
  final double cl;
  final double zn;
  final double na;

  final double ph;
  final double ce;
  final double salesDisueltas;
  final double cice;

  late double camg;
  late double mgk;
  late double cak;
  late double camgk;
  late double camgkal;

  late double basesTotales;
  late double alSaturacion;
  late double kSaturacion;
  late double caSaturacion;
  late double mgSaturacion;
  late double naSaturacion;
  late double basesTotalesSaturacion;

  final double arcilla;
  final double limo;
  final double arena;
  final double humus;
  late String textura;

  final List<String> graficaCompuestos = [
    'N',
    'NH4',
    'NO2',
    'NO3',
    'P',
    'K',
    'Ca',
    'S',
    'Mg',
  ];
  late List<double> valorgraficaCompuestos = [
    n,
    nh4,
    no2,
    no3,
    p,
    k,
    ca,
    s,
    mg,
  ];
  final List<String> graficaCompuestos2 = [
    'SO4',
    'Fe ',
    'Mn',
    'Cu',
    'Al',
    'Cl',
    'Zn',
    'Na',
  ];
  late List<double> valorgraficaCompuestos2 = [so4, fe, mn, cu, al, cl, zn, na];

  final List<String> nombreCompuestos = [
    'Nitrato de Nitrógeno',
    'Nitrógeno amoniacal',
    'Nitritos NO2',
    'Nitratos NO3',
    'Fósforo P',
    'Potasio K',
    'Calcio Ca',
    'Azufre S',
    'Magnesio Mg',
    'Sulfato SO4',
    'Hierro Férrico Fe ',
    'Manganeso Mn',
    'Cobre Cu',
    'Aluminio Al',
    'Cloruro Cl',
    'Zinc Zn',
    'Sodio Na',
    'Ph',
    'C.E',
    'Sales Disueltas',
    'C.I.C.E',
    'Ca/Mg',
    'Ca+Mg/K',
    'Ca/K',
    'Mg/K',
    'Ca+Mg+K/Al'
    'Bases Totales',
    'Saturacion Na',
    'Saturación  Al',
    'Saturacion  K',
    'Saturación  Ca',
    'Saturación  Mg',
    'Saturación BT',
    'Arcilla',
    'Limo',
    'Arena',
    'Humus',
    'Textura',
  ];

  late List<double> valorCompuestos = [
    n,
    nh4,
    no2,
    no3,
    p,
    k,
    ca,
    s,
    mg,
    so4,
    fe,
    mn,
    cu,
    al,
    cl,
    zn,
    na,
    ph,
    ce,
    salesDisueltas,
    cice,
    camg,
    camgk,
    cak,
    mgk,
    camgkal,
    basesTotales,
    naSaturacion,
    alSaturacion,
    kSaturacion,
    caSaturacion,
    mgSaturacion,
    basesTotalesSaturacion,
    arcilla,
    limo,
    arena,
    humus,
    0,
  ];

  late List<String> interpretacionCompuestos = [
    nInterpretacion,
    nh4Interpretacion,
    no2Interpretacion,
    no3Interpretacion,
    pInterpretacion,
    kInterpretacion,
    caInterpretacion,
    sInterpretacion,
    mgInterpretacion,
    so4Interpretacion,
    feInterpretacion,
    mnInterpretacion,
    cuInterpretacion,
    alInterpretacion,
    clInterpretacion,
    znInterpretacion,
    naInterpretacion,
    phInterpretacion,
    ceInterpretacion,
    salesDisueltasInterpretacion,
    ciceInterpretacion,
    camgInterpretacion,
    camgkInterpretacion,
    cakInterpretacion,
    mgkInterpretacion,
    camgkalInterpretacion,
    basesTotalesInterpretacion,
    naSaturacionInterpretacion,
    alSaturacionInterpretacion,
    kSaturacionInterpretacion,
    caSaturacionInterpretacion,
    mgSaturacionInterpretacion,
    basesTotalesSaturacionInterpretacion,
    'NA',
    'NA',
    'NA',
    humusInterpretacion,
    textura
  ];

  late String nInterpretacion;
  late String nh4Interpretacion;
  late String no2Interpretacion;
  late String no3Interpretacion;
  late String pInterpretacion;
  late String kInterpretacion;
  late String caInterpretacion;
  late String mgInterpretacion;
  late String sInterpretacion;
  late String so4Interpretacion;
  late String feInterpretacion;
  late String mnInterpretacion;
  late String cuInterpretacion;
  late String alInterpretacion;
  late String clInterpretacion;
  late String znInterpretacion;
  late String naInterpretacion;

  late String phInterpretacion;
  late String ceInterpretacion;
  late String salesDisueltasInterpretacion;
  late String ciceInterpretacion;

  late String camgInterpretacion;
  late String camgkInterpretacion;
  late String cakInterpretacion;
  late String mgkInterpretacion;
  late String camgkalInterpretacion;

  late String basesTotalesInterpretacion;
  late String alSaturacionInterpretacion;
  late String kSaturacionInterpretacion;
  late String caSaturacionInterpretacion;
  late String mgSaturacionInterpretacion;
  late String naSaturacionInterpretacion;
  late String basesTotalesSaturacionInterpretacion;

  late String humusInterpretacion;

  PruebaSuelo(
      {required this.idPrueba,
      required this.idPredio,
      required this.idPropietario,
      required this.nombrePredio,
      required this.corregimientoPredio,
      required this.municipioPredio,
      required this.dptoPredio,
      required this.latitud,
      required this.longitud,
      required this.msnm,
      required this.profundidadSB,
      required this.puntos,
      required this.temperatura,
      required this.lotes,
      required this.cultivo,
      required this.variedad,
      required this.edad,
      required this.nombrepropietario,
      required this.telefonoPropietario,
      required this.correoPropietario,
      required this.lote,
      required this.fechaTomaMuestra,
      required this.fechaRecibido,
      required this.recomendaciones,
      required this.presiembra,
      required this.siembra,
      required this.mantenimiento,
      required this.n,
      required this.nh4,
      required this.no2,
      required this.no3,
      required this.p,
      required this.k,
      required this.ca,
      required this.mg,
      required this.s,
      required this.so4,
      required this.fe,
      required this.mn,
      required this.cu,
      required this.al,
      required this.cl,
      required this.zn,
      required this.na,
      required this.ph,
      required this.ce,
      required this.salesDisueltas,
      required this.cice,
      required this.arcilla,
      required this.limo,
      required this.arena,
      required this.humus,
      fechaPrueba}) {
    camg = (ca / mg);
    camgk = (ca + mg / k);
    cak = ca / k;
    mgk = mg / k;
    camgkal = ca + mg + k / al;
    basesTotales = k + ca + mg + na;
    alSaturacion = al / cice * 100;
    kSaturacion = k / cice * 100;
    caSaturacion = ca / cice * 100;
    mgSaturacion = mg / cice * 100;
    naSaturacion = na / cice * 100;
    basesTotalesSaturacion = basesTotales / cice * 100;
    nInterpretacion = nInterpretar(n);
    nh4Interpretacion = nh4Interpretar(nh4);
    no2Interpretacion = no2Interpretar(no2);
    no3Interpretacion = no3Interpretar(no3);
    pInterpretacion = pInterpretar(p);
    kInterpretacion = kInterpretar(k);
    caInterpretacion = caInterpretar(ca);
    mgInterpretacion = mgInterpretar(mg);
    sInterpretacion = sInterpretar(s);
    so4Interpretacion = so4Interpretar(so4);
    feInterpretacion = feInterpretar(mn);
    mnInterpretacion = mnInterpretar(mn);
    cuInterpretacion = cuInterpretar(cu);
    alInterpretacion = alInterpretar(al);
    clInterpretacion = clInterpretar(cl);
    znInterpretacion = znInterpretar(zn);
    naInterpretacion = naInterpretar(na);

    phInterpretacion = phInterpretar(ph);
    ceInterpretacion = ceInterpretar(ce);
    salesDisueltasInterpretacion = interpretarSalesDisueltas(salesDisueltas);
    ciceInterpretacion = ciceInterpretar(al, k, ca, mg, na);

    camgInterpretacion = camgInterpretar(camg);
    camgkInterpretacion = camgkInterpretar(camgk);
    cakInterpretacion = cakInterpretar(cak);
    mgkInterpretacion = mgkInterpretar(mgk);
    camgkalInterpretacion = camgkalInterpretar(camgkal);

    basesTotalesInterpretacion = basesTotalesInterpretar(basesTotales);
    alSaturacionInterpretacion = alSaturacionInterpretar(alSaturacion);
    kSaturacionInterpretacion = kSaturacionInterpretar(kSaturacion);
    caSaturacionInterpretacion = caSaturacionInterpretar(caSaturacion);
    mgSaturacionInterpretacion = mgSaturacionInterpretar(mgSaturacion);
    naSaturacionInterpretacion = naSaturacionInterpretar(naSaturacion);
    basesTotalesSaturacionInterpretacion = basesTotalesSaturacionInterpretar(basesTotalesSaturacion);

    humusInterpretacion = interpretarHumus(humus);

    textura = valorTextura(arcilla, limo, arena);
  }

  String nInterpretar(double valor) {
    if (valor < 0.08) {
      return "Bajo";
    } else if (valor >= 0.08 && valor <= 0.10) {
      return "Medio";
    } else if (valor > 0.10 && valor <= 0.15) {
      return "Óptimo";
    } else {
      return "Alto";
    }
  }

  String nh4Interpretar(double valor) {
    if (valor < 12) {
      return "Bajo";
    } else if (valor >= 12 && valor <= 34) {
      return "Medio";
    } else {
      return "Alto";
    }
  }

  String no2Interpretar(double valor) {
    if (valor < 1) {
      return "Bajo";
    } else if (valor >= 1 && valor <= 5) {
      return "Medio";
    } else {
      return "Alto";
    }
  }

  String no3Interpretar(double valor) {
    if (valor < 5.5) {
      return "Bajo";
    } else if (valor >= 5.5 && valor <= 25.5) {
      return "Medio";
    } else {
      return "Alto";
    }
  }

  String pInterpretar(double valor) {
    if (valor < 17) {
      return "Bajo";
    } else if (valor >= 17 && valor <= 33.5) {
      return "Medio";
    } else {
      return "Alto";
    }
  }

  String kInterpretar(double valor) {
    if (valor < 38) {
      return "Bajo";
    } else if (valor >= 38 && valor <= 71.5) {
      return "Medio";
    } else {
      return "Alto";
    }
  }

  String caInterpretar(double valor) {
    if (valor < 200) {
      return "Bajo";
    } else if (valor >= 200 && valor <= 400) {
      return "Medio";
    } else if (valor >= 401 && valor <= 1000) {
      return "Óptimo";
    } else {
      return "Alto";
    }
  }

  String mgInterpretar(double valor) {
    if (valor < 10) {
      return "Bajo";
    } else if (valor >= 10 && valor <= 50) {
      return "Medio";
    } else {
      return "Alto";
    }
  }

  String sInterpretar(double valor) {
    if (valor < 16) {
      return "Bajo";
    } else if (valor >= 16 && valor <= 50) {
      return "Medio";
    } else {
      return "Alto";
    }
  }

  String so4Interpretar(double valor) {
    if (valor < 16) {
      return "Bajo";
    } else if (valor >= 16 && valor <= 50) {
      return "Medio";
    } else {
      return "Alto";
    }
  }

  String feInterpretar(double valor) {
    if (valor < 3) {
      return "Bajo";
    } else if (valor >= 3 && valor <= 10) {
      return "Medio";
    } else {
      return "Alto";
    }
  }

  String mnInterpretar(double valor) {
    if (valor < 5) {
      return "Bajo";
    } else if (valor >= 5 && valor <= 24) {
      return "Medio";
    } else {
      return "Alto";
    }
  }

  String cuInterpretar(double valor) {
    if (valor < 1) {
      return "Bajo";
    } else if (valor >= 1 && valor <= 3) {
      return "Medio - Sin relevancia";
    } else {
      return "Alto - Adecuado";
    }
  }

  String alInterpretar(double valor) {
    if (valor < 2) {
      return "Bajo - Aceptable";
    } else {
      return "Alto -Toxicidad";
    }
  }

  String clInterpretar(double valor) {
    if (valor < 100) {
      return "Bajo";
    } else if (valor >= 100 && valor <= 400) {
      return "Medio";
    } else {
      return "Alto";
    }
  }

  String znInterpretar(double valor) {
    if (valor < 0.5) {
      return "Bajo";
    } else if (valor >= 0.5 && valor <= 1) {
      return "Medio - Sin relevancia";
    } else {
      return "Alto - Adecuado";
    }
  }

  String naInterpretar(double valor) {
    if (valor < 0.9) {
      return "Aceptable";
    } else {
      return "Alto - Toxico";
    }
  }

  String phInterpretar(double valor) {
    if (valor >= 4.0 && valor < 4.5) {
      return "Muy Fuertemente Ácida";
    } else if (valor >= 4.5 && valor < 5.5) {
      return "Fuertemente Ácida";
    } else if (valor >= 5.5 && valor < 6.5) {
      return "Ácida";
    } else if (valor >= 6.5 && valor < 6.8) {
      return "Ligeramente Ácida";
    } else if (valor >= 6.8 && valor < 7.2) {
      return "Prácticamente Neutra";
    } else if (valor >= 7.2 && valor < 7.5) {
      return "Ligeramente Alcalina";
    } else if (valor >= 7.5 && valor < 8.5) {
      return "Alcalina";
    } else if (valor >= 8.5 && valor <= 9.0) {
      return "Fuertemente Alcalina";
    } else {
      return "Fuera de rango";
    }
  }

  String ceInterpretar(double valor) {
    if (valor < 0.8) {
      return "Bajo - Adecuado";
    } else if (valor >= 0.08 && valor <= 1.6) {
      return "Medio";
    } else {
      return "Alto";
    }
  }

  String interpretarSalesDisueltas(double valor) {
    if (valor < 100) {
      return "Bajo";
    } else if (valor >= 100 && valor <= 400) {
      return "Medio";
    } else {
      return "Alto";
    }
  }

  String ciceInterpretar(double Al, double K, double Ca, double Mg, double Na) {
    double cice = Al + K + Ca + Mg + Na;

    if (cice < 6) {
      return "Suelo Arenoso";
    } else if (cice >= 6 && cice <= 12) {
      return "Suelo Franco Arenoso";
    } else if (cice >= 12 && cice <= 150) {
      return "Suelo Arcilloso";
    } else {
      return "Suelo Organico";
    }
  }

  String camgInterpretar(double valor) {
    if (valor < 1) {
      return "Deficiencia de Ca";
    } else if (valor >= 1 && valor <= 2) {
      return "Bajo Ca respecto a Mg";
    } else if (valor >= 2 && valor <= 4) {
      return "Optimo";
    } else {
      return "Deficiencia de Mg";
    }
  }

  String camgkInterpretar(double valor) {
    if (valor < 40) {
      return "Adecuado para K";
    } else {
      return "Deficiencia de K";
    }
  }

  String cakInterpretar(double valor) {
    if (valor < 30) {
      return "Adecuado para K";
    } else {
      return "Deficiencia de K";
    }
  }

  String mgkInterpretar(double valor) {
    if (valor < 1) {
      return "Deficiencia de Mg";
    } else if (valor >= 1 && valor <= 18) {
      return "Optimo";
    } else {
      return "Deficiencia de K";
    }
  }

  String camgkalInterpretar(double valor) {
    if (valor < 1) {
      return "Encalar - Criterio General";
    } else {
      return "No hay toxicidad de Al";
    }
  }

  String basesTotalesInterpretar(double valor) {
    if (valor < 5) {
      return "Bajo";
    } else if (valor >= 5 && valor <= 10) {
      return "Medio";
    } else {
      return "Alto";
    }
  }

  String alSaturacionInterpretar(double valor) {
    if (valor < 15) {
      return "Bajo - Normal";
    } else if (valor >= 15 && valor <= 30) {
      return "Medio - Toxico para plantas suceptibles";
    } else if (valor >= 31 && valor <= 60) {
      return "Alto - Toxico para plantas tolerantes";
    } else {
      return "Peligro - Toxico para la mayoria de plantas";
    }
  }

  String kSaturacionInterpretar(double valor) {
    if (valor < 2) {
      return "Bajo ";
    } else if (valor >= 2 && valor <= 3) {
      return "Medio ";
    } else {
      return "Alto";
    }
  }

  String caSaturacionInterpretar(double valor) {
    if (valor < 30) {
      return "Bajo ";
    } else if (valor >= 30 && valor <= 40) {
      return "Medio ";
    } else {
      return "Alto";
    }
  }

  String mgSaturacionInterpretar(double valor) {
    if (valor < 15) {
      return "Bajo ";
    } else if (valor >= 15 && valor <= 20) {
      return "Medio ";
    } else {
      return "Alto";
    }
  }

  String naSaturacionInterpretar(double valor) {
    if (valor < 15) {
      return "Bajo - Normal ";
    } else {
      return "Alto - Sodico";
    }
  }

  String basesTotalesSaturacionInterpretar(double valor) {
    if (valor < 50) {
      return "Bajo - Suelo Acido";
    } else if (valor >= 50 && valor <= 90) {
      return "Medio - Suelo Medio";
    } else {
      return "Alto - Suelo Saturado en Bases";
    }
  }

//ARREGLAR INTERPRETACION HUMUS
  String interpretarHumus(double valor) {
    if (valor < 2) {
      return "Bajo";
    } else if (valor > 3) {
      return "Alto";
    } else {
      return "Medio";
    }
  }

  String valorTextura(double arcilla, double limo, double arena) {
    if (arcilla >= 40 && limo <= 40 && arena <= 45) {
      return "Arcilloso";
    } else if ((arcilla >= 35 && arcilla <= 55) &&
        (limo <= 20) &&
        (arena >= 45 && arena <= 65)) {
      return "Arcillo-arenoso";
    } else if ((arcilla >= 40 && arcilla <= 60) &&
        (limo >= 40 && limo <= 60) &&
        (arena <= 20)) {
      return "Arcillo-limoso";
    } else if ((arcilla >= 27 && arcilla <= 40) &&
        (limo >= 40 && limo <= 72) &&
        (arena <= 60)) {
      return "Franco-arcillo-limoso";
    } else if ((arcilla >= 27 && arcilla <= 40) &&
        (limo >= 15 && limo <= 52) &&
        (arena >= 20 && arena <= 45)) {
      return "Franco-arcilloso";
    } else if ((arcilla >= 7 && arcilla <= 35) &&
        (limo <= 27) &&
        (arena >= 45 && arena <= 80)) {
      return "Franco-arcillo-arenoso";
    } else if ((arcilla >= 7 && arcilla <= 27) &&
        (limo >= 27 && limo <= 50) &&
        (arena >= 22 && arena <= 52)) {
      return "Franco";
    } else if ((arcilla <= 27) && (limo >= 50 && limo <= 87) && (arena <= 50)) {
      return "Franco-limoso";
    } else if ((arcilla <= 12) && (limo >= 80) && (arena <= 20)) {
      return "Limoso";
    } else if ((arcilla <= 30) &&
        (limo <= 30) &&
        (arena >= 70 && arena <= 85)) {
      return "Franco-arenoso";
    } else if ((arcilla >= 15) &&
        (limo >= 15) &&
        (arena >= 85 && arena <= 90)) {
      return "Arenoso-Franco";
    } else if ((arcilla <= 10) && (limo <= 10) && (arena >= 90)) {
      return "Arena";
    } else {
      return "Error";
    }
  }

  factory PruebaSuelo.fromMap(Map<String, dynamic> map) {
    Map<String, dynamic> nData = map['Nitrato de Nitrógeno - N'][0];
    Map<String, dynamic> nh4Data = map['Nitrógeno amoniacal - NH4+'][0];
    Map<String, dynamic> no2Data = map['Nitritos - NO2-'][0];
    Map<String, dynamic> no3Data = map['Nitratos - NO3-'][0];
    Map<String, dynamic> pData = map['Fósforo - P'][0];
    Map<String, dynamic> kData = map['Potasio - K'][0];
    Map<String, dynamic> caData = map['Calcio - Ca'][0];
    Map<String, dynamic> sData = map['Azufre - S'][0];
    Map<String, dynamic> mgData = map['Magnesio - Mg'][0];
    Map<String, dynamic> so4Data = map['Sulfato - SO4'][0];
    Map<String, dynamic> feData = map['Hierro Férrico - Fe'][0];
    Map<String, dynamic> mnData = map['Manganeso - Mn'][0];
    Map<String, dynamic> cuData = map['Cobre - Cu'][0];
    Map<String, dynamic> alData = map['Aluminio - Al'][0];
    Map<String, dynamic> clData = map['Cloruro - Cl'][0];
    Map<String, dynamic> znData = map['Zinc - Zn'][0];
    Map<String, dynamic> naData = map['Sodio - Na'][0];

    Map<String, dynamic> phData = map['Ph'][0];
    Map<String, dynamic> ceData = map['C.E'][0];
    Map<String, dynamic> salesDisueltasData = map['Sales Disueltas'][0];
    Map<String, dynamic> ciceData = map['C.I.C.E'][0];

    Map<String, dynamic> humusData = map['Humus'][0];

    return PruebaSuelo(
        idPrueba: map['IdPrueba'],
        idPredio: map['IdPredio'],
        idPropietario: map['IdPropietario'],
        nombrePredio: map['NombrePredio'],
        corregimientoPredio: map['Corregimiento'],
        municipioPredio: map['Municipio'],
        dptoPredio: map['Departamento'],
        latitud: map['Latitud'],
        longitud: map['Longitud'],
        msnm: map['MSNM'],
        profundidadSB: map['ProfundidadSB'],
        puntos: map['Puntos'],
        temperatura: map['Temperatura'],
        lotes: map['Lotes'],
        cultivo: map['Cultivo'],
        variedad: map['Variedad'],
        edad: map['Edad'],
        nombrepropietario: map['NombrePropietario'],
        telefonoPropietario: map['Telefono'],
        correoPropietario: map['Correo'],
        lote: map['Lote'],
        fechaTomaMuestra: map['FechaTomaMuestra'],
        fechaRecibido: map['FechaRecibido'],
        fechaPrueba: map['Fecha'],
        recomendaciones: map['Recomendaciones'],
        presiembra: map['Presiembra'],
        siembra: map['Siembra'],
        mantenimiento: map['Mantenimiento'],
        n: double.parse(nData['valor'].toString()),
        nh4: double.parse(nh4Data['valor'].toString()),
        no2: double.parse(no2Data['valor'].toString()),
        no3: double.parse(no3Data['valor'].toString()),
        p: double.parse(pData['valor'].toString()),
        k: double.parse(kData['valor'].toString()),
        ca: double.parse(caData['valor'].toString()),
        s: double.parse(sData['valor'].toString()),
        mg: double.parse(mgData['valor'].toString()),
        so4: double.parse(so4Data['valor'].toString()),
        fe: double.parse(feData['valor'].toString()),
        mn: double.parse(mnData['valor'].toString()),
        cu: double.parse(cuData['valor'].toString()),
        al: double.parse(alData['valor'].toString()),
        cl: double.parse(clData['valor'].toString()),
        zn: double.parse(znData['valor'].toString()),
        na: double.parse(naData['valor'].toString()),
        ph: double.parse(phData['valor'].toString()),
        ce: double.parse(ceData['valor'].toString()),
        salesDisueltas: double.parse(salesDisueltasData['valor'].toString()),
        cice: double.parse(ciceData['valor'].toString()),
        arcilla: double.parse(map['Arcilla'].toString()),
        limo: double.parse(map['Limo'].toString()),
        arena: double.parse(map['Arena'].toString()),
        humus: double.parse(humusData['valor'].toString()));
  }
}
