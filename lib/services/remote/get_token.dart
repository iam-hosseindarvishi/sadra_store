import 'package:sadra_store/services/database/token_db.dart';

import '../../constants/constants.dart';
import '../../models/token.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class GetToken {
  Future<String> getToken() async {
    // var token = Token(
    //   userName: "2512140",
    //   packageNo: "2512140",
    //   password: "069515",
    //   databaseId: 2790027,
    //   language: "fa",
    // );
    Token token = Token();
    var uri = Uri.https("mahakacc.mahaksoft.com", "/API/v3/Sync/login");
    var body = convert.jsonEncode(apiInfo);
    var respone = await http.post(uri,
        headers: {"Content-Type": "application/json"}, body: body);
    if (respone.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(respone.body);
      // print(token.fromJson(jsonResponse).token);
      token.token = jsonResponse["Data"]["UserToken"];
      await TokenDb().checkTokenExsist() != true
          ? await TokenDb().store(token)
          : await TokenDb().update(token);

      return token.token!;
    }
    return token.token!;
  }
}
