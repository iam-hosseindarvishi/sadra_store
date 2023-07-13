String settingTableName = "settings";

class SettingFialds {
  static const String id = "_Id";
  static const String remmaberUser = "remamberUser";
  static const String lastTimeUpdate = "lastTimeUpdate";
  static const String autoLogin = "autoLogin";
}

class SettingModel {
  int? id;
  bool? remamberUser;
  String? lastTimeUpdate;
  bool? autoLogin;
  SettingModel(
      {this.id, this.remamberUser, this.lastTimeUpdate, this.autoLogin});
  factory SettingModel.fromJson(Map<String, dynamic> json) => SettingModel(
      id: json["_Id"] as int,
      remamberUser: json["remmaberUser"],
      lastTimeUpdate: json["lastTimeUpdate"],
      autoLogin: json["autoLogin"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "remmaberUser": remamberUser,
        "lastTimeUpdate": lastTimeUpdate,
        "autoLogin": autoLogin
      };
}
