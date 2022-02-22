import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo/blocs/tasks_list/task_list_bloc.dart';
import 'package:todo/repositories/todo/models/task_model.dart';
import 'package:todo/ui/pages/todo_detail/todo_detail_page.dart';
import 'package:todo/ui/pages/todo_list/components/task_item_tile.dart';
import 'package:todo/ui/widgets/black_safe_area.dart';
import 'package:todo/ui/widgets/retry_widget.dart';

class TodoListBody extends StatelessWidget {
  const TodoListBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlackSafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: const Text(
            'Todo List',
            style: TextStyle(
                fontFamily: 'circular',
                fontSize: 18,
                fontWeight: FontWeight.w400),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            // context.read<TaskListBloc>().add(
            //       TaskFetchStarted(),
            //     );
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TodoDetailPage(),
              ),
            );
          },
          child: const Icon(Icons.add),
        ),
        body:
            BlocBuilder<TaskListBloc, TaskListState>(builder: (context, state) {
          if (state is TaskListLoadInProgress) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is TaskListLoadSuccess) {
            return (state.tasks.isEmpty)
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'Todo List is empty',
                            style: TextStyle(
                                fontFamily: 'circular',
                                fontSize: 24,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'Create a task',
                            style: TextStyle(
                                color: Color.fromRGBO(119, 119, 119, 1),
                                fontFamily: 'circular',
                                fontSize: 18,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ],
                  )
                : ListView.builder(
                    itemCount: state.tasks.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(
                            bottom:
                                (index == (state.tasks.length - 1)) ? 100 : 0),
                        child: TaskItemTile(
                            task: state.tasks[index], index: 1 + index),
                      );
                    });
          }
          return RetryWidget(retryPress: () {
            context.read<TaskListBloc>().add(
                  TaskFetchStarted(),
                );
          });
        }),
      ),
    );
  }
}
