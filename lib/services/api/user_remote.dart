import '../../models/token.dart';
import '../../models/user.dart';
import 'api_services.dart';
import 'dart:convert' as convert;
import 'package:dio/dio.dart';

class UserApi extends ApiServices {
  // get user form api
  Future<User> getUser(String phone, String password) async {
    final dio=Dio();
    dio.options.headers["Content-Type"] = "application/json";
    var body = convert.jsonEncode({
      "fromPersonVersion": 0,
    });
    Token token=Token.getToken;
    dio.interceptors.add(InterceptorsWrapper(
        onRequest: (options,handler){
          // اضافه کردن توکن به درخواست
          options.headers["Authorization"]="Bearer ${token.token}";
          handler.next(options);
        }
    ));
    var response = await dio.post("$endPoint/API/v3/Sync/GetAllData",data: body);

    if (response.statusCode != 200) {
      return throw Exception("خطا در دریافت اطلاعات");
    }
    Map<String, dynamic> userMap = response.data;

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
