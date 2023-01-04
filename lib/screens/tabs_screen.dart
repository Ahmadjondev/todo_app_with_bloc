import 'package:flutter/material.dart';
import 'package:todo_app/screens/completed_task_screen.dart';
import 'package:todo_app/screens/favorite_task_screen.dart';
import 'package:todo_app/screens/task_drawer.dart';
import 'package:todo_app/screens/pending_screen.dart';

import 'add_task_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});
  static const id = 'tabs_screen';

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String, dynamic>> pageDetails = [
    {'pageName': const PendingScreen(), 'title': 'Pending Tasks'},
    {'pageName': const CompletedTasksScreen(), 'title': 'Completed Tasks'},
    {'pageName': const FavoriteTasksScreen(), 'title': 'Favorite Tasks'},
  ];

  var selectedPageIndex = 0;

  void addTasks(context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: AddTaskScreen(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pageDetails[selectedPageIndex]['title']),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add),
          )
        ],
      ),
      drawer: const TaskDrawer(),
      body: pageDetails[selectedPageIndex]['pageName'],
      floatingActionButton: selectedPageIndex == 0
          ? FloatingActionButton(
              onPressed: () {
                addTasks(context);
              },
              tooltip: 'Add Task',
              child: const Icon(Icons.add),
            )
          : null,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedPageIndex,
        onTap: (value) {
          setState(() {
            selectedPageIndex = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.incomplete_circle_sharp),
              label: 'Pending Tasks'),
          BottomNavigationBarItem(
              icon: Icon(Icons.done), label: 'Completed Tasks'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Favorite Tasks'),
        ],
      ),
    );
  }
}
