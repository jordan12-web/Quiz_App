import 'package:hive/hive.dart';

part 'question.g.dart';

@HiveType(typeId: 1)
class Question {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String text;
  @HiveField(2)
  final List<String> options;
  @HiveField(3)
  final int correctAnswer;

  Question({
    required this.id,
    required this.text,
    required this.options,
    required this.correctAnswer,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'text': text,
      'options': options,
      'correctAnswer': correctAnswer,
    };
  }

  factory Question.fromMap(Map<String, dynamic> map) {
    return Question(
      id: map['id'],
      text: map['text'],
      options: List<String>.from(map['options']),
      correctAnswer: map['correctAnswer'],
    );
  }
}
