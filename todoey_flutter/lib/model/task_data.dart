import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:todoeyflutter/model/task_model.dart';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [];

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(this._tasks);
  }

  int get taskCount {
    return this._tasks.length;
  }

  void addTask(String task) {
    this._tasks.add(new Task(name: task));
    print("---------- add task");
    notifyListeners();
  }

  void updateTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  void deleteTask(Task task) {
    this._tasks.remove(task);
    notifyListeners();
  }
}
