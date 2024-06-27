import 'package:flutter/foundation.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../constants/strings.dart';

class DatabaseHelper {
  static DatabaseHelper _databaseHelper = DatabaseHelper._internal();

  DatabaseHelper._internal();

  static DatabaseHelper get instance => _databaseHelper;
  // ...

  Future<Database> initDB() async {
    String path = await getDatabasesPath();
    return openDatabase(
      join(path, 'job_application.db'),
      onCreate: (database, version) async {
        await database.execute(Strings.basicDetailTable);
        await database.execute(Strings.educationdetail);
        await database.execute(Strings.workexperience);
        await database.execute(Strings.referenceDetails);
        await database.execute(Strings.lanugageknown);
        await database.execute(Strings.technologyknown);
        await database.execute(Strings.preference);
      },
      version: 1,
    );
  }

  Future<int> insertData(Map<String, dynamic> data, dbName) async {
    final Database db = await DatabaseHelper._databaseHelper.initDB();

    int lid = await db.insert(dbName, data);

    return lid;
  }

  Future<List<Map<String, dynamic>>> getdata() async {
    final Database db = await initDB();
    List<Map<String, dynamic>> result = await db.query("basicDetails");

    return result;
  }

  Future<void> deleteData(id, name) async {
    final Database db = await DatabaseHelper._databaseHelper.initDB();

    db.delete(name,
        // Use a `where` clause to delete a specific Note.
        where: "id = ?",
        // Pass the Dog's id as a whereArg to prevent SQL injection.
        whereArgs: [id]);
  }

  Future<List<List<Map<String, dynamic>>>> getDataById(id) async {
    final Database db = await DatabaseHelper._databaseHelper.initDB();

    List<Map<String, dynamic>> basicdetail = await db.query("basicDetails",
        where: "id = ?",
        // Pass the Dog's id as a whereArg to prevent SQL injection.
        whereArgs: [id]);

    List<Map<String, dynamic>> prefernce = await db.query("preference",
        where: "pid = ?",
        // Pass the Dog's id as a whereArg to prevent SQL injection.
        whereArgs: [id]);

    List<Map<String, dynamic>> language = await db.query("languageknown",
        where: "lid = ?",
        // Pass the Dog's id as a whereArg to prevent SQL injection.
        whereArgs: [id]);

    List<Map<String, dynamic>> education = await db.query("educationDetails",
        where: "eid = ?",
        // Pass the Dog's id as a whereArg to prevent SQL injection.
        whereArgs: [id]);

    List<Map<String, dynamic>> work = await db.query("workexperience",
        where: "wid = ?",
        // Pass the Dog's id as a whereArg to prevent SQL injection.
        whereArgs: [id]);

    List<Map<String, dynamic>> techmology = await db.query("technologyknown",
        where: "tid = ?",
        // Pass the Dog's id as a whereArg to prevent SQL injection.
        whereArgs: [id]);

    List<Map<String, dynamic>> reference = await db.query("referenceDetails",
        where: "rid = ?",
        // Pass the Dog's id as a whereArg to prevent SQL injection.
        whereArgs: [id]);

    List<List<Map<String, dynamic>>> result = [];

    result.add(basicdetail);
    result.add(prefernce);
    result.add(education);
    result.add(work);
    result.add(reference);
    result.add(language);
    result.add(techmology);

    return result;
  }

  Future<int> UpdateData(Map<String, dynamic> data, id, dbName) async {
    final Database db = await DatabaseHelper._databaseHelper.initDB();

    var res = await db.update(dbName, data,
        // Ensure that the Note has a matching id.
        where: 'id = ?',
        // Pass the Note's id as a whereArg to prevent SQL injection.
        whereArgs: [id]);

    return res;
  }

// ...
}
