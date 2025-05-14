import 'package:flutter/material.dart';

import 'package:lapanganku/app/presentation/login_screen.dart';
import 'package:lapanganku/app/presentation/splash_screen.dart';

void main() {
  runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/sign in': (context) => LoginScreen(),
      },
    );
  }
}
