import 'package:flutter/material.dart';
import 'package:quizapp/screens/admin_screen.dart';
import 'package:quizapp/screens/dashboard_screen.dart';
import 'package:quizapp/screens/login_screen.dart';
import 'package:quizapp/screens/quiz_screen.dart';
import 'package:quizapp/screens/result_screen.dart';
import 'package:quizapp/screens/splash_screen.dart';
import 'package:quizapp/constants/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      theme: ThemeData.light(),
      initialRoute: Splashroute,
      routes: {
        Splashroute: (context) => SplashScreen(),
        Loginroute: (context) => LoginScreen(),
        Dashboardroute: (context) => DashboardScreen(),
        Quizroute: (context) => QuizScreen(),
        Adminroute: (context) => AdminScreen(),
        Resultroute: (context) => ResultScreen(),
      },
    );
  }
}
