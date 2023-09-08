class Token {
  static Token getToken=Token();
  String? token;
  Token({
    this.token,
  });

  factory Token.fromJson(Map<String, dynamic> json) => Token(

        token: json['token'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'token': token,
      };
}
