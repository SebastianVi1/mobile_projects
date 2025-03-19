import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do/custom_widgets.dart';
import 'package:to_do/task_model.dart';
import 'package:to_do/task_viewmodel.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<TaskViewModel>(context);
    var taskList = provider.taskList;
    return Scaffold(
      appBar: AppBar(
        title: Text('liste'),
      ),
      body: SafeArea(
        
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  for (Task task in taskList)
                  WListTaskCard(task: task),
                ],
              ),
            ),
            WAddTaskButton(),
          ],
        ),
      ),
    );
  }
}