import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc/blocs/todos/todos_bloc.dart';
import 'package:todo_bloc/components.dart';
import 'package:todo_bloc/simple_bloc_observer.dart';

import 'blocs/todos_filter/todos_filter_bloc.dart';
import 'models/todos_model.dart';
import 'screens/main_screen/main_page.dart';

void main() {
  BlocOverrides.runZoned(
    () {
      runApp(const MyApp());
    },
    blocObserver: SimpleBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TodosBloc>(
          create: (context) => TodosBloc()
            ..add(
              LoadTodos(
                todos: [
                  Todo(
                      id: '1',
                      task: 'Todo #1',
                      description: 'This is Todo Number 1'),
                  Todo(
                      id: '2',
                      task: 'Todo #2',
                      description: 'This is Todo Number 2'),
                ],
              ),
            ),
        ),
        BlocProvider<TodosFilterBloc>(
          create: (context) => TodosFilterBloc(
            todosBloc: BlocProvider.of<TodosBloc>(context),
          ),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'To Do\'s with BLoC',
        theme: kThemeData,
        home: const MainPage(),
      ),
    );
  }
}
