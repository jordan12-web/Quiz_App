import 'package:hive/hive.dart';
import 'package:quizapp/models/question.dart';

part 'category.g.dart';
@HiveType(typeId: 0)
class Category {
  @HiveField(0)
  final String id;
   @HiveField(1)
final String title;
 @HiveField(2)
final String description;
 @HiveField(3)
final String accent;
 @HiveField(4)
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