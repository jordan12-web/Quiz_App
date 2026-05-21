import 'package:flutter/material.dart';
import 'package:quizapp/constants/routes.dart';
import 'package:quizapp/models/category.dart';
import 'package:quizapp/models/data_store.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dashboard')),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blueGrey),
              child: Text(
                'EthioQuiz Menu',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            SizedBox(height: 16),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Dashboard'),
              onTap: () {
                Navigator.pushReplacementNamed(context, Dashboardroute);
              },
            ),
            ListTile(
              leading: Icon(Icons.admin_panel_settings),
              title: Text('Admin'),
              onTap: () {
                Navigator.pushReplacementNamed(context, Adminroute);
              },
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final Category category = categories[index];
          return Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              title: Text(
                category.title,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(category.description),
              onTap: () {
                Navigator.pushNamed(context, Quizroute, arguments: category);
              },
            ),
          );
        },
      ),
    );
  }
}
