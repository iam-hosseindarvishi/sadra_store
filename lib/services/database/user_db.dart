import 'package:sqflite/sqflite.dart';
import '../../models/user.dart';
import 'core.dart';

class UserDb extends CoreDatabase {
  Future<int> store(User user) async {
    Database db = await database();
    return await db.insert(userTableName, user.toJson());
  }

  Future<User> getUser() async {
    User user;
    Database db = await database();
    final List<Map<String, dynamic>> maps = await db.query(
      userTableName,
    );
    user = User.fromJson(maps.first);
    return user;
  }

  Future<int> update(User user, String phone) async {
    Database db = await database();
    return await db.update(userTableName, user.toJson());
  }

  Future<bool> checkUserExsist() async {
    Database db = await database();
    final List<Map<String, dynamic>> maps = await db.query(userTableName);
    if (maps.isNotEmpty) {
      return true;
    }
    return false;
  }
}
