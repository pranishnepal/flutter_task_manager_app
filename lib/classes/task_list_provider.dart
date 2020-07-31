import 'package:flutter/cupertino.dart';
import 'package:todo_app/classes/tasks.dart';

class Data extends ChangeNotifier {
  List<Task> taskList = [
    new Task(
        date: DateTime.now(),
        taskName: "Take Fido for a walk",
        isChecked: false),
    new Task(
      date: DateTime.now(),
      taskName: "Watch United",
      isChecked: true,
    ),
    new Task(
      date: DateTime.now(),
      taskName: "Update Fantasy Team",
      isChecked: false,
    ),
  ];

  void addToList(String taskName, DateTime taskDate, bool isDone) {
    taskList.add(new Task(
      taskName: taskName,
      date: taskDate,
      isChecked: isDone,
    ));
    notifyListeners();
  }

  void toggleCheckMark(int idx) {
    taskList[idx].toggleIsChecked();
    notifyListeners();
  }

  void deleteItemSwipped(int idx) {
    taskList.removeAt(idx);
    notifyListeners();
  }
}
