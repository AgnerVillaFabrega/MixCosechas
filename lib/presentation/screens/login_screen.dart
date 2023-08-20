import 'package:flutter/material.dart';
import 'package:mixcosechas_app/presentation/screens/home_sceen.dart';
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
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 45),
                  child: TextField(
                    keyboardType: TextInputType.emailAddress,
                    style: TextStyle(
                      color: Color(0XFF35424A)
                    ),
                    decoration: InputDecoration(
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
                const _IniciarSesionButtom(),
      
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
  const _IniciarSesionButtom();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 45),
      child: ElevatedButton(
        onPressed: () {
          //ToDo Acción cuando se presiona el botón de inicio de sesión
          Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
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
