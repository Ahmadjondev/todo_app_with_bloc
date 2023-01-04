import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/screens/edit_task_screen.dart';

import '../blocs/bloc_exports.dart';
import '../models/task.dart';
import 'popup_menu.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    Key? key,
    required this.task,
  }) : super(key: key);

  final Task task;
  void _removeOrDeleteTask(BuildContext context, Task task) {
    task.isDeleted!
        ? context.read<TasksBloc>().add(DeleteTask(task: task))
        : context.read<TasksBloc>().add(RemoveTask(task: task));
  }

  void editTasks(context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: EditTaskScreen(
              oldTask: task,
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                task.isFavorite == false
                    ? const Icon(Icons.star_outline)
                    : Icon(Icons.star),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        task.title,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 18,
                          decoration:
                              task.isDone! ? TextDecoration.lineThrough : null,
                        ),
                      ),
                      Text(
                        DateFormat().add_yMMMd().add_Hms().format(
                              DateTime.parse(task.date),
                            ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Checkbox(
                onChanged: !task.isDeleted!
                    ? (value) {
                        context.read<TasksBloc>().add(UpdateTask(task: task));
                      }
                    : null,
                value: task.isDone,
              ),
              PopupMenu(
                task: task,
                cancelOrDeleteCallback: () =>
                    _removeOrDeleteTask(context, task),
                likeOrDislikeCallback: () => context
                    .read<TasksBloc>()
                    .add(MarkFavoriteOrUnfavoriteTask(task: task)),
                editCallback: () {
                  Navigator.pop(context);
                  editTasks(context);
                },
                restoreCallback: () =>
                    context.read<TasksBloc>().add(RestoreTask(task: task)),
              )
            ],
          ),
        ],
      ),
    );
  }
}
 