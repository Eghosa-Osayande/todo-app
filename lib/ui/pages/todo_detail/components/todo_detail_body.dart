import 'package:flutter/material.dart';
import 'package:todo/ui/widgets/black_safe_area.dart';
import 'package:todo/ui/widgets/task_form.dart';

class TodoDetailBody extends StatelessWidget {
  const TodoDetailBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlackSafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: const Text(
            'Create Task',
            style: TextStyle(
                fontFamily: 'circular',
                fontSize: 18,
                fontWeight: FontWeight.w400),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              TaskForm(),
              
            ],
          ),
        ),
      ),
    );
  }
}
