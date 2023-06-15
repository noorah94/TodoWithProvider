import 'package:flutter/material.dart';
import 'package:t2_task_todo/models/TaskModel.dart';

class TasksListProvider with ChangeNotifier {
  List<TaskModel> tasks = [];

  addTask(String name) {
    tasks.add(TaskModel(name));
    notifyListeners();
  }

  setIsFinshed(int index) {
    tasks[index].isFinshed = !tasks[index].isFinshed;
    notifyListeners();
  }
}
