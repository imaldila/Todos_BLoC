import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc/blocs/todos/todos_bloc.dart';
import 'package:todo_bloc/blocs/todos_filter/todos_filter_bloc.dart';

import '../../../components.dart';

class TodosCard extends StatelessWidget {
  const TodosCard({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TodosFilterBloc, TodosFilterState>(
      listener: (context, state) {
        if (state is TodosFilterLoaded) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                  'There are ${state.filteredTodos.length} To Do\'s in your ${state.todosFilter.name.toString().split('.').last} list.'),
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is TodosFilterLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is TodosFilterLoaded) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    title,
                    style: kTextStyle,
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: state.filteredTodos.length,
                  itemBuilder: (context, index) {
                    return Card(
                      margin: const EdgeInsets.only(bottom: 8),
                      child: Padding(
                        padding: const EdgeInsets.all(
                          16,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${state.filteredTodos[index].id}: ${state.filteredTodos[index].task}',
                              style: kTextStyle,
                            ),
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    context.read<TodosBloc>().add(
                                          UpdateTodo(
                                            todo: state.filteredTodos[index]
                                                .copyWith(isCompleted: true),
                                          ),
                                          // UpdateTodos(todosFilter: state.filteredTodos[index]);
                                        );
                                  },
                                  icon: const Icon(Icons.add_task),
                                ),
                                IconButton(
                                  onPressed: () {
                                    context.read<TodosBloc>().add(
                                          DeleteTodo(
                                            todo: state.filteredTodos[index]
                                                .copyWith(isCancelled: true),
                                          ),
                                        );
                                  },
                                  icon: const Icon(Icons.cancel),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        } else {
          return const Text('There is Something went Error!');
        }
      },
    );
  }
}
