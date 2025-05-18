import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lapanganku/app/presentation/answer_screen.dart';

import 'package:lapanganku/app/presentation/login_screen.dart';
import 'package:lapanganku/app/presentation/register_screen.dart';
import 'package:lapanganku/app/presentation/splash_screen.dart';
import 'package:hive/hive.dart';
import 'package:lapanganku/app/presentation/task_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('user');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/signin': (context) => const LoginScreen(),
        '/signup': (context) => const RegisterScreen(),
        '/taskscreen': (context) => const TaskScreen(),
        '/answerscreen': (context) => const AnswerScreen(),
      },
    );
  }
}
