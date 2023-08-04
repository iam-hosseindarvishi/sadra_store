import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sadra_store/models/setting_model.dart';
import 'package:sqflite/sqflite.dart';
import 'core.dart';

class SettingDb extends CoreDatabase {
  Future<int> initSetting() async {
    SettingModel setting =
        SettingModel(remmaberUser: false, lastTimeUpdate: null);
    Database db = await database();
    return db.insert(settingTableName, setting.toJson());
  }

  Future<SettingModel> getSettings() async {
    Database db = await database();
    List<Map<String, dynamic>> maps = await db.query(settingTableName);
    return maps.isNotEmpty
        ? SettingModel.fromJson(maps.first)
        : throw Exception(["تنظیمات یافت نشد"]);
  }

  Future<int> update(SettingModel setting) async {
    Database db = await database();
    var settingId = await getSettings();
    print("updated to ${setting.remmaberUser}");
    return db.update(settingTableName, setting.toJson(),
        where: "${SettingFialds.id}=?", whereArgs: [settingId.id]);
  }

  Future<bool> checkSettingExsit() async {
    Database db = await database();
    List<Map<String, dynamic>> maps = await db.query(settingTableName);
    return maps.isEmpty ? false : true;
  }
}

final settingProvider = Provider<SettingDb>((ref) => SettingDb());
