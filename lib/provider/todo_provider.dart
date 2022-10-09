import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';

import '../db/database_manager.dart';
import '../models/todo_model.dart';

class TodoProvider with ChangeNotifier {
  bool isLoading = false;

  DatabaseManager database = DatabaseManager.instance;
  List<TodoModel> itemTodo = [];

  void addTodo({String? title, String? desc}) async {
    isLoading = true;
    notifyListeners();
    Database db = await database.db;
    await db.insert(
      'todos',
      {
        'title': title,
        'description': desc,
      },
    );
    isLoading = false;
    notifyListeners();
  }

  Future<void> getTodo() async {
    Database db = await database.db;
    List<Map<String, dynamic>> data = await db.query('todos');
    itemTodo.clear();

    for (var item in data) {
      itemTodo.add(
        TodoModel(
          id: item['id'],
          title: item['title'],
          description: item['description'],
        ),
      );
    }
  }

  Future deleteTodo(int id) async {
    Database db = await database.db;
    db.delete('todos', where: 'id = $id');
  }

  Future editTodo({int? id, String? title, String? desc}) async {
    Database db = await database.db;
    db.update(
        'todos',
        {
          'id': id,
          'title': title,
          'description': desc,
        },
        where: 'id = $id');
  }

  String toUpper(String input) {
    var n = input[0].toUpperCase();
    return n + input.substring(1, input.length).toLowerCase();
  }
}
