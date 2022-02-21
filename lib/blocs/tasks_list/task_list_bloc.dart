import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/repositories/todo/models/task_model.dart';
import 'package:todo/repositories/todo/todo_repository.dart';


part 'task_list_state.dart';
part 'task_list_event.dart';


class TaskListBloc extends Bloc<TaskListEvent, TaskListState> {
  TaskListBloc({required TodoRepository todoRepository})
      : _todoRepository = todoRepository,
        super(TaskListLoadInProgress()) {
    on<TaskFetchStarted>(_onTaskFetchStarted);
  }

  final TodoRepository _todoRepository;

  void _onTaskFetchStarted(
    TaskFetchStarted event,
    Emitter<TaskListState> emit,
  ) async {
    print('getting all task');
    emit(TaskListLoadInProgress());
    print('getting all task emitted');
    try {
      var tasks = await _todoRepository.getAllTasks();
      // tasks= _sortTasks(tasks);
      emit(TaskListLoadSuccess(tasks));
    } catch (_) {
      emit(TaskListLoadFailure());
    }
  }

  _sortTasks(List<TaskModel> tasks){
    List<TaskModel> completedTasks=[];
    for (var task in tasks){
      if(task.isCompleted){
        completedTasks.add(task);
        tasks.remove(task);
      }
    }
    tasks.addAll(completedTasks);
    return tasks;
  }


}