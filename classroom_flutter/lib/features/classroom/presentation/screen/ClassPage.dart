import 'package:classroom_flutter/features/classroom/data/repository/classroom_repository.dart';
import 'package:classroom_flutter/features/classroom/presentation/screen/AboutClassPage.dart';
import 'package:flutter/material.dart';

class ClassPage extends StatelessWidget {
  final String classId;

  const ClassPage({super.key, required this.classId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => AboutClassPage(
                            id: classId,
                            name: ClassroomRepository.teachersTemporary[classId]
                                ['name']!,
                            teacher: ClassroomRepository
                                .teachersTemporary[classId]['teacher']!,
                          )));
                },
                icon: const Icon(Icons.info_outline))
          ],
        ),
        body: Column(
          children: [
            Container(
              width: double.infinity,
              height: 160,
              margin: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                image: DecorationImage(
                  image: AssetImage('assets/classroom.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                        ClassroomRepository.teachersTemporary[classId]['name']!,
                        style:
                            const TextStyle(fontSize: 24, color: Colors.white)),
                    Text(
                        ClassroomRepository.teachersTemporary[classId]
                            ['teacher']!,
                        style: const TextStyle(
                            fontSize: 16, color: Colors.white70)),
                  ],
                ),
              ),
            ),
            const Padding(
                padding: EdgeInsets.all(8.0),
                child: Card(
                  child: ListTile(
                    leading: Icon(Icons.announcement),
                    title: TextField(
                      decoration: InputDecoration(
                          hintText: 'Announce something to your class',
                          border: InputBorder.none),
                    ),
                  ),
                )),
            const SizedBox(
              height: 400,
              child: Center(
                child: ListTile(
                  title: Text(
                    "This is where you will see updates for this class",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ),
                  subtitle: Text(
                      "Use the stream to connect with your class and check for announcements",
                      textAlign: TextAlign.center),
                ),
              ),
            )
          ],
        ));
  }
}
