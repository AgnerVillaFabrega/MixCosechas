class Predio{
  final String idPropietario;
  final String nombrePropietario;
  final String correoPropietario;
  final String telefonoPropietario;

  final String id;
  final String nombre;
  final String corregimientoVereda;
  final String departamento;
  final String municipio;
  final String latitud;
  final String longitud;
  final String msnm;
  final String profundidadSB;
  final String puntos;
  final String temperatura;
  final int lotes;
  


  
  Predio({
    required this.id, 
    required this.idPropietario, 
    required this.nombrePropietario, 
    required this.correoPropietario, 
    required this.telefonoPropietario, 
    required this.nombre, 
    required this.corregimientoVereda, 
    required this.departamento, 
    required this.municipio, 
    required this.latitud,
    required this.longitud,
    required this.msnm,
    required this.profundidadSB,
    required this.puntos,
    required this.temperatura,
    required this.lotes
  });

  factory Predio.fromMap(Map<String, dynamic> map) {  
    return Predio(
      id: map['Id'],
      idPropietario: map['IdPropietario'],
      nombrePropietario: map['NombrePropietario'],
      correoPropietario: map['CorreoPropietario'],
      telefonoPropietario: map['TelefonoPropietario'],
      nombre: map['Nombre'],
      corregimientoVereda: map['CorregimientoVereda'],
      departamento: map['Departamento'],
      municipio: map['Municipio'],
      latitud: map['Latitud'],
      longitud: map['Longitud'],
      msnm: map['MSNM'],
      profundidadSB: map['ProfundidadSB'],
      puntos: map['Puntos'],
      temperatura: map['Temperatura'],
      lotes: int.parse(map['Lotes'])
    );
  }
}