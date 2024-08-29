import 'package:classroom_flutter/features/classroom/data/repository/classroom_repository.dart';
import 'package:flutter/material.dart';

class ClassPeoplePage extends StatelessWidget {
  const ClassPeoplePage({super.key, required this.classId});

  final String classId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(ClassroomRepository.teachersTemporary[classId]['name']),
      ),
      body: ListView(children: [
        ListTile(
          title: Text(
            "Teachers",
            style: TextStyle(color: Theme.of(context).primaryColor),
          ),
        ),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: 2,
          itemBuilder: (c, i) {
            return ListTile(
              title: Text("Teacher $i"),
              subtitle: Text("teacher$i@caias.in"),
              trailing: const Icon(Icons.message_outlined),
              leading: const CircleAvatar(
                child: Text('T'),
              ),
            );
          },
        ),
        ListTile(
          title: Text(
            "Students",
            style: TextStyle(color: Theme.of(context).primaryColor),
          ),
        ),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: 49,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('Student $index'),
              leading: const CircleAvatar(
                child: Text('S'),
              ),
              trailing: const Icon(Icons.message_outlined),
            );
          },
        ),
      ]),
    );
  }
}
