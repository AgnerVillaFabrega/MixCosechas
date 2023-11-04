class PruebaSistemaFoliar {
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

  final String ca;
  final String mg;
  final String na;
  final String k;
  final String n;
  final String p;
  final String fe;
  final String cu;
  final String zn;
  final String mn;
  final String b;

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

  late List<String> valorCompuestos = [ca, mg, na, k, n, p, fe, cu, zn, mn, b];

  PruebaSistemaFoliar({
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
    required this.ca,
    required this.mg,
    required this.na,
    required this.k,
    required this.n,
    required this.p,
    required this.fe,
    required this.cu,
    required this.zn,
    required this.mn,
    required this.b
  });

  factory PruebaSistemaFoliar.fromMap(Map<String, dynamic> map) {
    return PruebaSistemaFoliar(
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
      ca: map['Calcio - Ca'],
      mg: map['Magnesio - Mg'],
      na: map['Sodio - Na'],
      k: map['Potasio - K'],
      n: map['Nitrógeno - N'],
      p: map['Fósforo - P'],
      fe: map['Hierro Férrico - Fe'],
      cu: map['Cobre - Cu'],
      zn: map['Zinc - Zn'],
      mn: map['Manganeso - Mn'],
      b: map['Boro - B']);
  }
}
