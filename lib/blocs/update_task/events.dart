part of 'bloc.dart';

@immutable


@immutable
abstract class UpdateTaskEvent extends Equatable {}

class UpdateTaskStarted extends UpdateTaskEvent {
  @override
  List<Object> get props => [];
}


