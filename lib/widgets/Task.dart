import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/TasksListModel.dart';

class Task extends StatefulWidget {
  Task({
    super.key,
    required this.index,
  });
  int index;

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  @override
  Widget build(BuildContext context) {
    int index = widget.index;
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.black;
      }
      return Colors.lightBlueAccent;
    }

    return Consumer<TasksListProvider>(
      builder: (context, task, child) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              task.tasks[index].name,
              style: TextStyle(
                  color: Colors.green,
                  decoration: task.tasks[index].isFinshed
                      ? TextDecoration.lineThrough
                      : TextDecoration.none),
            ),
            Checkbox(
              checkColor: Colors.white,
              fillColor: MaterialStateProperty.resolveWith(getColor),
              value: task.tasks[index].isFinshed,
              onChanged: (bool? value) {
                task.setIsFinshed(index);
              },
            )
          ],
        );
      },
    );
  }
}
