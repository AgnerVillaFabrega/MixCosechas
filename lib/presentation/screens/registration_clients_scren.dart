// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mixcosechas_app/model/clientes.dart';
import 'package:mixcosechas_app/theme/limpiarCampos.dart';
import 'package:mixcosechas_app/presentation/widgets/mensaje_show_dialog.dart';
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
  final ServiceFirebase _serviceFirebase = ServiceFirebase();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

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
                  padding:const EdgeInsets.symmetric(horizontal: 30, vertical:8.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _nombreController,
                          keyboardType: TextInputType.name,
                          decoration:const InputDecoration(
                            labelText: 'Nombre',
                            labelStyle: TextStyle(color: Color(0xFF19AA89),fontWeight: FontWeight.w600),
                          ),
                          validator: (String? value){
                            if (value ==null || value.isEmpty) {
                              return "Campo requerido";
                            }
                            return null;
                          }
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          controller: _identificacionController,
                          keyboardType: TextInputType.number,
                          decoration:const InputDecoration(
                            labelText: 'Identificación',
                            labelStyle: TextStyle(color: Color(0xFF19AA89),fontWeight: FontWeight.w600),
                          ),
                          validator: (String? value){
                            if (value ==null || value.isEmpty) {
                              return "Campo requerido";
                            }
                            return null;
                          }
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          controller: _telefonoController,
                          keyboardType: TextInputType.phone,
                          decoration:const InputDecoration(
                            labelText: 'Teléfono',
                            labelStyle: TextStyle(color: Color(0xFF19AA89),fontWeight: FontWeight.w600),
                          ),
                          validator: (String? value){
                            if (value ==null || value.isEmpty) {
                              return "Campo requerido";
                            }
                            return null;
                          }
                        ),
                        const SizedBox(height: 10), 
                        TextFormField(
                          controller: _correoController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            labelText: 'Correo electrónico',
                            labelStyle: TextStyle(color: Color(0xFF19AA89),fontWeight: FontWeight.w600),
                          ),
                          validator: (String? value){
                            if (value ==null || value.isEmpty) {
                              return "Campo requerido";
                            }
                            if (!value.contains('@')) {
                              return "Ingresa un correo valido";
                            }
                            return null;
                          }
                        ),
                        const SizedBox(height: 10),
                        DropdownButtonFormField<String>(
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
                        const SizedBox(height: 10),
                        TextFormField(
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
                          validator: (String? value){
                            if (value ==null || value.isEmpty) {
                              return "Campo requerido";
                            }
                            if (value.length < 6) {
                              return "La contraseña debe contener al menos 6 caracteres";
                            }
                            return null;
                          }
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
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
                          validator: (String? value){
                            if (value ==null || value.isEmpty) {
                              return "Campo requerido";
                            }
                            if (value.length < 6) {
                              return "La contraseña debe contener al menos 6 caracteres";
                            }
                            return null;
                          }
                        ),
                      ],
                    )
                  )
                ),
                const SizedBox(height: 20),
                RegistrarseButtom(onTap: _handleRegistroCliente,),
              ],
            ),
          ),
        ),
      ),
    );
  }
  void _handleRegistroCliente () async {
    if (formKey.currentState!.validate()){
      if (_passwordController.text == _confirmPasswordController.text) {
        try {
          UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: _correoController.text,
            password: _passwordController.text,
          );
          if (userCredential.user != null) {
            Cliente cliente = Cliente(id: _identificacionController.text, 
              nombre: _nombreController.text, 
              telefono: _telefonoController.text, 
              correo: _correoController.text, 
              rol: _rolController.text, 
              password: _passwordController.text
            );
            _serviceFirebase.addPeople(cliente,userCredential);
            showDialog(
              context: context,
              builder: (context) {
                return const MensajeShowDialog(title: "Registro",message: "Se registró el usuario correctamente");
              },
            );
            FormUtils.clearTextControllers([_identificacionController,_nombreController,_telefonoController,_correoController,_rolController,_passwordController,_confirmPasswordController ]);
            FocusScope.of(context).unfocus();
          }
        }on FirebaseException catch (e) {
          if (e.code == 'weak-password') {
            // Contraseña débil
            showDialog(
              context: context,
              builder: (context) {
                return const MensajeShowDialog(title: "!",message: "Contraseña debil");
              },
            );
          } else if (e.code == 'email-already-in-use') {
            // El correo ya está en uso por otro usuario
            showDialog(
              context: context,
              builder: (context) {
                return const MensajeShowDialog(title: "Cuidado!",message: "Parece que ese correo ya es usado por otro usuaio");
              },
            );
          } else {
            // Otro tipo de error
            showDialog(
              context: context,
              builder: (context) {
                return const MensajeShowDialog(title: "Upsss!",message: "Parece que estamos teniendo problemas, intenta registrar luego");
              },
            );
          }
        }
      } else {
        // Los campos de contraseña no coinciden, muestra un mensaje de error
        showDialog(
          context: context,
          builder: (context) {
            return const MensajeShowDialog(title: "Cuidado",message: "Las contraseñas no coinciden. Por favor, verificalo");
          },
        );
      }
    }
  }
}

class RegistrarseButtom extends StatelessWidget {
  const RegistrarseButtom({
    super.key,
    required VoidCallback onTap
  }):_onTap = onTap;


  final VoidCallback _onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: ElevatedButton(
        onPressed:_onTap,
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