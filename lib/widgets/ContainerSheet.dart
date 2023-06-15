import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/TasksListModel.dart';

class ContainerSheet extends StatefulWidget {
  const ContainerSheet({super.key});

  @override
  State<ContainerSheet> createState() => _ContainerSheetState();
}

class _ContainerSheetState extends State<ContainerSheet> {
  String name = "";
  String error = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.only(top: 40),
      height: MediaQuery.of(context).size.height * 0.55,
      width: MediaQuery.of(context).size.width,
      child: Consumer<TasksListProvider>(builder: (context, task, child) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Add Task',
              style: TextStyle(
                  color: Colors.lightBlueAccent,
                  fontSize: MediaQuery.of(context).size.width * .05),
            ),
            TextField(
              textAlign: TextAlign.center,
              onChanged: (value) {
                name = value;
              },
            ),
            Text(
              error,
              style: TextStyle(color: Colors.red),
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightBlueAccent,
                  minimumSize: Size.fromHeight(
                      MediaQuery.of(context).size.height * 0.05),
                ),
                child: const Text('Add'),
                onPressed: () {
                  if (name == "")
                    setState(() {
                      error = "Empty task";
                    });
                  else {
                    task.addTask(name);
                    Navigator.pop(context);
                  }
                }),
          ],
        );
      }),
    );
  }
}
