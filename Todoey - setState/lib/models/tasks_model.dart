class TasksModel {
  bool? isDone;
  String? taskName;

  TasksModel({this.isDone = false, this.taskName});

  static taskToggle(TasksModel task) => task.isDone = !task.isDone!;
}
