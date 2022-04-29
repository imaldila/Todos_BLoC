import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc/blocs/todos/todos_bloc.dart';

import '../../models/todos_model.dart';
import 'components/input_form.dart';

class AddTodosScreen extends StatelessWidget {
  AddTodosScreen({Key? key}) : super(key: key);

  final TextEditingController _controllerID = TextEditingController();
  final TextEditingController _controllerTask = TextEditingController();
  final TextEditingController _controllerDescription = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Todo'),
      ),
      body: BlocListener<TodosBloc, TodosState>(
        listener: (context, state) {
          if (state is TodosLoaded) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                duration: Duration(milliseconds: 600),
                content: Text('Todo Added !'),
              ),
            );
          }
        },
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                InputForm(
                  title: 'ID',
                  controller: _controllerID,
                ),
                InputForm(
                  title: 'Task',
                  controller: _controllerTask,
                ),
                InputForm(
                  title: 'Description',
                  controller: _controllerDescription,
                ),
                ElevatedButton(
                  onPressed: () {
                    var todo = Todo(
                      id: _controllerID.text,
                      task: _controllerTask.text,
                      description: _controllerDescription.text,
                    );

                    context.read<TodosBloc>().add(AddTodo(todo: todo));
                    Navigator.pop(context);
                  },
                  child: const Text('Add Todo'),
                  style: ElevatedButton.styleFrom(
                    primary: Theme.of(context).primaryColor,
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
