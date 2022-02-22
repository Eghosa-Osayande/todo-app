import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/repositories/todo/models/task_model.dart';
import 'package:todo/repositories/todo/todo_repository.dart';

part 'states.dart';
part 'events.dart';

class TaskListBloc extends Bloc<DeleteTaskEvent, DeleteTaskState> {
  TaskListBloc({required TodoRepository todoRepository})
      : _todoRepository = todoRepository,
        super(DeleteTaskSuccess()) {
    // on<TaskFetchStarted>(_onTaskFetchStarted);
  }

  final TodoRepository _todoRepository;


}
