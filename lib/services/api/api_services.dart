import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../constants/constants.dart';
import '../../models/token.dart';
import 'dart:convert' as convert;
import 'package:dio/dio.dart';
class ApiServices {
  String endPoint = "https://mahakacc.mahaksoft.com";
  //  get token from api
  Future getToken() async {
    final dio=Dio();
    Token token = Token();
    // var uri = Uri.parse();
    // print(uri);
    var body = convert.jsonEncode(apiInfo);
    dio.options.headers["Content-Type"] = "application/json";

    var response = await dio.post("$endPoint/API/v3/Sync/Login",data: body);
    if (response.statusCode == 200) {
      token.token =response.data['Data']['UserToken'];
      Token.getToken=token;
    }
    Token.getToken=token;
  }
}

final apiProvider = Provider<ApiServices>((ref) => ApiServices());
