import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/classes/task_list_provider.dart';
import 'package:todo_app/constants.dart';

class NewTask extends StatefulWidget {
  @override
  _NewTaskState createState() => _NewTaskState();
}

class _NewTaskState extends State<NewTask> {
  String taskName;
  DateTime chosenDate = DateTime.now();
  TextEditingController controller = new TextEditingController();

  void _showCalendar() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2120),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        chosenDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 30,
        ),
        decoration: kBottomSheetDecoration,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                top: 10,
                bottom: 10,
              ),
              child: Center(
                child: Text(
                  "New Task",
                  style: GoogleFonts.merriweather(
                    fontSize: 35,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            TextField(
              controller: controller,
              decoration: kTaskTextFieldDecoration,
              onChanged: (value) {
                taskName = value;
              },
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              children: <Widget>[
                GestureDetector(
                  child: Icon(
                    Icons.event,
                    color: Color(0xff5786FF),
                  ),
                  onTap: _showCalendar,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  DateFormat.yMMMMEEEEd().format(chosenDate),
                  style: GoogleFonts.lora(
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                RaisedButton(
                  color: Color(0xff5786FF),
                  child: Text(
                    "Add Task!",
                    style: GoogleFonts.lora(
                      color: Colors.white,
                      fontSize: 17,
                    ),
                  ),
                  onPressed: () {
                    controller.clear();
                    /* unfocus */
                    FocusScope.of(context).unfocus();
                    Provider.of<Data>(context, listen: false).addToList(
                      taskName,
                      chosenDate,
                      false,
                    );
                    Navigator.pop(context);
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
