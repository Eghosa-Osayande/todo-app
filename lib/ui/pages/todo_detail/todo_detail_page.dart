import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/blocs/tasks_list/task_list_bloc.dart';
import 'package:todo/repositories/todo/models/task_model.dart';
import 'package:todo/ui/pages/todo_detail/components/todo_detail_body.dart';
import 'package:todo/ui/pages/todo_list/components/todo_list_body.dart';
import 'package:todo/ui/widgets/close_keyboard.dart';

class TodoDetailPage extends StatelessWidget {
 

  TodoDetailPage({ Key? key, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  CloseKeyboard(child: TodoDetailBody());
  }
}