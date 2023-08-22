

class Cliente{
  final String id;
  final String nombre;
  final String telefono;
  final String correo;
  final String rol;
  final String password;
  
  Cliente({
    required this.id, 
    required this.nombre, 
    required this.telefono, 
    required this.correo, 
    required this.rol, 
    required this.password
  });

  factory Cliente.fromMap(Map<String, dynamic> map) {  
    return Cliente(
      id: map['Id'],
      nombre: map['Nombre'],
      telefono: map['Telefono'],
      correo: map['Correo'],
      rol: map['Rol'],
      password: map['Password']
    );
  }
}