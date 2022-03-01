import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_listapp/app/data/models/db/dbmanager.dart';

class AddTodoController extends GetxController {
  TextEditingController kegiatanC = TextEditingController();
  TextEditingController waktuC = TextEditingController();

  RxBool isLoading = false.obs;
  DatabaseManager database = DatabaseManager.instace;

  void addData() async {
    if (kegiatanC.text.isNotEmpty && waktuC.text.isNotEmpty) {
      isLoading.value = true;
      Database db = await database.db;
      db.insert("todo", {
        "kegiatan": kegiatanC.text,
        "waktu": waktuC.text,
      });

      isLoading.value = false;
    }
  }
}
