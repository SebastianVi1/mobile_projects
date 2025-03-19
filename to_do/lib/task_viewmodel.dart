import 'package:flutter/material.dart';
import 'package:to_do/task_model.dart';

class TaskViewModel extends ChangeNotifier {
  List<Task> taskList = [
    Task('Eat', 'Make some eggs')
  ];

  void addTask(Task task){
    taskList.add(task);
    notifyListeners();

  }

  void completeTask(Task task){
    task.isCompleted = !task.isCompleted;
    notifyListeners();
  }

  void removeTask(Task task){
    if (taskList.contains(task)){
      taskList.remove(task);
    }
    notifyListeners(); 

  }

  void editTask(Task task, String newTitle){
    task.name = newTitle;
    notifyListeners();
  }

  void editDestcription(Task task, String newDesc){
    task.description = newDesc;
    notifyListeners();
  }
}