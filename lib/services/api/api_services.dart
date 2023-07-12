import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../constants/constants.dart';
import '../../models/product_category.dart';
import '../../models/token.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import '../../models/user.dart';
import '../database/token_db.dart';

class ApiServices {
  String endPoint = "mahakacc.mahaksoft.com";
  //  get token from api
  Future<Token> getToken() async {
    Token token = Token();
    var uri = Uri.https(endPoint, "/API/v3/Sync/login");
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

      return token;
    }
    return token;
  }

  // get user form server
  Future<User> getUser(String phone, String password) async {
    Token token = await getToken();
    var uri = Uri.https(endPoint, "/API/v3/Sync/GetAllData");
    var body = convert.jsonEncode({
      "fromPersonVersion": 0,
    });
    var respone = await http.post(uri,
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer ${token.token}"
        },
        body: body);
    if (respone.statusCode != 200) {
      return throw Exception("خطا در دریافت اطلاعات");
    }
    Map<String, dynamic> userMap = convert.jsonDecode(respone.body);
    List<dynamic> users = userMap["Data"]["Objects"]["People"];
    late User? user;
    for (var el in users) {
      if (el["Phone"] == phone && el["Password"] == password) {
        user = User.fromJson(el);
        break;
      }
    }
    if (user == null) {
      return throw Exception("نام کاربری یا کلمه عبور اشتباه است");
    }
    return user;
  }

  Future<List<ProductCategory>> getCategories() async {
    List<ProductCategory> categories = [];
    Token token = await getToken();
    var uri = Uri.https(endPoint, "/API/v3/Sync/GetAllData");
    var body = convert.jsonEncode({
      "fromProductCategoryVersion": 0,
    });
    var respone = await http.post(uri,
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer ${token.token}"
        },
        body: body);
    if (respone.statusCode != 200) {
      return throw Exception("خطا در دریافت اطلاعات");
    }
    // Map<String, dynamic> categoryMap = convert.jsonDecode(respone.body);
    List<dynamic> items = convert.jsonDecode(respone.body)["Data"]["Objects"]
        ["ProductCategories"];
    categories.addAll(items.map((e) {
      return ProductCategory.fromJson(e);
    }));
    return categories;
  }
}

final remoteProvider = Provider<ApiServices>((ref) => ApiServices());
