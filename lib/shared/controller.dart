import 'package:desafio_flutter/shared/repository.dart';
import 'package:desafio_flutter/models/todo_model.dart';

class TodoController {
  final Repository repository;

  TodoController(this.repository);

  Future<List<Todo>> getAllTodos() async {
    return await repository.getAllTodos();
  }

  Future<void> createTodo(Todo todo) async {
    final jsonTodo = todo.toJson();
    return await repository.createTodo(jsonTodo);
  }

  Future<void> updateTodo(Todo todo) async {
    final jsonTodo = todo.toJson();
    return await repository.updateTodo(jsonTodo, todo.id ?? '');
  }

  Future<void> deleteTodo(Todo todo) async {
    return await repository.deleteTodo(todo.id ?? '');
  }
}
