import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/blocs/tasks_list/task_list_bloc.dart';
import 'package:todo/repositories/todo/models/task_model.dart';
import 'package:todo/repositories/todo/todo_repository.dart';
import 'package:todo/ui/pages/todo_list/components/checkboxes.dart';
import 'package:todo/ui/pages/todo_list/components/todo_list_body.dart';

class TaskItemTile extends StatelessWidget {
  final TaskModel task;
  final int index;

  const TaskItemTile({Key? key, required this.task, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var borderColor = task.isCompleted
        ? Color.fromRGBO(0, 145, 32, 1)
        : Color.fromRGBO(237, 178, 0, 1);
    var bgColor = task.isCompleted
        ? Color.fromRGBO(238, 255, 244, 1)
        : Color.fromRGBO(255, 249, 231, 1);
    var textColor = borderColor;
    String tagText = task.isCompleted ? task.title.substring(0, 1) : '$index';
    return Container(
        margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
        child: Row(
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: bgColor,
                border: Border.all(
                  width: 1,
                  color: borderColor,
                ),
              ),
              child: Center(
                child: Text(
                  tagText,
                  style: TextStyle(color: textColor),
                ),
              ),
            ),
            SizedBox(width: 14,),
            Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('data'),
                Text('data'),
              ],
            )),
            SizedBox(width: 14,),
            CheckBoxGood(),
          ],
        ));
  }
}
