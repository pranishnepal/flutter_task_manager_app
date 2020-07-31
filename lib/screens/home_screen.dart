import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/classes/task_list_provider.dart';
import 'package:todo_app/screens/new_task.dart';
import 'package:todo_app/widgets/task_list.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff5786FF),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 80, left: 30, right: 30, bottom: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.assignment,
                    color: Color(0xff5786FF),
                    size: 35,
                  ),
                  radius: 30,
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "All Tasks",
                  style: GoogleFonts.robotoSlab(
                    color: Colors.white,
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "${Provider.of<Data>(context).taskList.length} tasks",
                  style: GoogleFonts.playfairDisplay(
                    color: Colors.white,
                    fontSize: 22,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                color: Colors.white,
              ),
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                child: TasksList(),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          /* show modalbottomsheet and add items */
          showModalBottomSheet(
              context: context,
              builder: (context) {
                return NewTask();
              });
        },
        backgroundColor: Color(0xff5786FF),
        child: Icon(
          Icons.add,
          size: 30,
        ),
      ),
    );
  }
}
