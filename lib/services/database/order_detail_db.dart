
import 'package:sadra_store/models/product_detail.dart';
import 'package:sqflite/sqflite.dart';

import '../../models/order_details.dart';
import 'core.dart';
import 'detail_db.dart';

class OrderDetailDb extends CoreDatabase{

  Future<int> store(OrderDetails orderDetails) async{
        Database db=await database();
        return db.insert(orderDetailsTableName, orderDetails.toJson());
  }
  Future<OrderDetails> getOrderDetails(int productDetailId ,int orderClientId) async{
    Database db=await database();
    List<Map<String,dynamic>> maps=await db.query(orderDetailsTableName,where: "${OrderDetailsfields.productDetailId}=? AND ${OrderDetailsfields.orderClientId}=?",whereArgs: [productDetailId,orderClientId]);
    return maps.isNotEmpty ? OrderDetails.fromJson(maps.first) :OrderDetails(orderClientId: 0);
  }
  Future<int> update(OrderDetails orderDetails ) async{
      Database db=await database();
      return db.update(orderDetailsTableName, orderDetails.toJson(),where: "${OrderDetailsfields.productDetailId}=? AND ${OrderDetailsfields.orderClientId}=?",whereArgs: [orderDetails.productDetailId,orderDetails.orderClientId]);
  }
  Future delete(OrderDetails orderDetails) async{
    Database db=await database();
    db.delete(orderDetailsTableName,where: "${OrderDetailsfields.id}=?",whereArgs: [orderDetails.id]);
  }
}