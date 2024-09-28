import 'package:flutter/material.dart';
import 'package:flutter_basic/util/to_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  //list of todo task
  List toDoList = [
    ["Make tutorial", false ],
    ["Do exercise", false ]
  ];
  //checkbox was tapped
  void checkboxChanged(bool? value, int index) {
    setState(() {
      toDoList[index] [1] = !toDoList [index] [1];
  });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 161, 91, 215),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 123, 15, 159),
        title: Text("TO DO "),
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder:(context, index) {
        return ToList (
            taskName : toDoList[index] [0],
            taskCompleted : toDoList [index] [1],
            onChanged : (value) => checkboxChanged(value, index),
          );

        },
      ),
    );
}
}