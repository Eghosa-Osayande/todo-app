import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/blocs/tasks_list/task_list_bloc.dart';
import 'package:todo/ui/pages/todo_list/components/task_item_tile.dart';
import 'package:todo/ui/widgets/black_safe_area.dart';

class TodoListBody extends StatelessWidget {
  const TodoListBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlackSafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Todo List'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            context.read<TaskListBloc>().add(
                  TaskFetchStarted(),
                );
          },
          child: const Icon(Icons.add),
        ),
        body: BlocBuilder<TaskListBloc, TaskListState>(
            builder: (context, state) {
              print(state);
          if (state is TaskListLoadInProgress) {
            print('progress');
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is TaskListLoadSuccess) {
            return ListView.builder(
                itemCount: state.tasks.length,
                itemBuilder: (context, index) {
                  return TaskItemTile(task: state.tasks[index], index: index);
                });
          }
          return Text('Error');
        }),
      ),
    );
  }
}
