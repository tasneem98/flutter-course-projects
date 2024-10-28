class TasksModel {
  bool? isDone;
  String? taskName;

  TasksModel({this.isDone = false, this.taskName});

  taskToggle() => isDone = !isDone!;
}
