import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../constants/constants.dart';
import '../../models/token.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class ApiServices {
  String endPoint = "mahakacc.mahaksoft.com";
  //  get token from api
  Future getToken() async {
    Token token = Token();
    var uri = Uri.https(endPoint, "/API/v3/Sync/Login");
    print(uri);
    var body = convert.jsonEncode(apiInfo);
    var respone = await http.post(uri,
        headers: {"Content-Type": "application/json"}, body: body);
    if (respone.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(respone.body);
      token.token = jsonResponse["Data"]["UserToken"];
      Token.getToken=token;
    }
    Token.getToken=token;
  }
}

final apiProvider = Provider<ApiServices>((ref) => ApiServices());
