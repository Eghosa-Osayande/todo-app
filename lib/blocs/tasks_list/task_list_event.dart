part of 'task_list_bloc.dart';

@immutable
abstract class TaskListEvent extends Equatable{}

class TaskFetchStarted extends TaskListEvent {
   
   @override
  List<Object> get props => [];


}
