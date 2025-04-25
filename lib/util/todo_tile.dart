import 'package:flutter/material.dart';

class TodoTile extends StatelessWidget {
  final String taskName; //เก็บตัวแปรชื่องาน
  final bool taskCompleted; //เก็บตัวแปรการติ๊ก
  Function(bool?)? onChanged;

  TodoTile({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(25.0, 25.0, 25.0, 0),
      child: Container(
        padding: const EdgeInsets.all(25.0),
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            //check box
            Checkbox(
              value: taskCompleted,
              onChanged: (onChanged),
              activeColor: Colors.black,
            ),
            //task name
            Text(
              taskName,
              style: TextStyle(
                decoration:
                    taskCompleted
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
