import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../../models/token.dart';

const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
// final boolType = 'BOOLEAN NOT NULL';
// final integerType = 'INTEGER NOT NULL';
const textType = 'TEXT NOT NULL';

class CoreDatabase {
  Future<Database> database() async {
    return openDatabase(
      join(await getDatabasesPath(), 'sadra.db'),
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
            "CREATE TABLE $tokenTableName (${TokenFields.id} $idType, ${TokenFields.token} $textType)");
      },
      onUpgrade: (db, oldVersion, newVersion) async {},
    );
  }
}
