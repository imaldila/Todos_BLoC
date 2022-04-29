import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc/blocs/todos_filter/todos_filter_bloc.dart';

import '../../models/models.dart';
import '../screens.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: const TabBarView(
          children: [
            TodosCard(
              title: 'Pending To Do\'s :',
            ),
            TodosCard(title: 'Completed To Do\'s :'),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      title: const Text('To Do\'s with BLoC'),
      actions: [
        IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddTodosScreen(),
              ),
            );
          },
          icon: const Icon(
            Icons.add,
          ),
        ),
      ],
      bottom: TabBar(
        onTap: (tabIndex) {
          switch (tabIndex) {
            case 0:
              BlocProvider.of<TodosFilterBloc>(context).add(
                const UpdateTodos(todosFilter: TodosFilter.pending),
              );

              break;
            case 1:
              BlocProvider.of<TodosFilterBloc>(context).add(
                const UpdateTodos(todosFilter: TodosFilter.completed),
              );
              break;
          }
        },
        tabs: const [
          Tab(
            icon: Icon(Icons.pending),
          ),
          Tab(
            icon: Icon(Icons.add_task),
          ),
        ],
      ),
    );
  }
}
