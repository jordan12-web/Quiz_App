import 'package:flutter/material.dart';
import 'package:quizapp/models/category.dart';
import 'package:quizapp/models/data_store.dart';
import 'package:quizapp/models/question.dart';
import 'package:uuid/uuid.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _questionController = TextEditingController();
  final TextEditingController _option1Controller = TextEditingController();
  final TextEditingController _option2Controller = TextEditingController();
  final TextEditingController _option3Controller = TextEditingController();
  final TextEditingController _option4Controller = TextEditingController();
  final TextEditingController _correctAnswerController =
      TextEditingController();
  final Uuid uuid = Uuid();
  Category? selectedCategory;
  // @override
  // void initState() {
  //   super.initState();
  //   _titleController = TextEditingController();
  //   _descriptionController = TextEditingController();
  // }

  // @override
  // void dispose() {
  //   _titleController.dispose();
  //   _descriptionController.dispose();
  //   super.dispose();
  // }

  void _addCategory() {
    final title = _titleController.text;
    final description = _descriptionController.text;

    if (title.isEmpty || description.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fill all the required fields')),
      );
      return;
    }
    setState(() {
      categories.add(
        Category(
          id: uuid.v4(),
          title: title,
          description: description,
          accent: '',
          questions: [],
        ),
      );
    });

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('Category $title added!')));

    _titleController.clear();
    _descriptionController.clear();
  }

  void _addQuestion() {
    if (selectedCategory == null) return;

    final text = _questionController.text;
    final option1 = _option1Controller.text;
    final option2 = _option2Controller.text;
    final option3 = _option3Controller.text;
    final option4 = _option4Controller.text;
    final correctIndex = int.tryParse(_correctAnswerController.text);

    if (text.isEmpty ||
        option1.isEmpty ||
        option2.isEmpty ||
        option3.isEmpty ||
        option4.isEmpty ||
        correctIndex == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fill all the required fields')),
      );
      return;
    }

    setState(() {
      selectedCategory!.questions.add(
        Question(
          id: uuid.v4(),
          text: text,
          options: [option1, option2, option3, option4],
          correctAnswer: correctIndex!,
        ),
      );
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          "Questions Added to '${selectedCategory!.title}' Succesfully",
        ),
      ),
    );

    _questionController.clear();
    _option1Controller.clear();
    _option3Controller.clear();
    _option4Controller.clear();
    _option2Controller.clear();
    _correctAnswerController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Admin Page')),
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            //Add category
            Text(
              'Add Category',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            TextField(
              controller: _titleController,
              decoration: InputDecoration(hintText: 'title'),
            ),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(hintText: 'description'),
            ),
            SizedBox(height: 10),

            ElevatedButton(
              onPressed: _addCategory,
              child: const Text('Add category'),
            ),
            Divider(height: 30),

            //Add questions
            Text(
              'Add Question',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            DropdownButton<Category>(
              hint: const Text('Select Category'),
              value: selectedCategory,
              items: categories.map((cat) {
                return DropdownMenuItem<Category>(
                  value: cat,
                  child: Text(cat.title),
                );
              }).toList(),
              onChanged: (Category? newValue) {
                setState(() {
                  selectedCategory = newValue;
                });
              },
            ),

            TextField(
              controller: _questionController,
              decoration: InputDecoration(hintText: 'Question'),
            ),
            TextField(
              controller: _option1Controller,
              decoration: InputDecoration(hintText: 'Option 1'),
            ),
            TextField(
              controller: _option2Controller,
              decoration: InputDecoration(hintText: 'Option 2'),
            ),
            TextField(
              controller: _option3Controller,
              decoration: InputDecoration(hintText: 'Option 3'),
            ),
            TextField(
              controller: _option4Controller,
              decoration: InputDecoration(hintText: 'Option 4'),
            ),
            TextField(
              controller: _correctAnswerController,
              decoration: InputDecoration(
                hintText: 'Correct Anawer Index(0 - 3)',
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _addQuestion,
              child: const Text('Add Question'),
            ),
          ],
        ),
      ),
    );
  }
}
