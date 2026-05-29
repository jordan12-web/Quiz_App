import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:quizapp/models/category.dart';
import 'package:quizapp/models/question.dart';
import 'package:quizapp/screens/admin_screen.dart';
import 'package:quizapp/screens/dashboard_screen.dart';
import 'package:quizapp/screens/login_screen.dart';
import 'package:quizapp/screens/quiz_screen.dart';
import 'package:quizapp/screens/result_screen.dart';
import 'package:quizapp/screens/splash_screen.dart';
import 'package:quizapp/constants/routes.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(CategoryAdapter());
  Hive.registerAdapter(QuestionAdapter());
  await Hive.openBox<Category>('categories');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.grey[100],
        textTheme: ThemeData.light().textTheme.copyWith(
          bodyMedium: TextStyle(fontSize: 16, color: Colors.black87),
          titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
            textStyle: TextStyle(fontSize: 16),
          ),
        ),
      ),

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
