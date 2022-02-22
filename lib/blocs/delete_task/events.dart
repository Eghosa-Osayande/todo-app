part of 'bloc.dart';



@immutable
abstract class DeleteTaskEvent extends Equatable {}

class DeleteTaskLoadingStarted extends DeleteTaskEvent {
  @override
  List<Object> get props => [];
}


