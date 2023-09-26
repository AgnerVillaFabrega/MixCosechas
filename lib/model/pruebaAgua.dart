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

  final double N;
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
  final double Al;
  final double Cl;
  

  final double Ph;
  final double C_E;
  final double salesDisueltas;

  late double CaMg;

  late String tipoAgua;




  final List<String> nombreCompuestos = [
    'Nitrato de Nitrógeno - N',
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
    'Aluminio - Al',
    'Cloruro - Cl',
    'Ph',
    'C.E',
    'Sales Disueltas',
    'Ca/Mg',
    'Tipo de Agua',
  ];

  late List<double> valorCompuestos = [
    N,
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
    Al,
    Cl,
    Ph,
    C_E,
    salesDisueltas,
    CaMg,
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
    Mg_Interpretacion,
    SO4_Interpretacion,
    Fe_Interpretacion,
    Mn_Interpretacion,
    Cu_Interpretacion,
    Al_Interpretacion,
    Cl_Interpretacion,
    Ph_Interpretacion,
    'Por Definir',
    salesDisueltas_Interpretacion,
    'Por Definir',
    CaMg_Interpretacion
  ];

  late String N_Interpretacion;
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
  late String Al_Interpretacion;
  late String Cl_Interpretacion;

  late String Ph_Interpretacion;
  //late String C_E_Interpretacion;
  late String salesDisueltas_Interpretacion;

  late String CaMg_Interpretacion;


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
    
    required this.N, 
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
    required this.Al,
    required this.Cl,

    required this.Ph,
    required this.C_E,
    required this.salesDisueltas,
  }){
      
    double d = (Ca / Mg);
    String inString = d.toStringAsFixed(3); // '2.35'
    CaMg = double.parse(inString);
    N_Interpretacion = interpretar_n(N);
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
    Al_Interpretacion = interpretar_al(Al);
    Cl_Interpretacion = interpretar_cl(Cl);

    Ph_Interpretacion = interpretar_ph(Ph);
   // C_E_Interpretacion = interpretar_ce(C_E);
    salesDisueltas_Interpretacion = interpretar_salesDisueltas(salesDisueltas);

    CaMg_Interpretacion = interpretar_CaMg(CaMg);
    tipoAgua = 'Por definir';
    
     
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
    } else if (valor >= 12 && valor <= 20) {
      return "Medio";
    } else if (valor >= 21 && valor <= 34) {
      return "Óptimo";
    } else {
      return "Alto";
    }
  }
  String interpretar_no2(double valor) {
    
    if (valor < 1) {
      return "Bajo";
    } else if (valor >= 1 && valor <= 2) {
      return "Medio";
    } else if (valor >= 3 && valor <= 5) {
      return "Óptimo";
    } else {
      return "Alto";
    }
  }
  String interpretar_no3(double valor) {
    
    if (valor < 4.5) {
      return "Bajo";
    } else if (valor >= 5 && valor <= 25) {
      return "Medio";
    } else if (valor >= 26 && valor <= 50) {
      return "Óptimo";
    } else {
      return "Alto";
    }
  }
  String interpretar_p(double valor) {
    
    if (valor < 7) {
      return "Bajo";
    } else if (valor >= 7 && valor <= 17) {
      return "Medio";
    } else if (valor >= 18 && valor <= 33) {
      return "Óptimo";
    } else {
      return "Alto";
    }
  }
  String interpretar_k(double valor) {
    
    if (valor < 38) {
      return "Bajo";
    } else if (valor >= 38 && valor <= 71) {
      return "Medio";
    } else if (valor >= 72 && valor <= 140) {
      return "Óptimo";
    } else {
      return "Alto";
    }
  }
  String interpretar_ca(double valor) {
    
    if (valor < 200) {
      return "Bajo";
    } else if (valor >= 200 && valor <= 400) {
      return "Medio";
    } else if (valor >= 500 && valor <= 1000) {
      return "Óptimo";
    } else {
      return "Alto";
    }
  }
  String interpretar_mg(double valor) {
    
    if (valor < 50) {
      return "Bajo";
    } else if (valor >= 50 && valor <= 150) {
      return "Medio";
    } else if (valor >= 151 && valor <= 800) {
      return "Óptimo";
    } else {
      return "Alto";
    }
  }

  String interpretar_so4(double valor) {
    
    if (valor < 16) {
      return "Bajo";
    } else if (valor >= 16 && valor <= 30) {
      return "Medio";
    } else if (valor >= 31 && valor <= 50) {
      return "Óptimo";
    } else {
      return "Alto";
    }
  }
  String interpretar_fe(double valor) {
    
    if (valor < 3) {
      return "Bajo";
    } else if (valor >= 3 && valor <= 5) {
      return "Medio";
    } else if (valor >= 6 && valor <= 10) {
      return "Óptimo";
    } else {
      return "Alto";
    }
  } 
  String interpretar_mn(double valor) {
    
    if (valor < 5) {
      return "Bajo";
    } else if (valor >= 5 && valor <= 24) {
      return "Medio";
    } else if (valor >= 25 && valor <= 40) {
      return "Óptimo";
    } else {
      return "Alto";
    }
  }
  String interpretar_cu(double valor) {
    
    if (valor < 1) {
      return "Bajo";
    } else if (valor >= 1 && valor <= 3) {
      return "Medio";
    } else if (valor == 4 ) {
      return "Óptimo";
    } else {
      return "Alto";
    }
  }
  String interpretar_al(double valor) {
    
    if (valor < 10) {
      return "Bajo";
    } else if (valor >= 10 && valor <= 50) {
      return "Medio";
    } else if (valor >= 51 && valor <= 100) {
      return "Óptimo";
    } else {
      return "Alto";
    }
  }
  String interpretar_cl(double valor) {
    
    if (valor < 100) {
      return "Bajo";
    } else if (valor >= 100 && valor <= 400) {
      return "Medio?";
    } else {
      return "Alto";
    }
  }
  String interpretar_zn(double valor) {
    
    if (valor < 0.5) {
      return "Bajo";
    } else if (valor >= 0.5 && valor <= 1) {
      return "Medio";
    } else if (valor >= 1.1 && valor <= 2) {
      return "Óptimo";
    } else {
      return "Alto";
    }
  }
  String interpretar_ph(double valor) {
    
    if (valor >= 4.0 && valor < 4.5) {
      return "Muy Fuertemente Ácida";
    } else if (valor >= 4.5 && valor < 5.5){
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
  //String interpretar_ce(double valor) {}
  String interpretar_salesDisueltas(double valor) {
    
    if (valor < 100) {
      return "Bajo";
    } else if (valor >= 100 && valor <= 400) {
      return "Medio";
    } else {
      return "Alto";
    }
  }
  
  String interpretar_CaMg(double valor) {
    
    if (valor < 2) {
      return "Bajo";
    } else if (valor > 5) {
      return "Alto";
    } else {
      return "Optimo";
    }
  }
  

  
  

  // factory PruebaSuelo.fromMap(Map<String, dynamic> map) {  
  //   return PruebaSuelo(
  //     N: map['N'],
  //     NH4: map['NH4'],
  //     NO2: map['NO2'],
  //     NO3: map['NO3'],
  //     P: map['P'],
  //     K: map['K'],
  //     Ca: map['Ca'],
  //     Mg: map['Mg'],
  //     SO4: map['SO4'],
  //     Fe: map['Fe'],
  //     Mn: map['Mn'],
  //     Cu: map['Cu'],
  //     Al: map['Al'],
  //     Cl: map['Cl'],
  //     Zn: map['Zn'],

  //     Ph: map['Ph'],
  //     C_E: map['C_E'],
  //     salesDisueltas: map['salesDisueltas'],
  //     CICE: map['CICE'],

  //     arcilla: map['Ph'],
  //     limo: map['C_E'],
  //     arena: map['salesDisueltas'],
  //     humus: map['CICE']
  //   );
  // }
}