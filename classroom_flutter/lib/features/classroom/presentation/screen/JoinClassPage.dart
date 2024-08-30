import 'package:classroom_flutter/core/utils/validators.dart';
import 'package:classroom_flutter/features/authentication/presentation/providers/auth_notifier.dart';
import 'package:classroom_flutter/features/authentication/presentation/providers/auth_provider.dart';
import 'package:classroom_flutter/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class JoinClassPage extends StatefulWidget {
  const JoinClassPage({super.key});

  @override
  State<JoinClassPage> createState() => _JoinClassPageState();
}

class _JoinClassPageState extends State<JoinClassPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Join class'),
        actions: [
          ElevatedButton(
              style: ButtonStyle(
                  shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ))),
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  // Join class
                }
              },
              child: const Text("Join")),
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
            subtitle: Text(
              AuthNotifier().currentUser!.email!,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            trailing: TextButton(
                onPressed: () {
                  AuthNotifier().signOut();
                },
                child: const Text("Switch Account")),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                    "Ask your teacher for the class code, then enter it here."),
                const SizedBox(height: 10),
                Form(
                  key: formKey,
                  child: TextFormField(
                    onFieldSubmitted: (value) {
                      if (value.isNotEmpty) {}
                    },
                    controller: controller,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please enter a class code";
                      }
                      if (!Validators().isValidClassCode(value)) {
                        return "Invalid class code. A class code is usually 6 characters long";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      hintText: "Enter class code",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
