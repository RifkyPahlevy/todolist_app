import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_listapp/app/data/models/db/dbmanager.dart';

class EditPageController extends GetxController {
  TextEditingController kegiatanC = TextEditingController();
  TextEditingController waktuC = TextEditingController();

  RxBool isLoading = false.obs;
  DatabaseManager database = DatabaseManager.instace;

  void editTodo(int id) async {
    Database db = await database.db;
    db.update("todo", {"kegiatan": kegiatanC.text, "waktu": waktuC.text},
        where: "id = ?", whereArgs: [id]);
  }
}
