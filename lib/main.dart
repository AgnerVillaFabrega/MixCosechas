import 'package:flutter/material.dart';
import 'package:mixcosechas_app/presentation/screens/login_screen.dart';
import 'package:mixcosechas_app/theme/app_theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MixCosechas App',
      debugShowCheckedModeBanner: false,
      theme:AppTheme().theme(),
      home:const LoginScreen(),
    );
  }
}