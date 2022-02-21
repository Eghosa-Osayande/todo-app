import 'package:flutter/material.dart';
import 'package:todo/routes.dart';
import 'package:todo/ui/pages/todo_list/todo_list_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      routes: Routes.routes,
      initialRoute: TodoListPage.name,
    );
  }
}

