import 'package:flutter/material.dart';

class ToList extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;


  ToList({
    super.key, 
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25, top: 25),
      child: Container(
        padding: EdgeInsets.all(24),
        child: Row(
          children: [

            //checkbox
           Checkbox(
            value: taskCompleted, 
            onChanged: onChanged
            ),

            //task name
            Text(taskName),
          ],
        ),
        decoration: BoxDecoration(
          color: Colors.purple,
          borderRadius:BorderRadius.circular(12)
          ),
      ),
    );
  }
}