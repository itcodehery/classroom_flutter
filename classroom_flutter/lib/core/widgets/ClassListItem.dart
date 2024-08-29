import 'dart:math';

import 'package:classroom_flutter/core/constants/app_colors.dart';
import 'package:classroom_flutter/features/classroom/presentation/screen/ClassPage.dart';
import 'package:classroom_flutter/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ClassListItem extends StatelessWidget {
  const ClassListItem(
      {super.key,
      required this.className,
      required this.classTeacher,
      required this.id});

  final String className;
  final String classTeacher;
  final String id;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // navigate to class details
        // context.go('/home/class/$id');
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ClassPage(
                  classId: id,
                )));
      },
      child: Container(
        margin: const EdgeInsets.fromLTRB(8, 0, 8, 8),
        height: 120,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          image: const DecorationImage(
            image: AssetImage('assets/classroom.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(4.0, 4.0, 4.0, 4),
          child: Center(
            child: ListTile(
              title: Text(className,
                  maxLines: 1,
                  overflow: TextOverflow.fade,
                  style: const TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                      fontWeight: FontWeight.bold)),
              subtitle: Text(classTeacher,
                  style: const TextStyle(color: Colors.white70)),
              trailing: const Icon(Icons.chevron_right, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
