import 'package:sadra_store/models/token.dart';
import 'package:sqflite/sqflite.dart';
import 'core.dart';

class TokenDb extends CoreDatabase {
  Future<int> store(Token token) async {
    Database db = await database();
    return await db.insert(tokenTableName, {"token": token.token});
  }

  Future<int> update(Token token) async {
    Database db = await database();
    return await db.update(tokenTableName, {"token": token.token},
        where: "${TokenFields.id}=?", whereArgs: [1]);
  }

  Future<bool> checkTokenExsist() async {
    Database db = await database();
    final List<Map<String, dynamic>> maps = await db.query(tokenTableName,
        columns: ['token'], where: '${TokenFields.id}=?', whereArgs: [1]);

    if (maps.isNotEmpty) {
      return true;
    }
    return false;
  }
}
