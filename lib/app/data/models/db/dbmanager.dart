import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseManager {
//private constructor

  DatabaseManager._privateConstructor();
  static DatabaseManager instace = DatabaseManager._privateConstructor();

  Database? _db;

  Future<Database> get db async {
    if (_db == null) {
      _db = await _initDb();
      return _db!;
    } else {
      return _db!;
    }
  }

  Future _initDb() async {
//ambil direktori
    Directory documentDirectory = await getApplicationDocumentsDirectory();

    String path = join(documentDirectory.path, "todo.db");

    return await openDatabase(
      path,
      version: 1,
      onCreate: (database, version) async {
        return await database.execute(
          '''
CREATE Table todo (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  kegiatan TEXT ,
  waktu TEXT
  
)

''',
        );
      },
    );
  }

  Future _closeDb() async {
    _db = await instace.db;
    await _db!.close();
  }
}
