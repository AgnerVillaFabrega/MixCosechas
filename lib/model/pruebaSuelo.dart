class PruebaSuelo{
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
  final double Zn;

  final double Ph;
  final double C_E;
  final double salesDisueltas;
  final double CICE;

  late double CaMg;
  late double CaMgK;
  late double CaK;
  late double MgK;

  late double arcilla;
  late double limo;
  late double arena;
  late double humus;
  late String textura;




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
    'Zinc - Zn',
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
    Mg,
    SO4,
    Fe,
    Mn,
    Cu,
    Al,
    Cl,
    Zn,
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
    Mg_Interpretacion,
    SO4_Interpretacion,
    Fe_Interpretacion,
    Mn_Interpretacion,
    Cu_Interpretacion,
    Al_Interpretacion,
    Cl_Interpretacion,
    Zn_Interpretacion,
    Ph_Interpretacion,
    'Por Definir',
    salesDisueltas_Interpretacion,
    'Por Definir',
    CaMg_Interpretacion,
    CaMgK_Interpretacion,
    CaK_Interpretacion,
    MgK_Interpretacion,
    'NA',
    'NA',
    'NA',
    humus_Interpretacion,
    textura_interpretacion
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
  late String Zn_Interpretacion;

  late String Ph_Interpretacion;
  late String C_E_Interpretacion;
  late String salesDisueltas_Interpretacion;
  late String CICE_Interpretacion;

  late String CaMg_Interpretacion;
  late String CaMgK_Interpretacion;
  late String CaK_Interpretacion;
  late String MgK_Interpretacion;

  late String arcilla_Interpretacion;
  late String limo_Interpretacion;
  late String arena_Interpretacion;
  late String humus_Interpretacion;
  late String textura_interpretacion;

  PruebaSuelo({
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
    required this.Zn,

    required this.Ph,
    required this.C_E,
    required this.salesDisueltas,
    required this.CICE,

    required this.arcilla,
    required this.limo,
    required this.arena,
    required this.humus,
  }){
      
    double d = (Ca / Mg);
    String inString = d.toStringAsFixed(3); // '2.35'
    CaMg = double.parse(inString);
    //CaMg =  (Ca / Mg);
    CaMgK = ((Ca + Mg)/K);
    CaK = Ca/K;
    MgK = Mg / K;
    textura = interpretar_textura(arcilla, limo, arena);
    N_Interpretacion = interpretar_n(N);
    NH4_Interpretacion = interpretar_nh4(NH4);
    NO2_Interpretacion= interpretar_no2(NO2);
    NO3_Interpretacion= interpretar_no3(NO3);
    P_Interpretacion = interpretar_p(P);
    K_Interpretacion = interpretar_k(K);
    Ca_Interpretacion = interpretar_ca(Ca);
    Mg_Interpretacion = interpretar_mg(Mg);
    //S_Interpretacion = interpretar_s(S);
    SO4_Interpretacion = interpretar_so4(SO4);
    Fe_Interpretacion = interpretar_fe(Mn);
    Mn_Interpretacion = interpretar_mn(Mn);
    Cu_Interpretacion = interpretar_cu(Cu);
    Al_Interpretacion = interpretar_al(Al);
    Cl_Interpretacion = interpretar_cl(Cl);
    Zn_Interpretacion = interpretar_zn(Zn);

    Ph_Interpretacion = interpretar_ph(Ph);
   // C_E_Interpretacion = interpretar_ce(C_E);
    salesDisueltas_Interpretacion = interpretar_salesDisueltas(salesDisueltas);
    //CICE_Interpretacion = interpretar_cice(CICE);

    CaMg_Interpretacion = interpretar_CaMg(CaMg);
    CaMgK_Interpretacion = interpretar_CaMgK(CaMgK);
    CaK_Interpretacion = interpretar_CaK(CaK);
    MgK_Interpretacion = interpretar_MgK(MgK);

    // arcilla_Interpretacion = interpretar_arcilla(arcilla);
    // limo_Interpretacion = interpretar_limo(limo);
    // arena_Interpretacion = interpretar_arena(arena);
    humus_Interpretacion = interpretar_humus(humus);
    textura_interpretacion = interpretar_textura(arcilla, limo, arena);
     
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
  //String interpretar_s(double valor) {}
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
  //String interpretar_cice(double valor) {}
  String interpretar_CaMg(double valor) {
    
    if (valor < 2) {
      return "Bajo";
    } else if (valor > 5) {
      return "Alto";
    } else {
      return "Optimo";
    }
  }
  String interpretar_CaMgK(double valor) {
    
    if (valor < 2.5) {
      return "Bajo";
    } else if (valor > 15) {
      return "Alto";
    } else {
      return "Optimo";
    }
  }
  String interpretar_CaK(double valor) {
    
    if (valor < 10) {
      return "Bajo";
    } else if (valor > 40) {
      return "Alto";
    } else {
      return "Optimo";
    }
  }
  String interpretar_MgK(double valor) {
    
    if (valor < 5) {
      return "Bajo";
    } else if (valor > 25) {
      return "Alto";
    } else {
      return "Optimo";
    }
  }
  //String interpretar_arcilla(double valor) {}
  //String interpretar_limo(double valor) {}
  //String interpretar_arena(double valor) {}
  String interpretar_humus(double valor) {
    
    if (valor < 2) {
      return "Bajo";
    } else if (valor > 3) {
      return "Alto";
    } else {
      return "Medio";
    }
  }
  String interpretar_textura(double arcilla, double limo,double arena) {
    if (arcilla >= 40 && limo <= 40 && arena <= 45) {
      return "Arcilloso";
    } else if ((arcilla >= 35 && arcilla <= 55) && (limo <= 20)&&(arena >=45 && arena <= 65)){
      return "Arcillo-arenoso";
    } else if ((arcilla >= 40 && arcilla <= 60) && (limo >= 40 && limo <= 60) &&(arena <= 20)){
      return "Arcillo-limoso";
    } else if ((arcilla >= 27 && arcilla <= 40) && (limo >= 40 && limo <= 72) &&(arena <= 60)){
      return "Franco-arcillo-limoso";
    } else if ((arcilla >= 27 && arcilla <= 40) && (limo >= 15 && limo <= 52) &&(arena >= 20 && arena <= 45)) {
      return "Franco-arcilloso";
    } else if ((arcilla >= 7 && arcilla <= 35) && (limo <= 27) &&(arena >= 45 && arena <= 80)) {
      return "Franco-arcillo-arenoso";
    } else if ((arcilla >=7 && arcilla<= 27) && (limo >= 27 && limo <= 50) &&(arena >= 22 && arena <= 52)) {
      return "Franco";
    } else if ((arcilla <= 27) && (limo >= 50 && limo <= 87) &&(arena <= 50)) {
      return "Franco-limoso";
    } else if ((arcilla <= 12) && (limo >=80 ) &&(arena <= 20)) {
      return "Limoso";
    }else if ((arcilla <= 30) && (limo <= 30) &&(arena >= 70 && arena <= 85)) {
      return "Franco-arenoso";
    }else if ((arcilla >= 15) && (limo >= 15) && (arena >= 85 && arena <= 90)) {
      return "Arenoso-Franco";
    }else if ((arcilla <=10) && (limo <= 10) &&(arena >=90)) {
      return "Arena";
    }else{
      return "Error";
    }
  }

  factory PruebaSuelo.fromMap(Map<String, dynamic> map) {  
    return PruebaSuelo(
      N: map['N'],
      NH4: map['NH4'],
      NO2: map['NO2'],
      NO3: map['NO3'],
      P: map['P'],
      K: map['K'],
      Ca: map['Ca'],
      Mg: map['Mg'],
      SO4: map['SO4'],
      Fe: map['Fe'],
      Mn: map['Mn'],
      Cu: map['Cu'],
      Al: map['Al'],
      Cl: map['Cl'],
      Zn: map['Zn'],

      Ph: map['Ph'],
      C_E: map['C_E'],
      salesDisueltas: map['salesDisueltas'],
      CICE: map['CICE'],

      arcilla: map['Ph'],
      limo: map['C_E'],
      arena: map['salesDisueltas'],
      humus: map['CICE']
    );
  }
}