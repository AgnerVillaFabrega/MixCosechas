// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mixcosechas_app/presentation/screens/home_sceen.dart';
import '../widgets/mensaje_show_dialog.dart';
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
  // ignore: library_private_types_in_public_api
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isObscure = true;
  final TextEditingController _correoController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0XFFFFFFFF),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'assets/images/MIXCOSECHAS3.png',
                  width: 290,
                  height: 170,
                ),
                const SizedBox(height: 20),
                Container(
                  alignment: const Alignment(-0.6, 0),
                  child: const Text(
                    'Iniciar Sesión',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 26,
                      //color: Color(0XFF35424A)
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  alignment: const Alignment(-0.48, 0),
                  child: const Text(
                    'Hola, qué gusto volver a verte!',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0XFF989EB1)
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 45),
                  child: TextField(
                    controller: _correoController,
                    keyboardType: TextInputType.emailAddress,
                    style: const TextStyle(
                      color: Color(0XFF35424A)
                    ),
                    decoration: const InputDecoration(
                      labelText: 'Correo electronico',
                      contentPadding: EdgeInsets.all(12),
                      labelStyle:TextStyle(color: Color(0xFF19AA89),fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 45),
                  child: TextField(
                    controller: _passwordController,
                    obscureText: _isObscure,
                    decoration: InputDecoration(
                      labelText: 'Contraseña',
                      contentPadding: const EdgeInsets.all(12),
                      labelStyle: const TextStyle(color: Color(0xFF19AA89),fontWeight: FontWeight.w600),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _isObscure = !_isObscure;
                          });
                        },
                        icon: Icon(_isObscure ? Icons.visibility : Icons.visibility_off),
                      ),
                    ),
                  ),
                ),
      
                const SizedBox(height: 20),
                _IniciarSesionButtom(correoController: _correoController, passwordController: _passwordController),
      
                const SizedBox(height: 10),
                const _RegistrarseTextButtom(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _IniciarSesionButtom extends StatelessWidget {
  const _IniciarSesionButtom({
    required TextEditingController correoController,
    required TextEditingController passwordController,
  }) :
  _correoController =correoController,
  _passwordController = passwordController;

  final TextEditingController _correoController ;
  final TextEditingController _passwordController;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 45),
      child: ElevatedButton(
        onPressed: () async{

          if (!_correoController.text.contains('@')) {
            showDialog(
              context: context,
              builder: (context) {
                return const MensajeShowDialog(title: "Login",message: "Correo electronico no valido");
              },
            );
          } else if (_passwordController.text.length < 6) {
            showDialog(
              context: context,
              builder: (context) {
                return const MensajeShowDialog(title: "Login",message: "La contrseña debe contener al menos 6 caracteres");
              },
            );
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()),
            );
          } else {
            try {
              UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                email: _correoController.text,
                password: _passwordController.text,
              );
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomeScreen()),
              );
            } on FirebaseAuthException catch (e) {
              if (e.code == 'user-not-found') {
                // El usuario no está registrado
                showDialog(
                  context: context,
                  builder: (context) {
                    return const MensajeShowDialog(title: "Error al iniciar sesion ",message: "El usuario no esta registrado");
                  },
                );
              } else if (e.code == 'wrong-password') {
                // Contraseña incorrecta
                showDialog(
                  context: context,
                  builder: (context) {
                    return const MensajeShowDialog(title: "Error al iniciar sesion ",message: "Contraseña incorrecta");
                  },
                );
              } else {
                // Otro tipo de error
                showDialog(
                  context: context,
                  builder: (context) {
                    return const MensajeShowDialog(title: "Upss!",message: "Parece que estamos teniendo problemas, intentalo mas tarde");
                  },
                );
              }
            }
          }
        },
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
          child: const Text(
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
        // Navegar a la pantalla de registro
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const RegistrationClientScreen()),
        );
      },
      child: const Text('Aun no estas registrado? Registrarse', style: TextStyle(color: Color(0XFF19AA89), fontWeight: FontWeight.w600),),
    );
  }
}
