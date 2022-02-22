import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/repositories/todo/todo_repository.dart';

part 'events.dart';
part 'states.dart';

class DeleteTaskBloc extends Bloc<DeleteTaskEvent, DeleteTaskState> {
  DeleteTaskBloc({required TodoRepository todoRepository})
      : _todoRepository = todoRepository,
        super(DeleteTaskSuccess()) {
    // on<TaskFetchStarted>(_onTaskFetchStarted);
  }

  final TodoRepository _todoRepository;


}
