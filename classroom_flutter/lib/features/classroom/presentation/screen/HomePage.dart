import 'package:classroom_flutter/core/constants/app_colors.dart';
import 'package:classroom_flutter/core/widgets/ClassListItem.dart';
import 'package:classroom_flutter/features/authentication/presentation/providers/auth_provider.dart';
import 'package:classroom_flutter/features/classroom/data/repository/classroom_repository.dart';
import 'package:classroom_flutter/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            showDragHandle: true,
            isDismissible: true,
            builder: (c) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    title: const Text("Join Class"),
                    onTap: () {
                      context.push('/join');
                    },
                  ),
                  ListTile(
                    title: const Text("Create Class"),
                    onTap: () {},
                  )
                ],
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text('Classroom'),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
        elevation: 0,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
                image: DecorationImage(
                  image: AssetImage('assets/classroom.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Text(
                'Classroom',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
            ListTile(
              title: const Text('Home'),
              onTap: () {
                // navigate to home
              },
            ),
            ListTile(
              title: const Text('Profile'),
              onTap: () {
                // navigate to profile
              },
            ),
            ListTile(
              title: const Text('Settings'),
              onTap: () {
                // navigate to settings
              },
            ),
            ListTile(
              title: const Text('Logout'),
              onTap: () async {
                // navigate to logout
                await ref.read(authProvider.notifier).signOut();
              },
            ),
          ],
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            // child: Column(
            //   mainAxisSize: MainAxisSize.min,
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   children: [
            //     Text(
            //       "Morning, Hery!",
            //       style: TextStyle(fontSize: 20),
            //     ),
            //     Text(
            //       "No pending work this week",
            //     ),
            //     SizedBox(
            //       height: 16,
            //     )
            //   ],
            // ),
            child: ListTile(
              title: const Text(
                "Morning, Hery!",
                style: TextStyle(fontSize: 20),
              ),
              subtitle: const Text("No pending work this week"),
              trailing: TextButton(
                  onPressed: () {}, child: const Text("View To-do List")),
            ),
          ),
          for (var i in ClassroomRepository.teachersTemporary.keys)
            ClassListItem(
              className: ClassroomRepository.teachersTemporary[i]!['name'],
              classTeacher:
                  ClassroomRepository.teachersTemporary[i]!['teacher'],
              id: i,
            )
        ],
      ),
    );
  }
}
