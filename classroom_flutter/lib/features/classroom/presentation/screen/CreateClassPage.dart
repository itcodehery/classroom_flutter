import 'package:classroom_flutter/features/authentication/presentation/providers/auth_notifier.dart';
import 'package:flutter/material.dart';

class CreateClassPage extends StatefulWidget {
  const CreateClassPage({super.key});

  @override
  _CreateClassPageState createState() => _CreateClassPageState();
}

class _CreateClassPageState extends State<CreateClassPage> {
  //create text editing controller for all
  TextEditingController classNameController = TextEditingController();
  TextEditingController sectionController = TextEditingController();
  TextEditingController subjectController = TextEditingController();
  TextEditingController roomController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create class'),
        actions: [
          ElevatedButton(
              style: ButtonStyle(
                  shape: WidgetStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ))),
              onPressed: () {
                // Create class
              },
              child: const Text("Create")),
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.more_vert_outlined)),
        ],
      ),
      body: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            ListTile(
              title: const Text("You're currently signed in as:"),
              subtitle: Text(AuthNotifier().currentUser!.email!,
                  style: const TextStyle(fontWeight: FontWeight.bold)),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text("Class name"),
                  TextField(
                    decoration: const InputDecoration(
                      hintText: "Enter class name",
                    ),
                    focusNode: FocusNode(
                      canRequestFocus: true,
                    ),
                    controller: classNameController,
                  ),
                  const SizedBox(height: 20),
                  const Text("Section"),
                  TextField(
                    decoration: const InputDecoration(
                      hintText: "Enter section",
                    ),
                    controller: sectionController,
                  ),
                  const SizedBox(height: 20),
                  const Text("Subject"),
                  TextField(
                    controller: subjectController,
                    decoration: const InputDecoration(
                      hintText: "Enter subject",
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text("Room"),
                  TextField(
                    controller: roomController,
                    decoration: const InputDecoration(
                      hintText: "Room",
                    ),
                  ),
                ],
              ),
            ),
          ]),
    );
  }
}
