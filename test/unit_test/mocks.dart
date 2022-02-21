

import 'package:mockito/mockito.dart';
import 'package:todo/repositories/todo/models/task_model.dart';
import 'package:todo/repositories/todo/todo_repository.dart';

import 'mock_responses.dart';

class MockTodoRepository extends Mock implements TodoRepository{


  @override
  Future<List<TaskModel>> getAllTasks() async {
    return getAllTaskMock;
  }


}