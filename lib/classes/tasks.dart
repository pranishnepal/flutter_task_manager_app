import 'package:flutter/material.dart';

class Task {
  String taskName;
  DateTime date;
  bool isChecked;

  Task({@required this.taskName, @required this.date, this.isChecked});

  void toggleIsChecked() {
    isChecked = !isChecked;
  }
}
