class PruebaAgua{
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

  //final double N;
  final double NH4;
  final double NO2; 
  final double NO3; 
  final double P;
  final double K;
  final double Ca;
  final double Mg;
  final double SO4;
  final double Fe;
  final double Mn;
  final double Cu;
  final double Cl;
  
  final double Ph;
  final double C_E;
  final double salesDisueltas;

  //late double CaMg;

  late String tipoAgua;




  final List<String> nombreCompuestos = [
    //'Nitrato de Nitrógeno - N',
    'Nitrógeno amoniacal - NH4+',
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
    NH4,
    NO2,
    NO3,
    P,
    K,
    Ca,
    Mg,
    SO4,
    Fe,
    Mn,
    Cu,
    Cl,
    Ph,
    C_E,
    salesDisueltas,
    //CaMg,
    0,
  ];

  late List<String> interpretacionCompuestos = [
    //N_Interpretacion,
    NH4_Interpretacion,
    NO2_Interpretacion,
    NO3_Interpretacion,
    P_Interpretacion,
    K_Interpretacion,
    Ca_Interpretacion,
    Mg_Interpretacion,
    SO4_Interpretacion,
    Fe_Interpretacion,
    Mn_Interpretacion,
    Cu_Interpretacion,
    Cl_Interpretacion,
    Ph_Interpretacion,
    C_E_Interpretacion,
    salesDisueltas_Interpretacion,
    'Por Definir',
    //CaMg_Interpretacion
  ];

  //late String N_Interpretacion;
  late String NH4_Interpretacion;
  late String NO2_Interpretacion;
  late String NO3_Interpretacion;
  late String P_Interpretacion;
  late String K_Interpretacion;
  late String Ca_Interpretacion;
  late String Mg_Interpretacion;
  late String SO4_Interpretacion;
  late String Fe_Interpretacion;
  late String Mn_Interpretacion;
  late String Cu_Interpretacion;
  late String Cl_Interpretacion;

  late String Ph_Interpretacion;
  late String C_E_Interpretacion;
  late String salesDisueltas_Interpretacion;

  //late String CaMg_Interpretacion;


