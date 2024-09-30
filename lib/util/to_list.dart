import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToList extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? delateFuncion;


  ToList({
    super.key, 
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
    required this.delateFuncion,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25, top: 25),
      child: Slidable (
        endActionPane: ActionPane(
          motion: StretchMotion(), children: [
            SlidableAction(
              onPressed: delateFuncion,
              icon: Icons.delete,
              backgroundColor: Colors.black,
              )
          ]
          ),
        child: Container(
          padding: EdgeInsets.all(24),
          child: Row(
            children: [
        
              //checkbox
             Checkbox(
              value: taskCompleted, 
              onChanged: onChanged,
              activeColor: Colors.black,
              ),
        
              //task name
              Text(
                taskName,
                style: TextStyle(
                  color: Colors.blue,
                  decoration: taskCompleted
                  ? TextDecoration.lineThrough :
                  TextDecoration.none,
                )
                ),
            ],
          ),
          decoration: BoxDecoration(
            color: Colors.purple,
            borderRadius:BorderRadius.circular(12)
            ),
        ),
      ),
    );
  }
}