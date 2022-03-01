import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_listapp/app/data/models/db/dbmanager.dart';
import 'package:todo_listapp/app/data/models/todo_model.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
  DatabaseManager database = DatabaseManager.instace;

  RxList allTodo = <Todo>[].obs;

  Future<void> getAllTodo() async {
    Database db = await database.db;

    List<Map<String, dynamic>> list = await db.query('todo');

    if (list != null) {
      allTodo(Todo.fromJsonList(list));
      allTodo.refresh();
    } else {
      allTodo.clear();
      allTodo.refresh();
    }
  }

  void deleteData(int id) async {
    Database db = await database.db;
    db.delete("todo", where: "id = ?", whereArgs: [id]);

    await getAllTodo();
  }
}
