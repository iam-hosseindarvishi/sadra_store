String settingTableName = "settings";

class SettingFialds {
  static const String id = "id";
  static const String remmaberUser = "remmaberUser";
  static const String lastTimeUpdate = "lastTimeUpdate";
}

class SettingModel {
  int? id;
  bool? remmaberUser;
  String? lastTimeUpdate;
  SettingModel({this.id, this.remmaberUser, this.lastTimeUpdate});
  factory SettingModel.fromJson(Map<String, dynamic> json) => SettingModel(
        id: json["id"] as int,
        remmaberUser: json["remmaberUser"] == 0 ? false : true,
        lastTimeUpdate: json["lastTimeUpdate"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "remmaberUser": remmaberUser == false ? 0 : 1,
        "lastTimeUpdate": lastTimeUpdate,
      };
  SettingModel copyWith({bool? remmamberUser}) {
    // ignore: unnecessary_this
    return SettingModel(remmaberUser: remmaberUser ?? this.remmaberUser);
  }
}
