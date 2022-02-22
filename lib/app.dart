import 'package:flutter/material.dart';
import 'package:todo/repositories/todo/models/task_model.dart';
import 'package:todo/routes.dart';
import 'package:todo/theme.dart';
import 'package:todo/ui/pages/todo_detail/todo_detail_page.dart';
import 'package:todo/ui/pages/todo_list/todo_list_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: generateMaterialColor(const Color.fromRGBO(116, 45, 221, 1),),
        scaffoldBackgroundColor: Colors.white,
      ),
      routes: Routes.routes,
      initialRoute: TodoListPage.name,
      
    );
  }
}

