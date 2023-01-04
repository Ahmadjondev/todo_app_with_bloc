import 'package:flutter/material.dart';
import 'package:todo_app/services/guid_gen.dart';

import '../blocs/bloc_exports.dart';
import '../models/task.dart';

class EditTaskScreen extends StatelessWidget {
  final Task oldTask;
  EditTaskScreen({
    Key? key,
    required this.oldTask,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController =
        TextEditingController(text: oldTask.title);
    TextEditingController descController =
        TextEditingController(text: oldTask.description);
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const Text(
            "Add Task",
            style: TextStyle(
              fontSize: 24,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: TextField(
              autofocus: true,
              controller: titleController,
              decoration: const InputDecoration(
                  label: Text("Title"), border: OutlineInputBorder()),
            ),
          ),
          TextField(
            autofocus: true,
            controller: descController,
            decoration: const InputDecoration(
                label: Text("Description"), border: OutlineInputBorder()),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("Cancel")),
              ElevatedButton(
                onPressed: () {
                  var editedTask = Task(
                      title: titleController.text.trim(),
                      description: descController.text.trim(),
                      id: oldTask.id,
                      isDone: false,
                      isFavorite: oldTask.isFavorite,
                      date: DateTime.now().toString());
                  context
                      .read<TasksBloc>()
                      .add(EditTask(newTask: editedTask, oldTask: oldTask));
                  Navigator.pop(context);
                },
                child: const Text("Add"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
