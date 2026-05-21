import 'package:flutter/material.dart';
import 'package:quizapp/constants/routes.dart';
import 'package:quizapp/models/category.dart';
import 'package:quizapp/models/question.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key}) : super();

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  late Category category;
  int currentIndex = 0;
  int score = 0;
  int? selectedIndex;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    category = ModalRoute.of(context)!.settings.arguments as Category;
  }

  void _answerQuestion(int index) {
    //  final category = ModalRoute.of(context)!.settings.arguments as Category;
    selectedIndex = index;
    final Question currentQuestion = category.questions[currentIndex];
    if (selectedIndex == currentQuestion.correctAnswer) {
      score++;
    }

    Future.delayed(Duration(seconds: 3), () {
      if (currentIndex < category.questions.length - 1) {
        setState(() {
          currentIndex++;
          selectedIndex = null;
        });
      } else {
        Navigator.pushReplacementNamed(
          context,
          Resultroute,
          arguments: {'score': score, 'total': category.questions.length},
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    //  final category = ModalRoute.of(context)!.settings.arguments as Category;
    final currentQuestion = category.questions[currentIndex];
    return Scaffold(
      appBar: AppBar(title: Text(category.title)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            LinearProgressIndicator(
              value: (currentIndex + 1) / category.questions.length,
            ),
            SizedBox(height: 20),

            Text(
              "Question ${currentIndex + 1}/${category.questions.length}",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(currentQuestion.text, style: TextStyle(fontSize: 20)),
            SizedBox(height: 20),
            ...currentQuestion.options.asMap().entries.map((entry) {
              final idx = entry.key;
              final option = entry.value;
              final isSelected = selectedIndex == idx;
              final isCorrect = currentQuestion.correctAnswer == idx;
              Color? color;
              if (selectedIndex != null) {
                if (isSelected && isCorrect) {
                  color = Colors.green;
                } else if (isSelected && !isCorrect) {
                  color = Colors.red;
                }
              }

              return Container(
                margin: EdgeInsets.symmetric(vertical: 5),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: color),
                  onPressed:selectedIndex == null ? () => _answerQuestion(idx):null,
                  child: Text(option),
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
