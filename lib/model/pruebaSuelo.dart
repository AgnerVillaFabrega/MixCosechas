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

  final double N;
  final double NH4;
  final double NO2;
  final double NO3;
  final double P;
  final double K;
  final double Ca;
  final double S;
  final double Mg;
  final double SO4;
  final double Fe;
  final double Mn;
  final double Cu;
  final double Al;
  final double Cl;
  final double Zn;
  final double Na;

  final double Ph;
  final double C_E;
  final double salesDisueltas;
  final double CICE;

  late double CaMg;
  late double CaMgK;
  late double CaK;
  late double MgK;

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
    N,
    NH4,
    NO2,
    NO3,
    P,
    K,
    Ca,
    S,
    Mg,
    SO4,
    Fe,
    Mn,
    Cu,
    Al,
    Cl,
    Zn,
    Na,
    Ph,
    C_E,
    salesDisueltas,
    CICE,
    CaMg,
    CaMgK,
    CaK,
    MgK,
    arcilla,
    limo,
    arena,
    humus,
    0,
  ];

  late List<String> interpretacionCompuestos = [
    N_Interpretacion,
    NH4_Interpretacion,
    NO2_Interpretacion,
    NO3_Interpretacion,
    P_Interpretacion,
    K_Interpretacion,
    Ca_Interpretacion,
    S_Interpretacion,
    Mg_Interpretacion,
    SO4_Interpretacion,
    Fe_Interpretacion,
    Mn_Interpretacion,
    Cu_Interpretacion,
    Al_Interpretacion,
    Cl_Interpretacion,
    Zn_Interpretacion,
    Na_Interpretacion,
    Ph_Interpretacion,
    C_E_Interpretacion,
    salesDisueltas_Interpretacion,
    CICE_Interpretacion,
    CaMg_Interpretacion,
    CaMgK_Interpretacion,
    CaK_Interpretacion,
    MgK_Interpretacion,
    'NA',
    'NA',
    'NA',
    humus_Interpretacion,
    textura
  ];

  late String N_Interpretacion;
  late String NH4_Interpretacion;
  late String NO2_Interpretacion;
  late String NO3_Interpretacion;
  late String P_Interpretacion;
  late String K_Interpretacion;
  late String Ca_Interpretacion;
  late String Mg_Interpretacion;
  late String S_Interpretacion;
  late String SO4_Interpretacion;
  late String Fe_Interpretacion;
  late String Mn_Interpretacion;
  late String Cu_Interpretacion;
  late String Al_Interpretacion;
  late String Cl_Interpretacion;
  late String Zn_Interpretacion;
  late String Na_Interpretacion;

  late String Ph_Interpretacion;
  late String C_E_Interpretacion;
  late String salesDisueltas_Interpretacion;
  late String CICE_Interpretacion;

  late String CaMg_Interpretacion;
  late String CaMgK_Interpretacion;
  late String CaK_Interpretacion;
  late String MgK_Interpretacion;

  late String humus_Interpretacion;

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
    required this.N,
    required this.NH4,
    required this.NO2,
    required this.NO3,
    required this.P,
    required this.K,
    required this.Ca,
    required this.Mg,
    required this.S,
    required this.SO4,
    required this.Fe,
    required this.Mn,
    required this.Cu,
    required this.Al,
    required this.Cl,
    required this.Zn,
    required this.Na,
    required this.Ph,
    required this.C_E,
    required this.salesDisueltas,
    required this.CICE,
    required this.arcilla,
    required this.limo,
    required this.arena,
    required this.humus,
  }) {
    // double d = (Ca / Mg);
    // String inString = d.toStringAsFixed(3); // '2.35'
    // CaMg = double.parse(inString);
    CaMg = (Ca / Mg);
    CaMgK = (Ca + Mg / K);
    CaK = Ca / K;
    MgK = Mg / K;
    N_Interpretacion = interpretar_n(N);
    NH4_Interpretacion = interpretar_nh4(NH4);
    NO2_Interpretacion = interpretar_no2(NO2);
    NO3_Interpretacion = interpretar_no3(NO3);
    P_Interpretacion = interpretar_p(P);
    K_Interpretacion = interpretar_k(K);
    Ca_Interpretacion = interpretar_ca(Ca);
    Mg_Interpretacion = interpretar_mg(Mg);
    S_Interpretacion = interpretar_s(S);
    SO4_Interpretacion = interpretar_so4(SO4);
    Fe_Interpretacion = interpretar_fe(Mn);
    Mn_Interpretacion = interpretar_mn(Mn);
    Cu_Interpretacion = interpretar_cu(Cu);
    Al_Interpretacion = interpretar_al(Al);
    Cl_Interpretacion = interpretar_cl(Cl);
    Zn_Interpretacion = interpretar_zn(Zn);
    Na_Interpretacion = interpretar_na(Na);

    Ph_Interpretacion = interpretar_ph(Ph);
    C_E_Interpretacion = interpretar_ce(C_E);
    salesDisueltas_Interpretacion = interpretar_salesDisueltas(salesDisueltas);
    CICE_Interpretacion = interpretar_cice(Al, K, Ca, Mg, Na);

    CaMg_Interpretacion = interpretar_CaMg(CaMg);
    CaMgK_Interpretacion = interpretar_CaMgK(CaMgK);
    CaK_Interpretacion = interpretar_CaK(CaK);
    MgK_Interpretacion = interpretar_MgK(MgK);

    humus_Interpretacion = interpretar_humus(humus);
    
    textura = valor_textura(arcilla, limo, arena);
  }

  String interpretar_n(double valor) {
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

  String interpretar_nh4(double valor) {
    if (valor < 12) {
      return "Bajo";
    } else if (valor >= 12 && valor <= 34) {
      return "Medio";
    } else {
      return "Alto";
    }
  }

  String interpretar_no2(double valor) {
    if (valor < 1) {
      return "Bajo";
    } else if (valor >= 1 && valor <= 5) {
      return "Medio";
    } else {
      return "Alto";
    }
  }

  String interpretar_no3(double valor) {
    if (valor < 5.5) {
      return "Bajo";
    } else if (valor >= 5.5 && valor <= 25.5) {
      return "Medio";
    } else {
      return "Alto";
    }
  }

  String interpretar_p(double valor) {
    if (valor < 17) {
      return "Bajo";
    } else if (valor >= 17 && valor <= 33.5) {
      return "Medio";
    } else {
      return "Alto";
    }
  }

  String interpretar_k(double valor) {
    if (valor < 38) {
      return "Bajo";
    } else if (valor >= 38 && valor <= 71.5) {
      return "Medio";
    } else {
      return "Alto";
    }
  }

  String interpretar_ca(double valor) {
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

  String interpretar_mg(double valor) {
    if (valor < 10) {
      return "Bajo";
    } else if (valor >= 10 && valor <= 50) {
      return "Medio";
    } else {
      return "Alto";
    }
  }

  String interpretar_s(double valor) {
    if (valor < 16) {
      return "Bajo";
    } else if (valor >= 16 && valor <= 50) {
      return "Medio";
    } else {
      return "Alto";
    }
  }

  String interpretar_so4(double valor) {
    if (valor < 16) {
      return "Bajo";
    } else if (valor >= 16 && valor <= 50) {
      return "Medio";
    } else {
      return "Alto";
    }
  }

  String interpretar_fe(double valor) {
    if (valor < 3) {
      return "Bajo";
    } else if (valor >= 3 && valor <= 10) {
      return "Medio";
    } else {
      return "Alto";
    }
  }

  String interpretar_mn(double valor) {
    if (valor < 5) {
      return "Bajo";
    } else if (valor >= 5 && valor <= 24) {
      return "Medio";
    } else {
      return "Alto";
    }
  }

  String interpretar_cu(double valor) {
    if (valor < 1) {
      return "Bajo";
    } else if (valor >= 1 && valor <= 3) {
      return "Medio - Sin relevancia";
    } else {
      return "Alto - Adecuado";
    }
  }

  String interpretar_al(double valor) {
    if (valor < 2) {
      return "Bajo - Aceptable";
    } else {
      return "Alto -Toxicidad";
    }
  }

  String interpretar_cl(double valor) {
    if (valor < 100) {
      return "Bajo";
    } else if (valor >= 100 && valor <= 400) {
      return "Medio";
    } else {
      return "Alto";
    }
  }

  String interpretar_zn(double valor) {
    if (valor < 0.5) {
      return "Bajo";
    } else if (valor >= 0.5 && valor <= 1) {
      return "Medio - Sin relevancia";
    } else {
      return "Alto - Adecuado";
    }
  }

  String interpretar_na(double valor) {
    if (valor < 0.9) {
      return "Aceptable";
    } else {
      return "Alto - Toxico";
    }
  }

  String interpretar_ph(double valor) {
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

  String interpretar_ce(double valor) {
    if (valor < 0.8) {
      return "Bajo - Adecuado";
    } else if (valor >= 0.08 && valor <= 1.6) {
      return "Medio";
    } else {
      return "Alto";
    }
  }

  String interpretar_salesDisueltas(double valor) {
    if (valor < 100) {
      return "Bajo";
    } else if (valor >= 100 && valor <= 400) {
      return "Medio";
    } else {
      return "Alto";
    }
  }

  String interpretar_cice(
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

  String interpretar_CaMg(double valor) {
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

  String interpretar_CaMgK(double valor) {
    if (valor < 40) {
      return "Adecuado para K";
    } else {
      return "Deficiencia de K";
    }
  }

  String interpretar_CaK(double valor) {
    if (valor < 30) {
      return "Adecuado para K";
    } else {
      return "Deficiencia de K";
    }
  }

  String interpretar_MgK(double valor) {
    if (valor < 1) {
      return "Deficiencia de Mg";
    } else if (valor >= 1 && valor <= 18) {
      return "Optimo";
    } else {
      return "Deficiencia de K";
    }
  }

//ARREGLAR INTERPRETACION HUMUS
  String interpretar_humus(double valor) {
    if (valor < 2) {
      return "Bajo";
    } else if (valor > 3) {
      return "Alto";
    } else {
      return "Medio";
    }
  }

  String valor_textura(double arcilla, double limo, double arena) {
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

    Map<String, dynamic> N_Data = map['Nitrato de Nitrógeno - N'][0];
    Map<String, dynamic> NH4_Data = map['Nitrógeno amoniacal - NH4+'][0];
    Map<String, dynamic> NO2_Data = map['Nitritos - NO2-'][0];
    Map<String, dynamic> NO3_Data = map['Nitratos - NO3-'][0];
    Map<String, dynamic> P_Data = map['Fósforo - P'][0];
    Map<String, dynamic> K_Data = map['Potasio - K'][0];
    Map<String, dynamic> Ca_Data = map['Calcio - Ca'][0];
    Map<String, dynamic> S_Data = map['Azufre - S'][0];
    Map<String, dynamic> Mg_Data = map['Magnesio - Mg'][0];
    Map<String, dynamic> SO4_Data = map['Sulfato - SO4'][0];
    Map<String, dynamic> Fe_Data = map['Hierro Férrico - Fe'][0];
    Map<String, dynamic> Mn_Data = map['Manganeso - Mn'][0];
    Map<String, dynamic> Cu_Data = map['Cobre - Cu'][0];
    Map<String, dynamic> Al_Data = map['Aluminio - Al'][0];
    Map<String, dynamic> Cl_Data = map['Cloruro - Cl'][0];
    Map<String, dynamic> Zn_Data = map['Zinc - Zn'][0];
    Map<String, dynamic> Na_Data = map['Sodio - Na'][0];

    Map<String, dynamic> Ph_Data = map['Ph'][0];
    Map<String, dynamic> C_E_Data = map['C.E'][0];
    Map<String, dynamic> salesDisueltas_Data = map['Sales Disueltas'][0];
    Map<String, dynamic> CICE_Data = map['C.I.C.E'][0];

    // Map<String, dynamic> CaMg_Data = map['Nitrato de Nitrógeno - N'][0];
    // Map<String, dynamic> CaMgK_Data = map['Nitrato de Nitrógeno - N'][0];
    // Map<String, dynamic> CaK_Data = map['Nitrato de Nitrógeno - N'][0];
    // Map<String, dynamic> MgK_Data = map['Nitrato de Nitrógeno - N'][0];

    Map<String, dynamic> arcilla_Data = map['Arcilla'][0];
    Map<String, dynamic> limo_Data = map['Limo'][0];
    Map<String, dynamic> arena_Data = map['Arena'][0];
    Map<String, dynamic> humus_Data = map['Humus'][0];
    // Map<String, dynamic> textura_Data = map['Nitrato de Nitrógeno - N'][0];
    

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
      N: N_Data['valor'],
      NH4: NH4_Data['valor'],
      NO2: NO2_Data['valor'],
      NO3: NO3_Data['valor'],
      P: P_Data['valor'],
      K: K_Data['valor'],
      Ca: Ca_Data['valor'],
      S: S_Data['valor'],
      Mg: Mg_Data['valor'],
      SO4: SO4_Data['valor'],
      Fe: Fe_Data['valor'],
      Mn: Mn_Data['valor'],
      Cu: Cu_Data['valor'],
      Al: Al_Data['valor'],
      Cl: Cl_Data['valor'],
      Zn: Zn_Data['valor'],
      Na: Na_Data['valor'],
      Ph: Ph_Data['valor'],
      C_E: C_E_Data['valor'],
      salesDisueltas: salesDisueltas_Data['valor'],
      CICE: CICE_Data['valor'],
      arcilla: arcilla_Data['valor'],
      limo: limo_Data['valor'],
      arena: arena_Data['valor'],
      humus: humus_Data['valor']
    );
  }
}
