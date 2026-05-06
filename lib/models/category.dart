
import 'package:quizapp/models/question.dart';

class Category {
  final String id;
final String title;
final String description;
final String accent;
final List<Question> questions;

  Category({required this.id, required this.title, required this.description, required this.accent, required this.questions});

Map<String,dynamic> toMap(){
  return{
    'id': id,
    'title': title,
    'description':description,
    'accent':accent,
    'questions':questions.map((q)=> q.toMap()).toList(),
  };
  
}

factory Category.fromMap(Map<String, dynamic> map){
  return Category(id: map['id'], title: map['title'], description: map['description'], accent: map['accent'], questions: List<Question>.from(map['questions'].map((q)=> Question.fromMap(q))));
}
}