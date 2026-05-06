import 'package:quizapp/models/category.dart';
import 'package:quizapp/models/question.dart';

final sampleCategories = [
  Category(id: '1', title: 'EDP', description: 'Test ur event driven programming skills', accent: 'blue', questions: [
    Question(id: 'q1', text: 'What is the language used mainly for EDP?', options: ['Java', 'Python', 'C++', 'Dart'], correctAnswer: 2,),
    Question(id: 'q2', text: 'What is the data type usually used to display text?', options: ['String', 'int', 'Float', 'Double'], correctAnswer: 0)
  
  
  ]),
   Category(
    id: '2',
    title: 'Math',
    description: 'Challenge your math skills',
    accent: 'green',
    questions: [
      Question(
        id: 'q3',
        text: 'What is 12 × 8?',
        options: ['96', '88', '108', '100'],
        correctAnswer: 0,
      ),
    ],
  ),

];