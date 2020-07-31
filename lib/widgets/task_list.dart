import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/classes/task_list_provider.dart';

import 'package:todo_app/widgets/task_item.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<Data>(
      builder: (BuildContext context, Data provider, Widget child) {
        return ListView.builder(
          itemCount: provider.taskList.length,
          itemBuilder: (context, index) {
            final listItem = provider.taskList[index];
            return TaskItem(
              checkMark: listItem.isChecked,
              date: listItem.date,
              task: listItem.taskName,
              idxToDelete: index,
              toggleCheckMark: (bool currValue) {
                provider.toggleCheckMark(index);
              },
            );
          },
        );
      },
    );
  }
}
