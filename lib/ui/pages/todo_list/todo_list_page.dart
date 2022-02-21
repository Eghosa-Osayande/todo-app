import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/blocs/tasks_list/task_list_bloc.dart';
import 'package:todo/repositories/todo/todo_repository.dart';
import 'package:todo/ui/pages/todo_list/components/todo_list_body.dart';

class TodoListPage extends StatelessWidget {
  static const name = '/todo_list';

  const TodoListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TaskListBloc>(
      create: (_) => TaskListBloc(
        todoRepository: TodoRepository.create(),
      )
      ..add(TaskFetchStarted
      ())
      ,
      child: const TodoListBody(),
    );
  }
}

