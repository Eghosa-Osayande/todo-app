import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/repositories/todo/models/task_model.dart';
import 'package:todo/repositories/todo/todo_repository.dart';

part 'states.dart';
part 'events.dart';

class CreateTaskBloc extends Bloc<CreateTaskEvent, CreateTaskState> {
  CreateTaskBloc({required TodoRepository todoRepository})
      : _todoRepository = todoRepository,
        super(CreateTaskUndefined()) {
    on<CreateTaskStarted>(_onCreateTaskStarted);
  }

  final TodoRepository _todoRepository;

  void _onCreateTaskStarted(
    CreateTaskStarted event,
    Emitter<CreateTaskState> emit,
  )async {
    emit(CreateTaskInProgress());
    try {
      var tasks = await _todoRepository.insertTask(title: event.title, description: event.description);
      emit(CreateTaskSuccess());
     
    } catch (_) {
      emit(CreateTaskFailure());
    }
  }
}