  PruebaAgua({
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
    
    //required this.N, 
    required this.NH4, 
    required this.NO2,
    required this.NO3,
    required this.P,
    required this.K,
    required this.Ca,
    required this.Mg,
    required this.SO4,
    required this.Fe,
    required this.Mn,
    required this.Cu,
    required this.Cl,

    required this.Ph,
    required this.C_E,
    required this.salesDisueltas,
  }){
      
    //double d = (Ca / Mg);
    //String inString = d.toStringAsFixed(3); // '2.35'
    //CaMg = double.parse(inString);
    //N_Interpretacion = interpretar_n(N);
    NH4_Interpretacion = interpretar_nh4(NH4);
    NO2_Interpretacion= interpretar_no2(NO2);
    NO3_Interpretacion= interpretar_no3(NO3);
    P_Interpretacion = interpretar_p(P);
    K_Interpretacion = interpretar_k(K);
    Ca_Interpretacion = interpretar_ca(Ca);
    Mg_Interpretacion = interpretar_mg(Mg);
    SO4_Interpretacion = interpretar_so4(SO4);
    Fe_Interpretacion = interpretar_fe(Mn);
    Mn_Interpretacion = interpretar_mn(Mn);
    Cu_Interpretacion = interpretar_cu(Cu);
    Cl_Interpretacion = interpretar_cl(Cl);

    Ph_Interpretacion = interpretar_ph(Ph);
    C_E_Interpretacion = interpretar_ce(C_E);
    salesDisueltas_Interpretacion = interpretar_salesDisueltas(salesDisueltas);

    //CaMg_Interpretacion = interpretar_CaMg(CaMg);
    tipoAgua = 'Por definir';
    
     
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
  String interpretar_nh4(double valor) {
    
    if (valor < 5) {
      return "(SR)";
    } else if (valor >= 5 && valor <= 30) {
      return "(CR)";
    } else {
      return "(P) Contaminación";
    }
  }

  //PREGUNTAR POR INTERPRETACIÓN
  String interpretar_no2(double valor) {
    
    if (valor < 7) {
      return "(SR)";
    } else if (valor >= 7 && valor <= 8) {
      return "(CR)";
    } else {
      return "(P)";
    }
  }

  String interpretar_no3(double valor) {
    
    if (valor < 50) {
      return "(SR)";
    } else if (valor >= 50 && valor <= 100) {
      return "(CR)";
    } else {
      return "(P) Contaminación";
    }
  }

  String interpretar_p(double valor) {
    
    if (valor < 8) {
      return "(SR)";
    } else if (valor >= 8 && valor <= 15) {
      return "(CR)";
    } else {
      return "(P) Eutrofización";
    }
  }
  
  String interpretar_k(double valor) {
    
    if (valor < 100) {
      return "(SR)";
    } else {
      return "(P) Salinidad";
    }
  }

  String interpretar_ca(double valor) {
    
    if (valor < 250) {
      return "(SR)";
    } else {
      return "(P) Obstrucción";
    }
  }

  String interpretar_mg(double valor) {
    
    if (valor < 120) {
      return "(SR)";
    } else {
      return "(P) Obstrucción";
    }
  }

  String interpretar_so4(double valor) {
    
    if (valor < 600) {
      return "(SR)";
    } else if (valor >= 600 && valor <= 900) {
      return "(CR)";
    } else {
      return "(P) Toxicidad Deficiencia de N";
    }
  }

  String interpretar_fe(double valor) {
    
    if (valor < 0.1) {
      return "(SR)";
    } else if (valor >= 0.1 && valor <= 1.5) {
      return "(CR)";
    } else {
      return "(P) Obstrucción óxidos ferricos";
    }
  } 

  String interpretar_mn(double valor) {
    
    if (valor < 0.1) {
      return "(SR)";
    } else if (valor >= 0.1 && valor <= 1.5) {
      return "(CR)";
    } else {
      return "(P) Obstrucción bacterias reductoras";
    }
  }

  String interpretar_cu(double valor) {
    
    if (valor < 0.5) {
      return "(SR)";
    } else if (valor >= 0.5 && valor <= 1) {
      return "(CR)";
    } else {
      return "(P)";
    }
  }
  
  String interpretar_cl(double valor) {
    
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

  String interpretar_ph(double valor) {
    
    if (valor < 7) {
      return "(SR)";
    } else if (valor >= 7 && valor <= 8) {
      return "(CR)";
    } else {
      return "(P)";
    }
  }

  String interpretar_ce(double valor) {
    if (valor < 1.2) {
      return "(SR)";
    } else if (valor >= 1.2 && valor <= 2.5) {
      return "(CR)";
    } else {
      return "(P) Salinidad";
    }
  }

  String interpretar_salesDisueltas(double valor) {
    
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
    Map<String, dynamic> NH4_Data = map['Nitrógeno amoniacal - NH4+'][0];
    Map<String, dynamic> NO2_Data = map['Nitritos - NO2-'][0];
    Map<String, dynamic> NO3_Data = map['Nitratos - NO3-'][0];
    Map<String, dynamic> P_Data = map['Fósforo - P'][0];
    Map<String, dynamic> K_Data = map['Potasio - K'][0];
    Map<String, dynamic> Ca_Data = map['Calcio - Ca'][0];
    Map<String, dynamic> Mg_Data = map['Magnesio - Mg'][0];
    Map<String, dynamic> SO4_Data = map['Sulfato - SO4'][0];
    Map<String, dynamic> Fe_Data = map['Hierro Férrico - Fe'][0];
    Map<String, dynamic> Mn_Data = map['Manganeso - Mn'][0];
    Map<String, dynamic> Cu_Data = map['Cobre - Cu'][0];
    //Map<String, dynamic> Al_Data = map['Aluminio - Al'][0];
    Map<String, dynamic> Cl_Data = map['Cloruro - Cl'][0];
   // Map<String, dynamic> Zn_Data = map['Zinc - Zn'][0];
    //Map<String, dynamic> Na_Data = map['Sodio - Na'][0];

    Map<String, dynamic> Ph_Data = map['Ph'][0];
    Map<String, dynamic> C_E_Data = map['C.E'][0];
    Map<String, dynamic> salesDisueltas_Data = map['Sales Disueltas'][0];

    return PruebaAgua(
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
     // N: N_Data['valor'],
      NH4: NH4_Data['valor'],
      NO2: NO2_Data['valor'],
      NO3: NO3_Data['valor'],
      P: P_Data['valor'],
      K: K_Data['valor'],
      Ca: Ca_Data['valor'],
      Mg: Mg_Data['valor'],
      SO4: SO4_Data['valor'],
      Fe: Fe_Data['valor'],
      Mn: Mn_Data['valor'],
      Cu: Cu_Data['valor'],
 //   Al: Al_Data['valor'],
      Cl: Cl_Data['valor'],
      Ph: Ph_Data['valor'],
      C_E: C_E_Data['valor'],
      salesDisueltas: salesDisueltas_Data['valor']
    );
  }
}