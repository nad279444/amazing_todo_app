import 'dart:convert';

import 'package:http/http.dart';

class TodoService {
  //get all todos
  Future<Response> getAllTodos() async {
    Map<String, String> header = {'content-type': 'application/json'};

    return await get(
        Uri.parse('https://outstanding-goat-button.cyclic.app/todos'),
        headers: header);
  }

  //create a todo
  Future<Response> createTodo(
      {required String title,
      required String description,
      required String dateTime}) async {
    Map<String, String> body = {
      'title': title,
      'description': description,
      'dateTime': dateTime,
    };

    Map<String, String> header = {'content-type': 'application/json'};

    return await post(
        Uri.parse('https://outstanding-goat-button.cyclic.app/todos/todo'),
        body: jsonEncode(body),
        headers: header);
  }

//update todo
  Future<Response> updateTodo(
      {required String title,
      required String description,
      required String dateTime,
      required String id}) async {
    Map<String, String> body = {
      'title': title,
      'description': description,
      'dateTime': dateTime,
      'id': id
    };

    Map<String, String> headers = {'content-type': 'application/json'};

    return await post(
        Uri.parse('https://outstanding-goat-button.cyclic.app/todos/todo/$id'),
        body: jsonEncode(body),
        headers: headers);
  }

  //delete todo
  Future<Response> deleteTodos({required String id}) async {
    return await delete(
      Uri.parse('https://outstanding-goat-button.cyclic.app/todos/$id'),
    );
  }
}
