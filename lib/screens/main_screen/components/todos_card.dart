import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../components.dart';
import '../../../blocs/todos/todos_bloc.dart';

class TodosCard extends StatelessWidget {
  const TodosCard({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodosBloc, TodosState>(
      builder: (context, state) {
        if (state is TodosLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is TodosLoaded) {
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
                  itemCount: state.todos.length,
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
                              '${state.todos[index].id}: ${state.todos[index].task}',
                              style: kTextStyle,
                            ),
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.add_task),
                                ),
                                IconButton(
                                  onPressed: () {
                                    context.read<TodosBloc>().add(
                                          DeleteTodo(todo: state.todos[index]),
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
