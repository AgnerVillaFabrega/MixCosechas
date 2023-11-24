class PruebaSistemaFoliar {
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
  final String telefonopropietario;
  final String correopropietario;

  final String idPrueba;
  final String tipoPrueba = 'Sistema foliar';
  String? fechaPrueba =
      '${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}';
  final String fechaTomaMuestra;
  final String fechaRecibido;
  final String lote;
  final String cultivo;
  final String variedad;
  final String edad;

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

  PruebaSistemaFoliar(
      {required this.idPrueba,
      required this.idPredio,
      required this.nombrePredio,
      required this.corregimientoPredio,
      required this.dptoPredio,
      required this.municipioPredio,
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
      required this.idPropietario,
      required this.nombrepropietario,
      required this.telefonopropietario,
      required this.correopropietario,
      required this.lote,
      required this.fechaTomaMuestra,
      required this.fechaRecibido,
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
      required this.b,
      fechaPrueba});

  factory PruebaSistemaFoliar.fromMap(Map<String, dynamic> map) {
    return PruebaSistemaFoliar(
      idPrueba: map['IdPrueba'],
      idPredio: map['IdPredio'],
      nombrePredio: map['NombrePredio'],
      corregimientoPredio: map['Corregimiento'],
      dptoPredio: map['Departamento'],
      municipioPredio: map['Municipio'],
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
      idPropietario: map['Idpropietario'],
      nombrepropietario: map['Nombrepropietario'],
      telefonopropietario: map['Telefono'],
      correopropietario: map['Correo'],
      lote: map['Lote'],
      fechaTomaMuestra: map['FechaTomaMuestra'],
      fechaRecibido: map['FechaRecibido'],
      fechaPrueba: map['Fecha'],
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
