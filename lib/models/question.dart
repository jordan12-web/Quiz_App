class Question {
  final String id;
  final String text;
  final List<String> options;
  final int correctAnswer;

  Question({required this.id, required this.text, required this.options, required this.correctAnswer});

Map<String,dynamic> toMap(){
  return{
    'id':id,
    'text':text,
    'options': options,
    'correctAnswer':correctAnswer,

  };
}

factory Question.fromMap(Map<String, dynamic> map){
  return Question(id: map['id'], text: map['text'], options: List<String>.from(map['options']), correctAnswer: map['correctAnswer']);
}

}