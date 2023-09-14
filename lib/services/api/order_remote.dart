import 'dart:convert';
import '../../models/token.dart';
import '../database/order_db.dart';
import 'api_services.dart';
import 'package:dio/dio.dart';
class OrderApi extends ApiServices {
  Future<bool> sendOrder() async {
    try {
      Token token = Token.getToken;
      final dio = Dio();
      dio.options.headers["Content-Type"] = "application/json";
      dio.interceptors.add(InterceptorsWrapper(
          onRequest: (options, handler) {
            // اضافه کردن توکن به درخواست
            options.headers["Authorization"] = "Bearer ${token.token}";
            handler.next(options);
          }
      ));
      var jsonData = await OrderDb().sendingOrder();
      var body = jsonEncode(jsonData);
      print(body);
      var response = await dio.post(
          "$endPoint/API/v3/Sync/SaveAllData", data: body);
      print(response.data);
      if (response.statusCode != 200) {
        return false;
      }

      await OrderDb().deActivateOrder().then((value) async =>
      await OrderDb().initOrder());
      return true;
    } catch (ex) {
      print(ex);
      return false;
    }
  }
}