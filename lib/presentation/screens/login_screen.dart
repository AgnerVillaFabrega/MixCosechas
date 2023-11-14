// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mixcosechas_app/presentation/provider/ClienteProvider.dart';
import 'package:mixcosechas_app/presentation/screens/home_sceen.dart';
import 'package:mixcosechas_app/presentation/widgets/messages/quickalert_msg.dart';
import 'package:provider/provider.dart';
import 'package:quickalert/quickalert.dart';
import '../../model/clientes.dart';
import '../../theme/limpiarCampos.dart';
import 'registration_clients_scren.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isObscure = true;
  final TextEditingController _correoController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/images/_MIXCOSECHAS.png',
                width: 410,
                height: 170,
              ),
              const SizedBox(height: 40),
              Container(
                alignment: const Alignment(-0.6, 0),
                child: const Text(
                  'Iniciar Sesión',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 26,
                  ),
                ),
              ),
              Container(
                alignment: const Alignment(-0.48, 0),
                child: const Text(
                  'Hola, qué gusto volver a verte!',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0XFF989EB1),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 45),
                child: Form(
                  key: formKey,
                  child:Column(
                    children: [
                      TextFormField(
                        controller: _correoController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          labelText: 'Correo electrónico',
                          //contentPadding: EdgeInsets.only(bottom: 1),
                          labelStyle: TextStyle(color: Color(0xFF19AA89), fontWeight: FontWeight.w600),
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
                      TextFormField(
                        controller: _passwordController,
                        obscureText: _isObscure,
                        decoration: InputDecoration(
                          labelText: 'Contraseña',
                          //contentPadding: const EdgeInsets.only(bottom:1),
                          labelStyle: const TextStyle(color: Color(0xFF19AA89), fontWeight: FontWeight.w600),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                _isObscure = !_isObscure;
                              });
                            },
                            icon: Icon(_isObscure ? Icons.visibility : Icons.visibility_off),
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
              const SizedBox(height: 30),
              _IniciarSesionButtom(isLoading: _isLoading, onTap: _handleLogin),
              const SizedBox(height: 10),
              const _RegistrarseTextButtom(),
            ],
          ),
        ),
      ),
    );
  }

  void _handleLogin() async {
    if (formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
      try {
        UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _correoController.text,
          password: _passwordController.text,
        );
        if (userCredential.user != null) {
          String uid = userCredential.user!.uid;
          DocumentSnapshot userDoc = await FirebaseFirestore.instance.collection('Usuarios').doc(uid).get();

          Cliente cliente = Cliente(
            id: userDoc['Id'],
            nombre: userDoc['Nombre'],
            telefono: userDoc['Telefono'],
            correo: userDoc['Correo'],
            rol: userDoc['Rol'],
            password: userDoc['Password'],
          );
          context.read<ClienteProvider>().setCli(cli: cliente);
          FormUtils.clearTextControllers([_correoController, _passwordController]);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const HomeScreen()),
          );
        }
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          QuickAlertDialog.showAlert(context, QuickAlertType.error,"El usuario no está registrado");
        } else if (e.code == 'wrong-password') {
          QuickAlertDialog.showAlert(context, QuickAlertType.error,"Contraseña incorrecta");
        } else {
          QuickAlertDialog.showAlert(context, QuickAlertType.error,"Parece que estamos teniendo problemas, intentalo luego");
        }
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }
}

class _IniciarSesionButtom extends StatelessWidget {
  const _IniciarSesionButtom({
    required bool isLoading,
    required VoidCallback onTap,
  })  : _isLoading = isLoading,
        _onTap = onTap;

  final bool _isLoading;
  final VoidCallback _onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 45),
      child: ElevatedButton(
        onPressed: _isLoading ? null : _onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF19AA89),
          padding: const EdgeInsets.symmetric(horizontal: 0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
        ),
        child: Container(
          height: 50,
          alignment: Alignment.center,
          child: _isLoading
              ? const CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF19AA89)),
                )
              : const Text(
                  'Iniciar Sesión',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Color(0XFFeeeeee),
                  ),
                ),
        ),
      ),
    );
  }
}

class _RegistrarseTextButtom extends StatelessWidget {
  const _RegistrarseTextButtom();

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const RegistrationClientScreen()),
        );
      },
      child: const Text('Aun no estas registrado? Registrarse', style: TextStyle(color: Color(0XFF19AA89), fontWeight: FontWeight.w600)),
    );
  }
}