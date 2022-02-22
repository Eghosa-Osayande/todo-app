part of 'bloc.dart';

@immutable
abstract class CreateTaskEvent extends Equatable {}

class CreateTaskStarted extends CreateTaskEvent {
  String title;
  String description;
  CreateTaskStarted({required this.title, required this.description});
  @override
  List<Object> get props => [];
}
