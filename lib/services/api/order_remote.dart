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
    print("calling data");
    var jsonData=await OrderDb().sendingOrder();
    var body = jsonEncode(jsonData);

    var response = await http.post(uri,
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer ${token.token}"
        },
        body: body);
    if (response.statusCode != 200) {
      print("error ${response.reasonPhrase}");
      return false;
    }
    await OrderDb().deActivateOrder();
    await OrderDb().initOrder();
    print("done!");
    return true;
  }
}