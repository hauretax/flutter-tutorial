import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tome/models/task.dart';
import 'package:tome/screens/Tasks.dart';

import '../models/task_data.dart';
import 'TaskTile.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final task = taskData.tasks[index];
            return Taskcheckbox(
                isChecked: task.isDone,
                taskTitle: task.name,
                checkboxCallBack: (q) {
                  taskData.updateTask(task);
                },
                deletTask: () {
                  taskData.deletTask(task);
                });
          },
          itemCount: taskData.taskCount,
        );
      },
    );
  }
}
