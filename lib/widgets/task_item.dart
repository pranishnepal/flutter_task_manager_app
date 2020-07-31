import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/classes/task_list_provider.dart';

class TaskItem extends StatelessWidget {
  final bool checkMark;
  final String task;
  final DateTime date;
  final Function toggleCheckMark;
  final int idxToDelete;

  TaskItem({
    this.checkMark,
    this.task,
    this.date,
    this.toggleCheckMark,
    this.idxToDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      background: Container(
        color: Colors.red,
      ),
      key: Key(task + task),
      onDismissed: (direction) {
        Provider.of<Data>(context, listen: false)
            .deleteItemSwipped(idxToDelete);
        Scaffold.of(context).showSnackBar(SnackBar(
          content: Text("Task removed"),
          backgroundColor: Colors.red,
        ));
      },
      child: ListTile(
        title: Text(
          task,
          style: GoogleFonts.ptSerif(
            fontWeight: FontWeight.bold,
            decorationColor: Color(0xff5786FF),
            decoration: checkMark ? TextDecoration.lineThrough : null,
            decorationThickness: 3,
            fontSize: 20,
          ),
        ),
        subtitle: Text(
          (date == null)
              ? DateFormat.yMMMMEEEEd().format(DateTime.now())
              : DateFormat.yMMMMEEEEd().format(date),
          style: GoogleFonts.notoSerif(
            fontSize: 15,
          ),
        ),
        trailing: Checkbox(
          value: checkMark,
          activeColor: Colors.green,
          onChanged: toggleCheckMark,
        ),
      ),
    );
  }
}
