part of 'bloc.dart';

@immutable
abstract class UpdateTaskState extends Equatable {}

class UpdateTaskInProgress extends UpdateTaskState {
  @override
  List<Object> get props => [];
}

class UpdateTaskSuccess extends UpdateTaskState {
  @override
  List<Object> get props => [];
}

class UpdateTaskFailure extends UpdateTaskState {
  @override
  List<Object> get props => [];
}

class UpdateTaskUndefined extends UpdateTaskState {
  @override
  List<Object> get props => [];
}
