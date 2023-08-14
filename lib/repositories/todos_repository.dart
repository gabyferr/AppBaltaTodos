import 'dart:io';

import 'package:dio/dio.dart';
import 'package:teste_gaby/models/todo_item_model.dart';

class TodosRepository {
  final String token;

  TodosRepository(this.token);

  Future<List<TodoItem>> getTodayTodos() async {
    var url = "https://10.0.2.2:5001/v1/todos/undone/today";
    Response response = await Dio().get(
      url,
      options: Options(
          headers: {HttpHeaders.authorizationHeader: 'Bearer ${token}'}),
    );
    return (response.data as List)
        .map((todos) => TodoItem.fromJson(todos))
        .toList();
  }

  Future<List<TodoItem>?> getTomorrowTodos() async {
    var url = "https://10.0.2.2:5001/v1/todos/undone/tomorrow";
    Response response = await Dio().get(
      url,
      options: Options(
          headers: {HttpHeaders.authorizationHeader: 'Bearer ${token}'}),
    );
    return (response.data as List)
        .map((todos) => TodoItem.fromJson(todos))
        .toList();
  }

  Future<List<TodoItem>?> getAllTodos() async {
    var url = "https://10.0.2.2:5001/v1/todos";
    Response response = await Dio().get(
      url,
      options: Options(
          headers: {HttpHeaders.authorizationHeader: 'Bearer ${token}'}),
    );
    return (response.data as List)
        .map((todos) => TodoItem.fromJson(todos))
        .toList();
  }

  Future<TodoItem?> add(TodoItem item) async {
    var url = "https://10.0.2.2:5001/v1/todos/undone/today";
    try {
      Response response = await Dio().post(
        url,
        data: item,
        options: Options(
            headers: {HttpHeaders.authorizationHeader: 'Bearer ${token}'}),
      );
      return TodoItem.fromJson(response.data["data"]);
    } catch (e) {
      return null;
    }
  }

  Future<TodoItem?> marckAsDone(
    TodoItem item,
  ) async {
    var url = "https://10.0.2.2:5001/v1/todos/undone/today";
    try {
      Response response = await Dio().post(
        url,
        data: item,
        options: Options(
            headers: {HttpHeaders.authorizationHeader: 'Bearer ${token}'}),
      );
      return TodoItem.fromJson(response.data["data"]);
    } catch (e) {
      return null;
    }
  }
}
