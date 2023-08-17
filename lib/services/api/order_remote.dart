import 'dart:convert';

import 'package:intl/intl.dart';
import '../../models/token.dart';
import '../database/order_db.dart';
import 'api_services.dart';
import 'package:http/http.dart' as http;
class OrderApi extends ApiServices{
  Future<bool> sendOrder() async{
    Token token = await getToken();
    final uri = Uri.https(endPoint,"/API/v3/Sync/SaveAllData");
    var jsonData=await OrderDb().sendingOrder();
    var body = jsonEncode(jsonData);
    var response = await http.post(uri,
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer ${token.token}"
        },
        body: body);
    print(response.body);
    if (response.statusCode != 200) {
      return false;
    }
    await OrderDb().deActivateOrder().then((value) async => await OrderDb().initOrder());
    print("done!");
    return true;
  }
}