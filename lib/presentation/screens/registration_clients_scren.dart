import 'package:flutter/material.dart';
import 'package:mixcosechas_app/model/clientes.dart';
import 'package:mixcosechas_app/theme/limpiarCampos.dart';
import 'package:mixcosechas_app/presentation/widgets/mensaje_showdialog.dart';
import 'package:mixcosechas_app/services/firebase_service.dart';

class RegistrationClientScreen extends StatelessWidget {
  const RegistrationClientScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const RegisterPage();
  }
}

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _isObscurePassword = true;
  bool _isObscureConfirmPassword = true;
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _identificacionController = TextEditingController();
  final TextEditingController _telefonoController = TextEditingController();
  final TextEditingController _correoController = TextEditingController();
  final TextEditingController _rolController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //title: const Text('Registrarte'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[

                //* Texto ilustrativo Opcional
                Container(
                  alignment: const Alignment(-0.8, 0),
                  child: const Text(
                    'Registrarte',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 26,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  alignment: const Alignment(-0.8, 0),
                  child: const Text(
                    'Es rápido y fácil',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0XFF989EB1)
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical:8.0),
                  child: TextField(
                    controller: _nombreController,
                    keyboardType: TextInputType.name,
                    decoration:const InputDecoration(
                      labelText: 'Nombre',
                      labelStyle: TextStyle(color: Color(0xFF19AA89),fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8.0),
                  child: TextField(
                    controller: _identificacionController,
                    keyboardType: TextInputType.number,
                    decoration:const InputDecoration(
                      labelText: 'Identificación',
                      labelStyle: TextStyle(color: Color(0xFF19AA89),fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8.0),
                  child: TextField(
                    controller: _telefonoController,
                    keyboardType: TextInputType.phone,
                    decoration:const InputDecoration(
                      labelText: 'Teléfono',
                      labelStyle: TextStyle(color: Color(0xFF19AA89),fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8.0),
                  child: TextField(
                    controller: _correoController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      labelText: 'Correo electrónico',
                      labelStyle: TextStyle(color: Color(0xFF19AA89),fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8.0),
                  child: DropdownButtonFormField<String>(
                    value: _rolController.text,
                    onChanged: (String? newValue) {
                      setState(() {
                        _rolController.text = newValue!;
                      });
                    },
                    decoration: const InputDecoration(
                      labelText: 'Rol',
                      labelStyle: TextStyle(color: Color(0xFF19AA89),fontWeight: FontWeight.w600),
                    ),
                    items: [
                      const DropdownMenuItem<String>(
                        value: '',
                        child: Text('Seleccione'), // O cualquier otro texto que desees
                      ),
                      ...['Analista', 'Agricultor'].map((role) {
                        return DropdownMenuItem<String>(value: role, child: Text(role));
                      }).toList(),
                    ],
                    validator: (value) {
                      if (value == 'Seleccione') {
                        return 'Por favor, selecciona un rol';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8.0),
                  child: TextField(
                    obscureText: _isObscurePassword,
                    controller: _passwordController,
                    decoration: InputDecoration(
                      labelText: 'Contraseña',
                      labelStyle: const TextStyle(color: Color(0xFF19AA89),fontWeight: FontWeight.w600),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isObscurePassword ? Icons.visibility_off : Icons.visibility,
                        ),
                        onPressed: () {
                          setState(() {
                            _isObscurePassword = !_isObscurePassword;
                          });
                        },
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8.0),
                  child: TextField(
                    obscureText: _isObscureConfirmPassword,
                    controller: _confirmPasswordController,
                    decoration: InputDecoration(
                      labelText: 'Confirmar contraseña',
                      labelStyle: const TextStyle(color: Color(0xFF19AA89),fontWeight: FontWeight.w600),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isObscureConfirmPassword ? Icons.visibility_off : Icons.visibility,
                        ),
                        onPressed: () {
                          setState(() {
                            _isObscureConfirmPassword = !_isObscureConfirmPassword;
                          });
                        },
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                RegistrarseButtom(
                  idController: _identificacionController,
                  nombreController: _nombreController,
                  telefonoController: _telefonoController,
                  correoController: _correoController,
                  rolController: _rolController,
                  passwordController: _passwordController, 
                  confirmPasswordController: _confirmPasswordController
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class RegistrarseButtom extends StatelessWidget {
  
  RegistrarseButtom({
    super.key,
    required TextEditingController idController,
    required TextEditingController nombreController,
    required TextEditingController telefonoController,
    required TextEditingController correoController,
    required TextEditingController rolController,
    required TextEditingController passwordController,
    required TextEditingController confirmPasswordController,
  }) : _identificacionController =idController,
  _nombreController = nombreController,
  _telefonoController =telefonoController,
  _correoController =correoController,
  _rolController =rolController,
  _passwordController = passwordController, 
  _confirmPasswordController = confirmPasswordController;

  final TextEditingController _identificacionController;
  final TextEditingController _nombreController ;
  final TextEditingController _telefonoController ;
  final TextEditingController _correoController ;
  final TextEditingController _rolController ;
  final TextEditingController _passwordController;
  final TextEditingController _confirmPasswordController;
  final ServiceFirebase _serviceFirebase = ServiceFirebase();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: ElevatedButton(
        onPressed: () {
          
          if(_identificacionController.text.isNotEmpty &&
          _nombreController.text.isNotEmpty &&
          _telefonoController.text.isNotEmpty &&
          _correoController.text.isNotEmpty &&
          _rolController.text.isNotEmpty &&
          _passwordController.text.isNotEmpty &&
          _confirmPasswordController.text.isNotEmpty){
            if (_passwordController.text == _confirmPasswordController.text) {
              Cliente cliente = Cliente(id: _identificacionController.text, 
                nombre: _nombreController.text, 
                telefono: _telefonoController.text, 
                correo: _correoController.text, 
                rol: _rolController.text, 
                password: _passwordController.text
              );
              _serviceFirebase.addPeople(cliente);
              showDialog(
                context: context,
                builder: (context) {
                  return const MensajeShowDialog(title: "Tilte",message: "content");
                },
              );
              FormUtils.clearTextControllers([_identificacionController,_nombreController,_telefonoController,_correoController,_rolController,_passwordController,_confirmPasswordController ]);
              FocusScope.of(context).unfocus();
            } else {
              // Los campos de contraseña no coinciden, muestra un mensaje de error
              showDialog(
                context: context,
                builder: (context) {
                  return const MensajeShowDialog(title: "Cuidado",message: "Las contraseñas no coinciden. Por favor, verificalo");
                },
              );
            }
          }else{
          
            showDialog(
              context: context,
              builder: (context) {
                return const MensajeShowDialog(title: "OJO",message: "No puedes dejar campos vacios");
              },
            );
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF19AA89),
          padding: const EdgeInsets.symmetric(horizontal: 0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
        ),
        child: const Text(
          'Registrar',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Color(0XFFeeeeee),
          ),
        ),
      ),
    );
  }
}


