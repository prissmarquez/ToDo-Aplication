import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase {

  List toDoList = [];

  //refence box
  final _myBox = Hive.box ("mybox");

  //run this method if is the first time ever openening this app
  void createInitialData() {
    toDoList = [
      ["Make tutorial" , false],
      ["Do exercise" , false],
    ];
  }

  //load the data from datebase
  void loadata () {
    toDoList = _myBox.get("TODOLIST");
  }

  //update the database
  void updateDatabase() {
    _myBox.put("TODOLIST", toDoList);
  }
}