import 'package:flutter/cupertino.dart';

class Task extends ChangeNotifier {
  String name;
  bool isDone;

  Task({required this.name, this.isDone = false});

  void toggleDone() {
    isDone = !isDone;
    notifyListeners();
  }

  void changeName(String newname) {
    name = newname;
    notifyListeners();
  }
}
