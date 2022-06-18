import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:tome/models/task.dart';
import 'package:tome/models/task_data.dart';

class add_task extends StatelessWidget {
  add_task({Key? key}) : super(key: key);

  String TaskTitle = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20),
              topLeft: Radius.circular(20),
            )),
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Text(
            'Add Task',
            style: TextStyle(color: Colors.lightBlueAccent, fontSize: 30),
            textAlign: TextAlign.center,
          ),
          TextField(
            autofocus: true,
            textAlign: TextAlign.center,
            onChanged: (text) {
              TaskTitle = text;
            },
          ),
          SizedBox(
            height: 20,
          ),
          TextButton(
            onPressed: () {
              Provider.of<TaskData>(context, listen: false).addTask(TaskTitle);
              Navigator.pop(context);
            },
            child: Text(
              'Add',
              style: TextStyle(color: Colors.white),
            ),
            style:
                TextButton.styleFrom(backgroundColor: Colors.lightBlueAccent),
          ),
        ]),
      ),
    );
  }
}
