import 'package:flutter/material.dart';
import 'package:todoey/models/tasks_model.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({super.key, required this.task, required this.taskIsDone});

  final TasksModel task;
  final Function taskIsDone;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
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
      ),
    );
  }
}
