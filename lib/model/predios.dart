class Predio{
  final String id;
  final String idUsuario;
  final String nombre;
  final String corregimientoVereda;
  final String departamento;
  final String municipio;
  final String cultivo;
  final String variedad;
  final String edad;

  
  Predio({
    required this.id, 
    required this.idUsuario, 
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
      idUsuario: map['IdUsuario'],
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