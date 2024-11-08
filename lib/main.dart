import 'package:flutter/material.dart';
import 'package:mixcosechas_app/presentation/provider/ClienteProvider.dart';
import 'package:mixcosechas_app/presentation/screens/login_screen.dart';
import 'package:mixcosechas_app/theme/app_theme.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ClienteProvider>(create: (_)=>ClienteProvider())
      ],
      builder: (context,_) {
        return MaterialApp(
          title: 'MixCosechas App',
          debugShowCheckedModeBanner: false,
          theme: AppTheme().theme(),
          home: const LoginScreen(),
        );
      }
    );
  }
}
