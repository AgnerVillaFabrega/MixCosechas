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

  

  factory PruebaSistemaFoliar.fromMap(Map<String, dynamic> map) {

    return PruebaSistemaFoliar(
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
      
      Ca: map['Calcio - Ca'],
      Mg: map['Magnesio - Mg'],
      Na: map['Sodio - Na'],
      K: map['Potasio - K'],
      N: map['Nitrógeno - N'],
      P: map['Fósforo - P'],
      Fe: map['Hierro Férrico - Fe'],
      Cu: map['Cobre - Cu'],
      Zn: map['Zinc - Zn'],
      Mn: map['Manganeso - Mn'],
      B: map['Boro - B']
    );
  }
 }
