import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../constants/strings.dart';

class DatabaseHelper {
  // ...
  Future<void> initDB() async {
    String path = await getDatabasesPath();
    var db = await openDatabase(
      join(path, 'job_application.db'),
      onCreate: (database, version) async {
        await database.execute(Strings.basicDetailTable);
      },
      version: 1,
    );
  }
// ...
}
