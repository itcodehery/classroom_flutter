import 'package:flutter/material.dart';

class AboutClassPage extends StatelessWidget {
  const AboutClassPage(
      {super.key, required this.id, required this.name, required this.teacher});

  final String id;
  final String name;
  final String teacher;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('About')),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            title: const Text(
              "Class ID",
              style: TextStyle(color: Colors.purple),
            ),
            subtitle: Text(id),
          ),
          ListTile(
            title: const Text(
              "Class Name",
              style: TextStyle(color: Colors.purple),
            ),
            subtitle: Text(name),
          ),
          ListTile(
            title: const Text(
              "Lecturer",
              style: TextStyle(color: Colors.purple),
            ),
            subtitle: Text(teacher),
          ),
        ],
      ),
    );
  }
}
