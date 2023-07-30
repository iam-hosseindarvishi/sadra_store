String settingTableName = "settings";

class SettingFialds {
  static const String id = "id";
  static const String remmaberUser = "remmaberUser";
  static const String lastTimeUpdate = "lastTimeUpdate";
  static const String autoLogin = "autoLogin";
}

class SettingModel {
  int? id;
  bool? remmaberUser;
  String? lastTimeUpdate;
  bool? autoLogin;
  SettingModel(
      {this.id, this.remmaberUser, this.lastTimeUpdate, this.autoLogin});
  factory SettingModel.fromJson(Map<String, dynamic> json) => SettingModel(
      id: json["_Id"] as int,
      remmaberUser: json["remmaberUser"],
      lastTimeUpdate: json["lastTimeUpdate"],
      autoLogin: json["autoLogin"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "remmaberUser": remmaberUser == false ? 0 : 1,
        "lastTimeUpdate": lastTimeUpdate,
        "autoLogin": autoLogin == false ? 0 : 1,
      };
}
