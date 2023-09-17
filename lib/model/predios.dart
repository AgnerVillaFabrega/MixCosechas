class Predio{
  final String id;
  final String idPropietario;
  final String nombrePropietario;
  final String correoPropietario;
  final String telefonoPropietario;
  final String nombre;
  final String corregimientoVereda;
  final String departamento;
  final String municipio;
  final String cultivo;
  final String variedad;
  final String edad;

  
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
    required this.cultivo,
    required this.variedad,
    required this.edad
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
      cultivo: map['Cultivo'],
      variedad: map['Variedad'],
      edad: map['Edad']
    );
  }
}