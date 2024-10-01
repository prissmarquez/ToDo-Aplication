import 'package:flutter/material.dart';
import 'package:flutter_basic/datas/database.dart';
import 'package:flutter_basic/util/dialog_box.dart';
import 'package:flutter_basic/util/to_list.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  //reference the hive box 
  final _myBox = Hive.box("mybox");
  // List toDoList = [];
  ToDoDataBase db = ToDoDataBase();

  //text controller
  final _controller = TextEditingController ();

  // //list of todo task
  // List toDoList = [
  //   ["Make tutorial", false ],
  //   ["Do exercise", false ]
  // ];



@override
  void initState() {

    // if this is the first time ever opening the app, then create a default data
    if (_myBox.get("TODOLIST") == null) {
      db.createInitialData();
    }
    else {
      //already exist data
      db.loadata();
    }

    // TODO: implement initState
    super.initState();
  }

  //checkbox was tapped
  void checkboxChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index] [1] = !db.toDoList [index] [1];
  });
  db.updateDatabase();
  }

  //save a new task 
  void saveNewTask (){
    setState(() {
      db.toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateDatabase();
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
    db.toDoList.removeAt(index);
  });
  db.updateDatabase();
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
        itemCount: db.toDoList.length,
        itemBuilder:(context, index) {
        return ToList (
            taskName : db.toDoList[index] [0],
            taskCompleted : db.toDoList [index] [1],
            onChanged : (value) => checkboxChanged(value, index),
            delateFuncion:(context) => deleteTask (index) ,
          );

        },
      ),
    );
}
}