class PruebaSuelo {
  final String nombrePredio;
  final String corregimientoPredio;
  final String cultivoPredio;
  final String municipioPredio;
  final String variedadPredio;
  final String dptoPredio;
  final String edadPredio;
  final String nombrepropietario;
  final String telefonopropietario;
  final String correopropietario;

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
  late double camgk;
  late double cak;
  late double mgk;

  final double arcilla;
  final double limo;
  final double arena;
  final double humus;
  late String textura;

  final List<String> nombreCompuestos = [
    'Nitrato de Nitrógeno - N',
    'Nitrógeno amoniacal - NH4+',
    'Nitritos - NO2-',
    'Nitratos - NO3-',
    'Fósforo - P',
    'Potasio - K',
    'Calcio - Ca',
    'Azufre - S',
    'Magnesio - Mg',
    'Sulfato - SO4',
    'Hierro Férrico - Fe ',
    'Manganeso - Mn',
    'Cobre - Cu',
    'Aluminio - Al',
    'Cloruro - Cl',
    'Zinc - Zn',
    'Sodio - Na',
    'Ph',
    'C.E',
    'Sales Disueltas',
    'C.I.C.E',
    'Ca/Mg',
    'Ca+Mg/K',
    'Ca/K',
    'Mg/K',
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

  late String humusInterpretacion;

  PruebaSuelo({
    required this.nombrePredio,
    required this.corregimientoPredio,
    required this.cultivoPredio,
    required this.municipioPredio,
    required this.variedadPredio,
    required this.dptoPredio,
    required this.edadPredio,
    required this.nombrepropietario,
    required this.telefonopropietario,
    required this.correopropietario,
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
  }) {
    // double d = (Ca / Mg);
    // String inString = d.toStringAsFixed(3); // '2.35'
    // CaMg = double.parse(inString);
    camg = (ca / mg);
    camgk = (ca + mg / k);
    cak = ca / k;
    mgk = mg / k;
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

  String ciceInterpretar(
      double Al, double K, double Ca, double Mg, double Na) {
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
        nombrePredio: map['NombrePredio'],
        corregimientoPredio: map['Corregimiento'],
        cultivoPredio: map['Cultivo'],
        municipioPredio: map['Municipio'],
        variedadPredio: map['Variedad'],
        dptoPredio: map['Departamento'],
        edadPredio: map['Edad'],
        nombrepropietario: map['NombrePropietario'],
        telefonopropietario: map['Telefono'],
        correopropietario: map['Correo'],
        n: double.parse(nData['valor']),
        nh4: double.parse(nh4Data['valor']),
        no2: double.parse(no2Data['valor']),
        no3: double.parse(no3Data['valor']),
        p: double.parse(pData['valor']),
        k: double.parse(kData['valor']),
        ca: double.parse(caData['valor']),
        s:double.parse(sData['valor']),
        mg: double.parse(mgData['valor']),
        so4:double.parse(so4Data['valor']),
        fe: double.parse(feData['valor']),
        mn: double.parse(mnData['valor']),
        cu:double.parse(cuData['valor']) ,
        al:double.parse(alData['valor']) ,
        cl:double.parse(clData['valor']) ,
        zn:double.parse(znData['valor']) ,
        na:double.parse(naData['valor']) ,
        ph:double.parse(phData['valor']) ,
        ce:double.parse(ceData['valor']) ,
        salesDisueltas: double.parse(salesDisueltasData['valor']),
        cice: double.parse(ciceData['valor']),
        arcilla: double.parse(map['Arcilla']),
        limo:double.parse( map['Limo']),
        arena: double.parse(map['Arena']),
        humus: double.parse(humusData['valor']));
  }
}
