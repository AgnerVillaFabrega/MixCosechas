class PruebaAgua {
  final String idPredio;
  final String nombrePredio;
  final String corregimientoPredio;
  final String cultivoPredio;
  final String municipioPredio;
  final String variedadPredio;
  final String dptoPredio;
  final String edadPredio;
  final String idPropietario;
  final String nombrepropietario;
  final String telefonopropietario;
  final String correopropietario;
  String? fechaPrueba = '${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}';

  late String interpretacion;
  late String recomendaciones;
  late String restricciones;

  //final double N;
  final double nh4;
  final double no2;
  final double no3;
  final double p;
  final double k;
  final double ca;
  final double mg;
  final double so4;
  final double fe;
  final double mn;
  final double cu;
  final double cl;

  final double ph;
  final double ce;
  final double salesDisueltas;

  //late double CaMg;

  final String tipoAgua;

  final List<String> graficaCompuestos = [
    'NH4',
    'NO2',
    'NO3',
    'P',
    'K',
    'Ca',
    'Mg',
    'SO4',
  ];
  late List<double> valorgraficaCompuestos = [
    nh4,
    no2,
    no3,
    p,
    k,
    ca,
    mg,
    so4
  ];
  final List<String> graficaCompuestos2 = [
    'Fe',
    'Mn',
    'Cu',
    'Cl',
    'Ph',
    'C.E',
    'Sales',
  ];
  late List<double> valorgraficaCompuestos2 = [fe, mn, cu, cl, ph,ce, salesDisueltas];

  final List<String> nombreCompuestos = [
    
    'Nitrógeno - NH4+',
    'Nitritos - NO2-',
    'Nitratos - NO3-',
    'Fósforo - P',
    'Potasio - K',
    'Calcio - Ca',
    'Magnesio - Mg',
    'Sulfato - SO4',
    'Hierro Férrico - Fe ',
    'Manganeso - Mn',
    'Cobre - Cu',
    'Cloruro - Cl',
    'Ph',
    'C.E',
    'Sales Disueltas',
    //'Ca/Mg',
    'Tipo de Agua',
  ];

  late List<double> valorCompuestos = [
    //N,
    nh4,
    no2,
    no3,
    p,
    k,
    ca,
    mg,
    so4,
    fe,
    mn,
    cu,
    cl,
    ph,
    ce,
    salesDisueltas,
    //CaMg,
    0
  ];

  late List<String> interpretacionCompuestos = [
    //N_Interpretacion,
    nh4Interpretacion,
    no2Interpretacion,
    no3Interpretacion,
    pInterpretacion,
    kInterpretacion,
    caInterpretacion,
    mgInterpretacion,
    so4Interpretacion,
    feInterpretacion,
    mnInterpretacion,
    cuInterpretacion,
    clInterpretacion,
    phInterpretacion,
    ceInterpretacion,
    salesDisueltasInterpretacion,
    tipoAgua,
    //CaMg_Interpretacion
  ];

  //late String N_Interpretacion;
  late String nh4Interpretacion;
  late String no2Interpretacion;
  late String no3Interpretacion;
  late String pInterpretacion;
  late String kInterpretacion;
  late String caInterpretacion;
  late String mgInterpretacion;
  late String so4Interpretacion;
  late String feInterpretacion;
  late String mnInterpretacion;
  late String cuInterpretacion;
  late String clInterpretacion;

  late String phInterpretacion;
  late String ceInterpretacion;
  late String salesDisueltasInterpretacion;

  //late String CaMg_Interpretacion;

  PruebaAgua({
    required this.idPredio,
    required this.nombrePredio,
    required this.corregimientoPredio,
    required this.cultivoPredio,
    required this.municipioPredio,
    required this.variedadPredio,
    required this.dptoPredio,
    required this.edadPredio,
    required this.idPropietario,
    required this.nombrepropietario,
    required this.telefonopropietario,
    required this.correopropietario,
    required this.interpretacion,
    required this.recomendaciones,
    required this.restricciones,

    //required this.N,
    required this.nh4,
    required this.no2,
    required this.no3,
    required this.p,
    required this.k,
    required this.ca,
    required this.mg,
    required this.so4,
    required this.fe,
    required this.mn,
    required this.cu,
    required this.cl,
    required this.ph,
    required this.ce,
    required this.salesDisueltas,
    required this.tipoAgua,
    fechaPrueba
  }) {
    //double d = (Ca / Mg);
    //String inString = d.toStringAsFixed(3); // '2.35'
    //CaMg = double.parse(inString);
    //N_Interpretacion = interpretar_n(N);
    nh4Interpretacion = nh4Interpretar(nh4);
    no2Interpretacion = no2Interpretar(no2);
    no3Interpretacion = no3Interpretar(no3);
    pInterpretacion = pInterpretar(p);
    kInterpretacion = kInterpretar(k);
    caInterpretacion = caInterpretar(ca);
    mgInterpretacion = mgInterpretar(mg);
    so4Interpretacion = so4Interpretar(so4);
    feInterpretacion = feInterpretar(mn);
    mnInterpretacion = mnInterpretar(mn);
    cuInterpretacion = cuInterpretar(cu);
    clInterpretacion = clInterpretar(cl);

    phInterpretacion = phInterpretar(ph);
    ceInterpretacion = ceInterpretar(ce);
    salesDisueltasInterpretacion = interpretarSalesDisueltas(salesDisueltas);

    //CaMg_Interpretacion = interpretar_CaMg(CaMg);
  }

  // String interpretar_n(double valor) {

  //   if (valor < 0.08) {
  //     return "Bajo";
  //   } else if (valor >= 0.08 && valor <= 0.10) {
  //     return "Medio";
  //   } else if (valor > 0.10 && valor <= 0.15) {
  //    return "Óptimo";
  //   } else {
  //     return "Alto";
  //   }
  // }
  String nh4Interpretar(double valor) {
    if (valor < 5) {
      return "(SR)";
    } else if (valor >= 5 && valor <= 30) {
      return "(CR)";
    } else {
      return "(P) Contaminación";
    }
  }

  //PREGUNTAR POR INTERPRETACIÓN
  String no2Interpretar(double valor) {
    if (valor < 7) {
      return "(SR)";
    } else if (valor >= 7 && valor <= 8) {
      return "(CR)";
    } else {
      return "(P)";
    }
  }

  String no3Interpretar(double valor) {
    if (valor < 50) {
      return "(SR)";
    } else if (valor >= 50 && valor <= 100) {
      return "(CR)";
    } else {
      return "(P) Contaminación";
    }
  }

  String pInterpretar(double valor) {
    if (valor < 8) {
      return "(SR)";
    } else if (valor >= 8 && valor <= 15) {
      return "(CR)";
    } else {
      return "(P) Eutrofización";
    }
  }

  String kInterpretar(double valor) {
    if (valor < 100) {
      return "(SR)";
    } else {
      return "(P) Salinidad";
    }
  }

  String caInterpretar(double valor) {
    if (valor < 250) {
      return "(SR)";
    } else {
      return "(P) Obstrucción";
    }
  }

  String mgInterpretar(double valor) {
    if (valor < 120) {
      return "(SR)";
    } else {
      return "(P) Obstrucción";
    }
  }

  String so4Interpretar(double valor) {
    if (valor < 600) {
      return "(SR)";
    } else if (valor >= 600 && valor <= 900) {
      return "(CR)";
    } else {
      return "(P) Toxicidad Deficiencia de N";
    }
  }

  String feInterpretar(double valor) {
    if (valor < 0.1) {
      return "(SR)";
    } else if (valor >= 0.1 && valor <= 1.5) {
      return "(CR)";
    } else {
      return "(P) Obstrucción óxidos ferricos";
    }
  }

  String mnInterpretar(double valor) {
    if (valor < 0.1) {
      return "(SR)";
    } else if (valor >= 0.1 && valor <= 1.5) {
      return "(CR)";
    } else {
      return "(P) Obstrucción bacterias reductoras";
    }
  }

  String cuInterpretar(double valor) {
    if (valor < 0.5) {
      return "(SR)";
    } else if (valor >= 0.5 && valor <= 1) {
      return "(CR)";
    } else {
      return "(P)";
    }
  }

  String clInterpretar(double valor) {
    if (valor < 140) {
      return "(SR)";
    } else if (valor >= 140 && valor <= 350) {
      return "(CR)";
    } else {
      return "(P)";
    }
  }

  // String interpretar_zn(double valor) {

  //   if (valor < 2) {
  //     return "(SR)";
  //   } else if (valor >= 2 && valor <= 3) {
  //     return "(CR)";
  //   } else {
  //     return "(P)";
  //   }
  // }

  String phInterpretar(double valor) {
    if (valor < 7) {
      return "(SR)";
    } else if (valor >= 7 && valor <= 8) {
      return "(CR)";
    } else {
      return "(P)";
    }
  }

  String ceInterpretar(double valor) {
    if (valor < 1.2) {
      return "(SR)";
    } else if (valor >= 1.2 && valor <= 2.5) {
      return "(CR)";
    } else {
      return "(P) Salinidad";
    }
  }

  String interpretarSalesDisueltas(double valor) {
    if (valor < 160) {
      return "(SR)";
    } else if (valor >= 160 && valor <= 480) {
      return "(CR)";
    } else {
      return "(P) Salinidad";
    }
  }

  // String interpretar_CaMg(double valor) {

  //   if (valor < 2) {
  //     return "Bajo";
  //   } else if (valor > 5) {
  //     return "Alto";
  //   } else {
  //     return "Optimo";
  //   }
  // }

  factory PruebaAgua.fromMap(Map<String, dynamic> map) {
    //Map<String, dynamic> N_Data = map['Nitrato de Nitrógeno - N'][0];
    Map<String, dynamic> nh4Data = map['Nitrógeno amoniacal - NH4+'][0];
    Map<String, dynamic> no2Data = map['Nitritos - NO2-'][0];
    Map<String, dynamic> no3Data = map['Nitratos - NO3-'][0];
    Map<String, dynamic> pData = map['Fósforo - P'][0];
    Map<String, dynamic> kData = map['Potasio - K'][0];
    Map<String, dynamic> caData = map['Calcio - Ca'][0];
    Map<String, dynamic> mgData = map['Magnesio - Mg'][0];
    Map<String, dynamic> so4Data = map['Sulfato - SO4'][0];
    
    Map<String, dynamic> mnData = map['Manganeso - Mn'][0];
    Map<String, dynamic> cuData = map['Cobre - Cu'][0];
    Map<String, dynamic> feData = map['Hierro Férrico - Fe'][0];
    
    //Map<String, dynamic> Al_Data = map['Aluminio - Al'][0];
    Map<String, dynamic> clData = map['Cloruro - Cl'][0];
    // Map<String, dynamic> Zn_Data = map['Zinc - Zn'][0];
    //Map<String, dynamic> Na_Data = map['Sodio - Na'][0];

    Map<String, dynamic> phData = map['Ph'][0];
    Map<String, dynamic> ceData = map['C.E'][0];
    Map<String, dynamic> salesDisueltasData = map['Sales Disueltas'][0];
    
    
    return PruebaAgua(
      idPredio: map['IdPredio'],
      nombrePredio: map['NombrePredio'],
      corregimientoPredio: map['Corregimiento'],
      cultivoPredio: map['Cultivo'],
      municipioPredio: map['Municipio'],
      variedadPredio: map['Variedad'],
      dptoPredio: map['Departamento'],
      edadPredio: map['Edad'],
      idPropietario: map['Idpropietario'],
      nombrepropietario: map['Nombrepropietario'],
      telefonopropietario: map['Telefono'],
      correopropietario: map['Correo'],
      fechaPrueba : map ['Fecha'],
      interpretacion: map['Interpretacion'],
      recomendaciones: map['Recomendaciones'],
      restricciones: map['Restricciones'],
      // N: N_Data['valor'],
      nh4: double.parse(nh4Data['valor'].toString()),
      no2: double.parse(no2Data['valor'].toString()),
      no3: double.parse(no3Data['valor'].toString()),
      p: double.parse(pData['valor'].toString()),
      k: double.parse(kData['valor'].toString()),
      ca: double.parse(caData['valor'].toString()),
      mg: double.parse(mgData['valor'].toString()),
      so4: double.parse(so4Data['valor'].toString()),
      fe: double.parse(feData['valor'].toString()),
      mn: double.parse(mnData['valor'].toString()),
      cu: double.parse(cuData['valor'].toString()),
      //   Al: Al_Data['valor'],
      cl: double.parse(clData['valor'].toString()),
      ph: double.parse(phData['valor'].toString()),
      ce: double.parse(ceData['valor'].toString()),
      salesDisueltas: double.parse(salesDisueltasData['valor'].toString()),
      tipoAgua: map['TipoAgua']
    );
  }
}
