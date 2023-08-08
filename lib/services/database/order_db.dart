
import 'dart:math';

import 'package:sadra_store/services/database/user_db.dart';
import 'package:sqflite/sqflite.dart';

import '../../models/order.dart';
import 'core.dart';

class OrderDb extends CoreDatabase{
  Future<int> initOrder() async{
   Database db=await database();
   var user=await UserDb().getUser();
   int orderId;
   int now=DateTime.now().month+DateTime.now().day+DateTime.now().second+Random().nextInt(999);
   if(user.personCode! <= 0  || user.personCode==null){
     throw Exception(["خطا در دریافت اطلاعات کاربر"]);
   }
   String orderIdString=user.personCode!.toString()+now.toString();
   orderId=int.parse(orderIdString);
   Order order=Order();
   order.orderClientId=orderId;
   order.personCode=user.personCode;
   order.personId=user.personId;
   order.visitorId=18804;
   order.orderType=201;
   order.isActive=true;
   return db.insert(orderTableName, order.toJson());
  }
  Future<Order> getCurrentOrder() async{

    Database db=await database();
    List<Map<String,dynamic>> maps=await db.query(orderTableName,where: "${OrderTableFields.isActive}=?",whereArgs: [1]);
    return maps.isNotEmpty ? Order.fromJson(maps.first):Order();
  }
  Future<bool> sendOrder(Order order) async{
    // currentOrder.isActive=false;
    // Database db=await database();

    Map<String,List> orders={
          "orders":[
            order.toJson()
          ],
        "orderDetails":[

        ]
    };

    return true;
  }
}