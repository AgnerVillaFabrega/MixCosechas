class PruebaSistemaFoliar {
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

  final String Ca;
  final String Mg;
  final String Na;
  final String K;
  final String N;
  final String P;
  final String Fe;
  final String Cu;
  final String Zn;
  final String Mn;
  final String B;

  final List<String> nombreCompuestos = [
    'Calcio - Ca',
    'Magnesio - Mg',
    'Sodio - Na',
    'Potasio - K',
    'Nitrógeno - N',
    'Fósforo - P',
    'Hierro Férrico - Fe ',
    'Cobre - Cu',
    'Zinc - Zn',
    'Manganeso - Mn',
    'Boro - B'
  ];

  late List<String> valorCompuestos = [Ca, Mg, Na, K, N, P, Fe, Cu, Zn, Mn, B];

  PruebaSistemaFoliar({
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

    required this.Ca,
    required this.Mg,
    required this.Na,
    required this.K,
    required this.N,
    required this.P,
    required this.Fe, 
    required this.Cu,
    required this.Zn,
    required this.Mn,
    required this.B
  });

  

//   factory PruebaSistemaFoliar.fromMap(Map<String, dynamic> map) {
//     Map<String, dynamic> N_Data = map['Nitrato de Nitrógeno - N'][0];
//     Map<String, dynamic> NH4_Data = map['Nitrógeno amoniacal - NH4+'][0];
//     Map<String, dynamic> NO2_Data = map['Nitritos - NO2-'][0];
//     Map<String, dynamic> NO3_Data = map['Nitratos - NO3-'][0];
//     Map<String, dynamic> P_Data = map['Fósforo - P'][0];
//     Map<String, dynamic> K_Data = map['Potasio - K'][0];
//     Map<String, dynamic> Ca_Data = map['Calcio - Ca'][0];
//     Map<String, dynamic> Mg_Data = map['Magnesio - Mg'][0];
//     Map<String, dynamic> SO4_Data = map['Sulfato - SO4'][0];
//     Map<String, dynamic> Fe_Data = map['Hierro Férrico - Fe'][0];
//     Map<String, dynamic> Mn_Data = map['Manganeso - Mn'][0];
//     Map<String, dynamic> Cu_Data = map['Cobre - Cu'][0];
//     //Map<String, dynamic> Al_Data = map['Aluminio - Al'][0];
//     Map<String, dynamic> Cl_Data = map['Cloruro - Cl'][0];
//     // Map<String, dynamic> Zn_Data = map['Zinc - Zn'][0];
//     //Map<String, dynamic> Na_Data = map['Sodio - Na'][0];

//     Map<String, dynamic> Ph_Data = map['Ph'][0];
//     Map<String, dynamic> C_E_Data = map['C.E'][0];
//     Map<String, dynamic> salesDisueltas_Data = map['Sales Disueltas'][0];

//     return PruebaSistemaFoliar(
//       nombrePredio: map['NombrePredio'],
//       corregimientoPredio: map['Corregimiento'],
//       cultivoPredio: map['Cultivo'],
//       municipioPredio: map['Municipio'],
//       variedadPredio: map['Variedad'],
//       dptoPredio: map['Departamento'],
//       edadPredio: map['Edad'],
//       nombrepropietario: map['NombrePropietario'],
//       telefonopropietario: map['Telefono'],
//       correopropietario: map['Correo'],
//       // N: N_Data['valor'],
//       NH4: NH4_Data['valor'],
//       NO2: NO2_Data['valor'],
//       NO3: NO3_Data['valor'],
//       P: P_Data['valor'],
//       K: K_Data['valor'],
//       Ca: Ca_Data['valor'],
//       Mg: Mg_Data['valor'],
//       SO4: SO4_Data['valor'],
//       Fe: Fe_Data['valor'],
//       Mn: Mn_Data['valor'],
//       Cu: Cu_Data['valor'],
//       //   Al: Al_Data['valor'],
//       Cl: Cl_Data['valor'],
//       Ph: Ph_Data['valor'],
//       C_E: C_E_Data['valor'],
//       salesDisueltas: salesDisueltas_Data['valor']
//     );
//   }
 }
