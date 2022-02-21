import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/blocs/tasks_list/task_list_bloc.dart';
import 'package:todo/repositories/todo/models/task_model.dart';
import 'package:todo/repositories/todo/todo_repository.dart';
import 'package:todo/ui/pages/todo_list/components/todo_list_body.dart';

class TaskItemTile extends StatelessWidget {

  final TaskModel task;
  final int index;

  const TaskItemTile({Key? key,required this.task, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(children:  [
        Text('${task.title}'),
        SizedBox(width: 20,),
        SizedBox(width: 10,)
      ],)
    );
  }
}

