import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sqflite/sqflite.dart';
import '../../models/user.dart';
import 'core.dart';

class UserDb extends CoreDatabase {
  Future<int> store(User user) async {
    Database db = await database();
    return await db.insert(userTableName, user.toJson());
  }

  Future<User> getUser() async {
    Database db = await database();
    final List<Map<String, dynamic>> maps = await db.query(
      userTableName,
    );

    return maps.isNotEmpty ? User.fromJson(maps.first) : User();
  }

  Future<int> update(User user) async {
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

  Future<int> getVisitorId() async {
    if (await checkUserExsist() == false) {
      throw Exception("کاربری یافت نشد");
    }
    Database db = await database();
    final List<Map<String, dynamic>> maps = await db.query(userTableName);
    User user = maps.isEmpty ? User() : User.fromJson(maps.first);
    int visitorId = user.visitorId ?? 0;
    return visitorId;
  }
}

final userProvider = Provider<UserDb>((ref) => UserDb());
