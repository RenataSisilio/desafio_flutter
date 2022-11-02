import '../models/todo_model.dart';
import 'package:dio/dio.dart';

class Repository {
  final String _myCrudcrudId = '609e18877bbb4b6a8dc336515eedcd4d';

  Future<List<Todo>> getAllTodos() async {
    final response =
        await Dio().get('https://crudcrud.com/api/$_myCrudcrudId/todos');
    final data = response.data.isNotEmpty ? response.data : [];
    return List.from(data.map((e) => Todo.fromMap(e)));
  }

  Future<void> createTodo(String jsonTodo) async {
    await Dio().post(
      'https://crudcrud.com/api/$_myCrudcrudId/todos',
      data: jsonTodo,
      options: Options(
        headers: {
          "content-type": "application/json",
          "accept": "application/json",
        },
      ),
    );
  }

  Future<void> updateTodo(String jsonTodo, String id) async {
    await Dio().put(
      'https://crudcrud.com/api/$_myCrudcrudId/todos/$id',
      data: jsonTodo,
      options: Options(
        headers: {
          "content-type": "application/json",
          "accept": "application/json",
        },
      ),
    );
  }

  Future<void> deleteTodo(String id) async {
    await Dio().delete('https://crudcrud.com/api/$_myCrudcrudId/todos/$id');
  }
}
