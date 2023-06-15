import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:provider/provider.dart';
import '../providers/TasksListModel.dart';
import 'Task.dart';

class Tasks extends StatefulWidget {
  const Tasks({super.key});

  @override
  State<Tasks> createState() => _TasksState();
}

class _TasksState extends State<Tasks> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30),
      height: MediaQuery.of(context).size.height * 0.65,
      width: MediaQuery.of(context).size.width,
      //color: Colors.white,
      decoration: BoxDecoration(
        color: Colors.white,
        //border: Border.all(),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Consumer<TasksListProvider>(
        builder: (context, task, child) {
          return ListView(
            children: task.tasks
                .mapIndexed((index, element) => Task(
                      index: index,
                    ))
                .toList(),
          );
        },
      ),
    );
  }
}
