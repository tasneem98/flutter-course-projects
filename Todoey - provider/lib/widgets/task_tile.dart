import 'package:flutter/material.dart';

import '/models/tasks_model.dart';

class TaskTile extends StatelessWidget {
  const TaskTile(
      {super.key,
      required this.task,
      required this.taskIsDone,
      required this.deleteTask});

  final TasksModel task;
  final Function taskIsDone;
  final Function deleteTask;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        task.taskName.toString(),
        style: TextStyle(
            color: Colors.black,
            decorationColor: Colors.deepPurpleAccent,
            decoration: task.isDone!
                ? TextDecoration.lineThrough
                : TextDecoration.none),
      ),
      trailing: Checkbox(
        value: task.isDone,
        onChanged: (val) => taskIsDone(val),
      ),
      onLongPress: () => deleteTask(),
    );
  }
}
