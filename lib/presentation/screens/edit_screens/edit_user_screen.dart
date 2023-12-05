import 'package:flutter/material.dart';
import 'package:mixcosechas_app/model/clientes.dart';
import 'package:mixcosechas_app/presentation/provider/ClienteProvider.dart';
import 'package:mixcosechas_app/presentation/widgets/messages/quickalert_msg.dart';
import 'package:mixcosechas_app/services/firebase_service.dart';
import 'package:provider/provider.dart';
import 'package:quickalert/quickalert.dart';

class EditarClienteScreen extends StatelessWidget {
  final Cliente cliente;
  const EditarClienteScreen({Key? key, required this.cliente}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EditarClientePage(cliente: cliente);
  }
}

class EditarClientePage extends StatefulWidget {
  final Cliente cliente;
  const EditarClientePage({Key? key, required this.cliente}) : super(key: key);

  @override
  _EditarClientePageState createState() => _EditarClientePageState();
}

class _EditarClientePageState extends State<EditarClientePage> {
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _identificacionController = TextEditingController();
  final TextEditingController _telefonoController = TextEditingController();
  final TextEditingController _correoController = TextEditingController();
  final TextEditingController _rolController = TextEditingController();
  final ServiceFirebase _serviceFirebase = ServiceFirebase();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    // Llenar los controladores con los datos del cliente al editar
    _nombreController.text = widget.cliente.nombre;
    _identificacionController.text = widget.cliente.id;
    _telefonoController.text = widget.cliente.telefono;
    _correoController.text = widget.cliente.correo;
    _rolController.text = widget.cliente.rol;
  }

  @override
  Widget build(BuildContext context) {
    ClienteProvider watch =  context.watch<ClienteProvider>();
    bool test = _isRolEnabled(watch);
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  alignment: const Alignment(-0.8, 0),
                  child: const Text(
                    'Editar Cliente',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 26,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _nombreController,
                          keyboardType: TextInputType.name,
                          decoration: const InputDecoration(
                            labelText: 'Nombre',
                            labelStyle: TextStyle(color: Color(0xFF19AA89), fontWeight: FontWeight.w600),
                          ),
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return "Campo requerido";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          controller: _identificacionController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: 'Identificación',
                            labelStyle: TextStyle(color: Color(0xFF19AA89), fontWeight: FontWeight.w600),
                          ),
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return "Campo requerido";
                            }
                            return null;
                          },
                          enabled: _isIdentificacionEnabled(),
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          controller: _telefonoController,
                          keyboardType: TextInputType.phone,
                          decoration: const InputDecoration(
                            labelText: 'Teléfono',
                            labelStyle: TextStyle(color: Color(0xFF19AA89), fontWeight: FontWeight.w600),
                          ),
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return "Campo requerido";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          controller: _correoController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            labelText: 'Correo electrónico',
                            labelStyle: TextStyle(color: Color(0xFF19AA89), fontWeight: FontWeight.w600),
                          ),
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return "Campo requerido";
                            }
                            if (!value.contains('@')) {
                              return "Ingresa un correo válido";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 10),
                        
                        DropdownButtonFormField<String>(
                          value: test ?  widget.cliente.rol : _rolController.text,
                          onChanged:test
                              ? null
                              : (String? newValue) {
                                  setState(() {
                                    _rolController.text = newValue!;
                                  });
                                },
                          decoration: const InputDecoration(
                            labelText: 'Rol',
                            labelStyle: TextStyle(
                              color: Color(0xFF19AA89),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          items: [
                            if (!test)
                              const DropdownMenuItem<String>(
                                value: '',
                                child: Text('Seleccione'),
                              ),
                            ...['Analista', 'Agricultor', 'Admin'].map((role) {
                              return DropdownMenuItem<String>(
                                  value: role, child: Text(role));
                            }).toList(),
                          ],
                          validator: (value) {
                            if (value == null || value.isEmpty || value == 'Seleccione') {
                              return 'Por favor, selecciona un rol';
                            }
                            return null;
                          },
                          onTap: () {
                            if (test) {
                              FocusScope.of(context).unfocus();
                            }
                          },
                          isExpanded: true, // Para asegurarse de que el DropdownButtonFormField tiene suficiente espacio para mostrar todos los elementos
                          icon: test ? null : const Icon(Icons.arrow_drop_down),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _handleEditarCliente,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF19AA89),
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  child: const Text(
                    'Guardar Cambios',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Color(0XFFeeeeee),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool _isIdentificacionEnabled() {
    return false; // Cambia esto según tu lógica
  }

  bool _isRolEnabled(ClienteProvider watch) {
    if (watch.cliente.rol == 'Admin') {
      return false;
    }
    return true;
  }

  void _handleEditarCliente() async {
    if (formKey.currentState!.validate()) {
      // Crear un nuevo objeto Cliente con los nuevos datos
      Cliente updatedCliente = Cliente(
        id: _identificacionController.text,
        nombre: _nombreController.text,
        telefono: _telefonoController.text,
        correo: _correoController.text,
        rol: _rolController.text,
        password: widget.cliente.password, // Conservar la contraseña existente
      );
      try {
        // Actualizar el cliente en la base de datos
        await _serviceFirebase.updatePeople(updatedCliente);

        // Navegar de regreso a la pantalla de detalles o lista de clientes
        Navigator.pop(context);
      } catch (e) {
        // Manejar errores
        QuickAlertDialog.showAlert(context, QuickAlertType.error, "Error al actualizar los datos");
        print("Error al actualizar los datos del cliente: $e");
      }
    }
  }
}
