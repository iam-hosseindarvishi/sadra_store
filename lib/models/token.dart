const String tokenTableName = "token";

class TokenFields {
  static const String id = "_id";
  static const String token = "token";
}

class Token {
  int? id;
  String? token;

  Token({
    this.id,
    this.token,
  });

  factory Token.fromJson(Map<String, dynamic> json) => Token(
        id: json['databaseId'] as int?,
        token: json['token'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'token': token,
      };
}
