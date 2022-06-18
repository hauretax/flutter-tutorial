import 'package:flutter/material.dart';

class Taskcheckbox extends StatelessWidget {
  final bool isChecked;
  final String taskTitle;
  final Function(bool?)? checkboxCallBack;
  final Function()? deletTask;

  Taskcheckbox(
      {Key? key,
      required this.isChecked,
      required this.taskTitle,
      required this.checkboxCallBack,
      required this.deletTask})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: GestureDetector(
        onLongPress: deletTask,
        child: Text(
          taskTitle,
          style: TextStyle(
              decoration: isChecked ? TextDecoration.lineThrough : null),
        ),
      ),
      trailing: Checkbox(
        value: isChecked,
        onChanged: checkboxCallBack,
      ),
    );
  }
}






////////////////old


// class TaskCheckbox extends StatelessWidget {
//   final bool isChecked;
//   final Function(bool?)? toggleCheckbox;

//   const TaskCheckbox({required this.isChecked, required this.toggleCheckbox});

//   @override
//   Widget build(BuildContext context) {
//     return Checkbox(
//       value: isChecked,
//       onChanged: toggleCheckbox,
//     );
//   }
// }
