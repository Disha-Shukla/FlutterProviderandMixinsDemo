import 'package:flutter/material.dart';
import 'package:my_weather_app/models/task_model.dart';
import 'package:my_weather_app/utils/helper_mixins.dart';

class TaskProvider with ChangeNotifier, LoggerMixin, DateFormatterMixin {
  final List<Task> _tasks = [];

  List<Task> get tasks => List.unmodifiable(_tasks);

  void addTask(String title, DateTime dueDate) {
    _tasks.add(Task(title: title, dueDate: dueDate));
    log("Task added: $title with due date ${formatDate(dueDate)}");
    notifyListeners();
  }

  void toggleTaskCompletion(int index) {
    _tasks[index].isCompleted = !_tasks[index].isCompleted;
    log("Task ${_tasks[index].title} marked as ${_tasks[index].isCompleted ? 'completed' : 'incomplete'}");
    notifyListeners();
  }
}
