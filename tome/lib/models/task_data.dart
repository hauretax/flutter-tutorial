import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:tome/models/task.dart';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [
    Task(name: 'name'),
    Task(name: 'name'),
    Task(name: 'name'),
    Task(name: 'name'),
  ];

  int get taskCount {
    return _tasks.length;
  }

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  void addTask(String newTasktitle) {
    final task = Task(name: newTasktitle);
    _tasks.add(task);
    notifyListeners();
  }

  void updateTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  void deletTask(Task task) {
    _tasks.removeWhere((element) => element.name == task.name);
    notifyListeners();
  }
}
