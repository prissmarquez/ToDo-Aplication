import 'package:flutter/material.dart';
import 'package:flutter_basic/util/dialog_box.dart';
import 'package:flutter_basic/util/to_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //text controller
  final _controller = TextEditingController ();
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

  //save a new task 
  void saveNewTask (){
    setState(() {
      toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
  }

  //create new task 
  void createNewTask (){
    showDialog(
      context: context, 
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave:saveNewTask ,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  //delate task
  void deleteTask (int index){ 
    setState(() {
    toDoList.removeAt(index);
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
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(Icons.add),
        ),
      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder:(context, index) {
        return ToList (
            taskName : toDoList[index] [0],
            taskCompleted : toDoList [index] [1],
            onChanged : (value) => checkboxChanged(value, index),
            delateFuncion:(context) => deleteTask (index) ,
          );

        },
      ),
    );
}
}