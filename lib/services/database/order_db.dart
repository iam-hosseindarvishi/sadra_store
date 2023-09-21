import 'dart:math';

import 'package:intl/intl.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import 'package:sadra_store/constants/constants.dart';
import 'package:sadra_store/services/database/order_detail_db.dart';
import 'package:sadra_store/services/database/user_db.dart';
import 'package:sqflite/sqflite.dart';

import '../../models/order.dart';
import '../../models/user.dart';
import 'core.dart';

class OrderDb extends CoreDatabase {
  Future<int> initOrder() async {
    Database db = await database();
    var user = await UserDb().getUser();
    int orderId;
    int now = DateTime.now().month +
        DateTime.now().day +
        DateTime.now().hour +
        DateTime.now().second +
        Random().nextInt(999);
    if (user.personCode! <= 0 || user.personCode == null) {
      throw Exception(["خطا در دریافت اطلاعات کاربر"]);
    }
    String orderIdString = user.personCode!.toString() + now.toString();
    orderId = int.parse(orderIdString);
    Order order = Order();
    order.orderClientId = orderId;
    order.personCode = user.personCode;
    order.personId = user.personId;
    order.visitorId = await UserDb().getVisitorId();
    order.orderType = 201;
    order.isActive = true;
    return db.insert(orderTableName, order.toJson());
  }

  Future<bool> deActivateOrder() async {
    Database db = await database();
    Order order = await getCurrentOrder();
    order.isActive = false;
    db.update(orderTableName, order.toJson(),
        where: "${OrderTableFields.orderClientId}=?",
        whereArgs: [order.orderClientId]);
    return true;
  }

  Future<Order> getCurrentOrder() async {
    Database db = await database();
    List<Map<String, dynamic>> maps = await db.query(orderTableName,
        where: "${OrderTableFields.isActive}=?", whereArgs: [1]);
    return maps.isNotEmpty ? Order.fromJson(maps.first) : Order();
  }

  Future<Map<String, dynamic>> sendingOrder() async {
    final order = await OrderDb().getCurrentOrder();
    final orderDetail = await OrderDetailDb().getOrderDetailsList();
    User user = await UserDb().getUser();
    Map<String, dynamic> orders = {
      "orders": [
        {
          "orderClientId": order.orderClientId,
          "personId": order.personId,
          "visitorId": order.visitorId,
          "orderType": order.orderType,
          "personCode": order.personCode,
          "personClientId": user.personClientId,
          // ignore: unnecessary_string_interpolations
          "orderDate": DateFormat('y-M-d').format(DateTime.now()).toString(),
          "deliveryDate": DateFormat('y-M-d').format(DateTime.now()).toString()
        }
      ],
      "orderDetails": List.generate(
          orderDetail.length,
          (index) => {
                "orderClientId": orderDetail[index].orderClientId,
                "itemType": orderDetail[index].itemType,
                "productDetailId": orderDetail[index].productDetailId,
                "price": orderDetail[index].price,
                "count1": orderDetail[index].count1,
                "storeId": orderDetail[index].storeId,
              }),
    };
    return orders;
  }
}
