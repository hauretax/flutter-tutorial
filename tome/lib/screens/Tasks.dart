import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:tome/models/task.dart';
import 'package:tome/screens/add_task.dart';
import '../models/task_data.dart';
import '../widgets/TasksList.dart';

class Tasks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (BuildContext context) => SingleChildScrollView(
                child: Container(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: add_task(),
            )),
          )
        },
        child: const Icon(Icons.add),
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 60, left: 30, right: 30, bottom: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 30,
                  child: Icon(
                    color: Colors.black,
                    Icons.list,
                    size: 30,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text('ToMe',
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    )),
                Text(
                  '${Provider.of<TaskData>(context).taskCount} tasks',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
              ),
              child: TasksList(),
            ),
          )
        ],
      ),
    );
  }
}
