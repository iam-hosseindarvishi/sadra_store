
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sadra_store/models/Cart.dart';
import 'package:sadra_store/models/product_detail.dart';
import 'package:sadra_store/services/database/order_db.dart';
import 'package:sadra_store/services/database/product_db.dart';
import 'package:sqflite/sqflite.dart';
import '../../models/order.dart';
import '../../models/order_details.dart';
import '../../models/product.dart';
import 'core.dart';
import 'detail_db.dart';

class OrderDetailDb extends CoreDatabase{

  Future<int> store(OrderDetails orderDetails) async{
        Database db=await database();
        return db.insert(orderDetailsTableName, orderDetails.toJson());
  }
  Future<OrderDetails> getOrderDetail(int productDetailId ,int orderClientId) async{
    Database db=await database();
    List<Map<String,dynamic>> maps=await db.query(orderDetailsTableName,where: "${OrderDetailsfields.productDetailId}=? AND ${OrderDetailsfields.orderClientId}=?",whereArgs: [productDetailId,orderClientId]);
    return maps.isNotEmpty ? OrderDetails.fromJson(maps.first) :OrderDetails(orderClientId: 0);
  }
  Future<List<OrderDetails>> getOrderDetailsList()async{
    Database db=await database();
    final order=await OrderDb().getCurrentOrder();
    List<OrderDetails> orderDetailsList=[];
    List<Map<String,dynamic>> maps=await db.query(orderDetailsTableName,where: "${OrderDetailsfields.orderClientId}=?",whereArgs: [order.orderClientId]);
    if(maps.isNotEmpty){
      orderDetailsList.addAll(maps.map((e) => OrderDetails.fromJson(e)));
    }else{
      throw Exception('لیست خرید خالی است');
    }
    return orderDetailsList;
  }
  Future<List<Cart>> getOrderProducts() async{
    Database db=await database();
    Order order=await OrderDb().getCurrentOrder();
    List<Map<String,dynamic>> maps=await db.query(orderDetailsTableName,where:"${OrderDetailsfields.orderClientId}=?",whereArgs: [order.orderClientId] );
    List<OrderDetails> orderDetails=[];
    if(maps.isNotEmpty){
      orderDetails.addAll(maps.map((e) => OrderDetails.fromJson(e)));
    }
    List<Cart> cartItems=[];
    for(var orderDetail in orderDetails){
        ProductDetail productDetail=await ProductDatailsDb().getDetailUsingDetailId(orderDetail.productDetailId!);
        Product item=await ProductDb().getProduct(productDetail.productId!);
        Cart cart=Cart(orderDetail: orderDetail, product: item);
        cartItems.add(cart);
    }
    return cartItems;
  }
  Future<int> getOrderCount()async{
      Database db=await database();
      Order order=await OrderDb().getCurrentOrder();
      List<Map<String,dynamic>> maps=await db.query(orderDetailsTableName,where: "${OrderDetailsfields.orderClientId}=?",whereArgs: [order.orderClientId]);
      return maps.isNotEmpty ? maps.length : 0;
  }
  Future<int> update(OrderDetails orderDetails ) async{
      Database db=await database();
      return db.update(orderDetailsTableName, orderDetails.toJson(),where: " ${OrderDetailsfields.id}=?",whereArgs: [orderDetails.id]);
  }
  Future<double> getOrderPrice()async{
    double totalPrice=0.0;
   final orderDetailList=await getOrderDetailsList();
   for(var item in orderDetailList){
     totalPrice += (item.count1! * item.price!);
   }
   return totalPrice;
  }
  Future delete(OrderDetails orderDetails) async{
    Database db=await database();
    db.delete(orderDetailsTableName,where: "${OrderDetailsfields.id}=?",whereArgs: [orderDetails.id]);
  }

}

final orderProductProvider = Provider<OrderDetailDb>((ref) => OrderDetailDb());
