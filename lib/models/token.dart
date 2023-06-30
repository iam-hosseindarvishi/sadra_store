const String tokenTableName = "login";

class TokenFields {
  static final String id = "_id";
  static final String token = "token";
}

class Token {
  String? userName;
  String? password;
  int? databaseId;
  String? packageNo;
  String? language;
  String? appId;
  String? description;
  String? token;

  Token({
    this.userName,
    this.password,
    this.databaseId,
    this.packageNo,
    this.language,
    this.appId,
    this.description,
    this.token,
  });

  factory Token.fromJson(Map<String, dynamic> json) => Token(
        userName: json['userName'] as String?,
        password: json['password'] as String?,
        databaseId: json['databaseId'] as int?,
        packageNo: json['packageNo'] as String?,
        language: json['language'] as String?,
        appId: json['appId'] as String?,
        description: json['description'] as String?,
        token: json['token'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'userName': userName,
        'password': password,
        'databaseId': databaseId,
        'packageNo': packageNo,
        'language': language,
        'appId': appId,
        'description': description,
        'token': token,
      };
}
