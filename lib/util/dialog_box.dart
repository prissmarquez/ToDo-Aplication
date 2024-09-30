import 'package:flutter/material.dart';
import 'package:flutter_basic/util/my_buttons.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;
  
  DialogBox({
    super.key,
    required this.controller,
    required this.onCancel,
    required this.onSave
    });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      content: Container(
        height: 125,
     
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
          //get a user imput 
          TextField(
            controller: controller,
            decoration:
            InputDecoration(
              border:OutlineInputBorder(),
              hintText: "Add a new task"
              ),
          ),

          //buttons -> save + cancel 
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              //save
              MyButton(text: "Save", onPressed: onSave),
              SizedBox(width: 4,),
              //cancel
              MyButton(text: "Cancel", onPressed: onCancel)
              
            ],
          )
        ],)
      ),
    );

  }
}