import '../../models/token.dart';
import '../../models/user.dart';
import 'api_services.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class UserApi extends ApiServices {
  // get user form api
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
}