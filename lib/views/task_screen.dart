import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/task_viewmodel.dart';

class TaskScreen extends StatelessWidget {
  final TextEditingController _taskController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final taskViewModel = Provider.of<TaskViewModel>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Task Management')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _taskController,
                    decoration: const InputDecoration(hintText: 'Enter a Task'),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    if (_taskController.text.isNotEmpty) {
                      taskViewModel.addTask(_taskController.text);
                      _taskController.clear();
                    }
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: taskViewModel.tasks.length,
              itemBuilder: (context, index) {
                final task = taskViewModel.tasks[index];
                return ListTile(
                  title: Text(task),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      taskViewModel.removeTask(task);
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
