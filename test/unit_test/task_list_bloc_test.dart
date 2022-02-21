import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:todo/blocs/tasks_list/task_list_bloc.dart';
import 'package:todo/repositories/todo/todo_repository.dart';
// import 'package:test/expect.dart';

import 'mock_responses.dart';
import 'mocks.dart';

void main() {
  MockTodoRepository mockTodoRepository = MockTodoRepository();

  blocTest(
    "Test TaskFetchStarted Event",
    build: () => TaskListBloc(todoRepository: mockTodoRepository),
    act: (TaskListBloc taskBloc) => taskBloc.add(TaskFetchStarted()),
    expect: () =>
        [TaskListLoadInProgress(), TaskListLoadSuccess(getAllTaskMock)],
  );


}
