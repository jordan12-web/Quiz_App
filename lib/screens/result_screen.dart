import 'package:flutter/material.dart';
import 'package:quizapp/constants/routes.dart';
import 'package:quizapp/models/category.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

String _getMessage(double percentage){
if(percentage == 100) return "Perfect!";
if(percentage >= 80) return "Great job!";
if(percentage >= 50) return "Not bad, keep practicing";
return "Don't give up, let's go again";


}


  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final int score = args['score'];
    final int total = args['total'];
    final Category category = args['category'];
    return Scaffold(
      appBar: AppBar(title: Text('Result')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "You scored $score out of $total",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, Dashboardroute);
              },
              child: Text('Back to Dashboard'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Retry Quiz"),
            ),

           ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(
                    context,
                    '/quiz',
                    arguments: category,
                  );
                },
                child: Text("Retry Quiz"),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/dashboard');
                },
                child: Text("Back to Dashboard"),
              ),
          ],
        ),
      ),
    );
  }
}
