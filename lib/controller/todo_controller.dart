import 'dart:convert';

import 'package:amazing_todo_app/model/todo_model.dart';
import 'package:amazing_todo_app/services/todo_service.dart';

class TodoController {
  final TodoService _todoService = TodoService();

  Todo? _todo;

  Future<Todo?> getAllTodosRequest() async {
    await _todoService.getAllTodos().then((response) {
      print(response.body);
      if (response.statusCode == 200) {
        _todo = Todo.fromMap(json.decode(response.body));
      } else {
        _todo = null;
      }
    }).catchError((error) {
      _todo = null;
    });
    return _todo;
  }

  //update todo
  Future<bool> updateTodosRequest(
      {required title,
      required description,
      required dateTime,
      required id}) async {
    bool isSuccessful = false;
    await _todoService
        .updateTodo(
            title: title, description: description, dateTime: dateTime, id: id)
        .then((response) {
      if (response.statusCode == 200) {
        isSuccessful = true;
      } else {
        isSuccessful = false;
      }
    }).catchError((error) {
      isSuccessful = false;
    });
    return isSuccessful;
  }

  //create todos
  Future<bool> createTodosRequest({
    required title,
    required description,
    required dateTime,
  }) async {
    bool isSuccessful = false;
    await _todoService
        .createTodo(
      title: title,
      description: description,
      dateTime: dateTime,
    )
        .then((response) {
      if (response.statusCode == 200) {
        isSuccessful = true;
      } else {
        isSuccessful = false;
      }
    }).catchError((error) {
      isSuccessful = false;
    });
    return isSuccessful;
  }

  //delete
  Future<bool> deleteTodosRequest({required id}) async {
    bool isDeleted = false;
    await _todoService.deleteTodos(id: id).then((response) {
      if (response.statusCode == 200) {
        isDeleted = true;
      } else {
        isDeleted = false;
      }
    }).catchError((error) {
      isDeleted = false;
    });
    return isDeleted;
  }
}
