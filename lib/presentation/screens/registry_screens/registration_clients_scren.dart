// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mixcosechas_app/model/clientes.dart';
import 'package:mixcosechas_app/presentation/widgets/messages/quickalert_msg.dart';
import 'package:mixcosechas_app/theme/limpiarCampos.dart';
import 'package:mixcosechas_app/services/firebase_service.dart';
import 'package:quickalert/quickalert.dart';

class RegistrationClientScreen extends StatelessWidget {
  final bool isFirstTime;
  const RegistrationClientScreen({super.key, required this.isFirstTime});

  @override
  Widget build(BuildContext context) {
    return RegisterPage(isFirstTime: isFirstTime);
  }
}

class RegisterPage extends StatefulWidget {
  final bool isFirstTime;
  const RegisterPage({super.key, required this.isFirstTime});
  
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
                            if (value.length >10 || value.length < 8) {
                              return "Identificacion no valida";
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
                            if (value.length != 10 ) {
                              return "Numero telefonico no valida";
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
                          value: widget.isFirstTime ? 'Agricultor' : _rolController.text,
                          onChanged: widget.isFirstTime
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
                            if (!widget.isFirstTime)
                              const DropdownMenuItem<String>(
                                value: '',
                                child: Text('Seleccione'),
                              ),
                            ...['Analista', 'Agricultor', 'Admin'].map((role) {
                              return DropdownMenuItem<String>(
                                value: role,
                                child: Text(role),
                              );
                            }).toList(),
                          ],
                          validator: (value) {
                            if (value == null || value.isEmpty || value == 'Seleccione') {
                              return 'Por favor, selecciona un rol';
                            }
                            return null;
                          },
                          onTap: () {
                            if (widget.isFirstTime) {
                              FocusScope.of(context).unfocus();
                            }
                          },
                          isExpanded: true,
                          icon: widget.isFirstTime ? null : const Icon(Icons.arrow_drop_down),
                          // Desactivar interactividad cuando isFirstTime es true
                          disabledHint: widget.isFirstTime ? const Text('Agricultor') : null,
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
          if(widget.isFirstTime) _rolController.text = "Agricultor";
          if (userCredential.user != null) {
            Cliente cliente = Cliente(id: _identificacionController.text, 
              nombre: _nombreController.text, 
              telefono: _telefonoController.text, 
              correo: _correoController.text, 
              rol: _rolController.text, 
              password: _passwordController.text
            );
            _serviceFirebase.addPeople(cliente,userCredential);

            QuickAlertDialog.showAlert(context, QuickAlertType.success,"Se registró el usuario correctamente");

            FormUtils.clearTextControllers([_identificacionController,_nombreController,_telefonoController,_correoController,_rolController,_passwordController,_confirmPasswordController ]);
            FocusScope.of(context).unfocus();
          }
        }on FirebaseException catch (e) {
          if (e.code == 'weak-password') {
            // Contraseña débil
            QuickAlertDialog.showAlert(context, QuickAlertType.warning,"Contraseña debil, intenta con una mejor contraseña");
            
          } else if (e.code == 'email-already-in-use') {
            // El correo ya está en uso por otro usuario
            QuickAlertDialog.showAlert(context, QuickAlertType.error,"Parece que ese correo ya esta en uso");
            
          } else {
            // Otro tipo de error
            QuickAlertDialog.showAlert(context, QuickAlertType.error,"Parece que estamos teniendo problemas, intenta registrar luego");
            
          }
        }
      } else {
        // Los campos de contraseña no coinciden, muestra un mensaje de error
        QuickAlertDialog.showAlert(context, QuickAlertType.warning,"Las contraseñas no coinciden. Por favor, verificalo");
      }
    }
  }
}

class RegistrarseButtom extends StatelessWidget {
  
  final VoidCallback _onTap;

  const RegistrarseButtom({
    super.key,
    required VoidCallback onTap
  }):_onTap = onTap;

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