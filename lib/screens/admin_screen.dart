import 'package:flutter/material.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
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

    if (title.isNotEmpty && description.isNotEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Category $title added!')));

      _titleController.clear();
      _descriptionController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Admin Page')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(hintText: 'title'),
            ),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(hintText: 'description'),
            ),
            SizedBox(height: 20),

            ElevatedButton(
              onPressed: _addCategory,
              child: const Text('Add category'),
            ),
          ],
        ),
      ),
    );
  }
}
