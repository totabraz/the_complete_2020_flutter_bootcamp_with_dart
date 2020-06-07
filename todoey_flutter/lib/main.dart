import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:todoeyflutter/model/task_data.dart';
import 'package:todoeyflutter/screens/tasks_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskData(),
      child: MaterialApp(
        home: TasksScreen(),
      ),
    );
  }
}
