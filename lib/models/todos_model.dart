import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class Todo extends Equatable {
  final String id, task, description;
  bool? isCancelled, isCompleted;

  Todo({
    required this.id,
    required this.task,
    required this.description,
    this.isCancelled,
    this.isCompleted,
  }) {
    isCancelled = isCancelled ?? false;
    isCompleted = isCompleted ?? false;
  }

  Todo copyWith(
      {String? id,
      String? task,
      String? description,
      bool? isCancelled,
      bool? isCompleted}) {
    return Todo(
      id: id ?? this.id,
      task: task ?? this.task,
      description: description ?? this.description,
      isCancelled: isCancelled ?? this.isCancelled,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }

  @override
  List<Object?> get props => [id, task, description, isCancelled, isCompleted];

  static List<Todo> todos = [
    Todo(id: '1', task: 'Todo #1', description: 'This is Todo Number 1'),
    Todo(id: '2', task: 'Todo #2', description: 'This is Todo Number 2'),
  ];
}
