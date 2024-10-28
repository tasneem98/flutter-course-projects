import 'package:flutter/material.dart';
import 'package:todoey/widgets/task_tile.dart';

import '/models/tasks_model.dart';

class TasksList extends StatefulWidget {
  const TasksList({
    super.key,
    required this.tasks,
  });

  final List<TasksModel> tasks;

  @override
  State<TasksList> createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 30, left: 30, right: 30),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
      ),
      child: widget.tasks.isEmpty
          ? const Center(
              child: Text('Add new Task'),
            )
          : ListView.builder(
              itemCount: widget.tasks.length,
              itemBuilder: (_, index) => TaskTile(
                task: widget.tasks[index],
                taskIsDone: (val) {
                  setState(() {
                    TasksModel.taskToggle(widget.tasks[index]);
                  });
                },
              ),
            ),
    );
  }
}
