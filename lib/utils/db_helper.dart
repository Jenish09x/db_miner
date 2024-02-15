import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../screen/model/db_model.dart';

class DBHelper {
  Database? dataBase;

  final String DB_NAME = "data.db";

  Future<Database> checkDb() async {
    if (dataBase != null) {
      return dataBase!;
    } else {
      return await initDb();
    }
  }

  Future<Database> initDb() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, DB_NAME);

    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        String quotesTable =
            "CREATE TABLE quotes(id INTEGER PRIMARY KEY AUTOINCREMENT, quotes TEXT, category TEXT,author TEXT)";
        String categoryTable =
            "CREATE TABLE category(id INTEGER PRIMARY KEY AUTOINCREMENT,quotes TEXT, category TEXT,author TEXT)";
        db.execute(quotesTable);
        db.execute(categoryTable);
      },
    );
  }

  Future<void> insertData(DbModel dbModel) async {
    dataBase = await checkDb();
    dataBase!.insert(
      "quotes",
      {
        "category": dbModel.category,
        "quotes": dbModel.quotes,
        "author": dbModel.author,
      },
    );
  }

  Future<List<DbModel>> readQuotes() async {
    dataBase = await checkDb();
    String query = "SELECT * FROM quotes";
    List<Map> data = await dataBase!.rawQuery(query, null);
    List<DbModel> modelList = data.map((e) => DbModel.mapToModel(e)).toList();
    return modelList;
  }

  Future<void> quotesDelete({required String id}) async {
    dataBase = await checkDb();
    dataBase!.delete(
      "quotes",
      where: "id=?",
      whereArgs: [id],
    );
  }
}
