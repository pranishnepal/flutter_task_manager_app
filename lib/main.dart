import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/classes/task_list_provider.dart';
import 'package:todo_app/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Data>(
      create: (context) {
        return Data();
      },
      child: MaterialApp(
        home: HomeScreen(),
      ),
    );
  }
}
