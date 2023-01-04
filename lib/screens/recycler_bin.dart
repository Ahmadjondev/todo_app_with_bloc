import 'package:flutter/material.dart';
import 'package:todo_app/screens/task_drawer.dart';

import '../blocs/bloc_exports.dart';
import '../widgets/tasks_list.dart';

class RecyclerBin extends StatelessWidget {
  const RecyclerBin({super.key});
  static const id = 'recycler_bin_screen';
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        return Scaffold(
          drawer: const TaskDrawer(),
          appBar: AppBar(
            title: const Text('Recycler Bin'),
            actions: [
              PopupMenuButton(
                itemBuilder: (context) => [
                  PopupMenuItem(
                    child: TextButton.icon(
                      onPressed: null,
                      icon: Icon(Icons.delete_forever),
                      label: Text("Delete All Tasks"),
                    ),
                    onTap: () {
                      context.read<TasksBloc>().add(DeleteAllTasks());
                    },
                  ),
                ],
              )
            ],
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Chip(
                  label: Text(
                    '${state.removedTasks.length} Tasks',
                  ),
                ),
              ),
              TaskList(
                taskList: state.removedTasks,
              ),
            ],
          ),
        );
      },
    );
  }
}
