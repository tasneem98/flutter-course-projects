import 'dart:collection';

import 'package:flutter/foundation.dart';

import '/models/tasks_model.dart';

class TasksData extends ChangeNotifier {
  final List<TasksModel> _tasks = [
    TasksModel(taskName: 'This is a Demo Task, You Can delete it any time'),
  ];

  int get tasksLength => _tasks.length;

  UnmodifiableListView<TasksModel> get tasks => UnmodifiableListView(_tasks);

  addTask(String taskName) {
    _tasks.add(TasksModel(taskName: taskName));
    notifyListeners();
  }

  updateTask(TasksModel task) {
    task.taskToggle();
    notifyListeners();
  }

  deleteTask(TasksModel task) {
    _tasks.remove(task);
    notifyListeners();
  }
}
