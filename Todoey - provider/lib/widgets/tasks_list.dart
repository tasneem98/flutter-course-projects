import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/models/tasks_data.dart';
import '/widgets/task_tile.dart';

class TasksList extends StatelessWidget {
  const TasksList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TasksData>(
      builder: (context, provider, child) {
        return Container(
          padding: const EdgeInsets.only(top: 30, left: 30, right: 30),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
          ),
          child: ListView.builder(
              itemCount: provider.tasks.length,
              itemBuilder: (_, index) => Card(
                    child: TaskTile(
                      task: provider.tasks[index],
                      taskIsDone: (val) =>
                          provider.updateTask(provider.tasks[index]),
                      deleteTask: () =>
                          provider.deleteTask(provider.tasks[index]),
                    ),
                  )),
        );
      },
    );
  }
}
