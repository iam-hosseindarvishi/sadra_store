import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../models/Cart.dart';
import '../database/order_detail_db.dart';


final cartItemsProvider=FutureProvider<List<Cart>>((ref) => ref.watch(orderProductProvider).getOrderProducts());
final cartItemsCount=FutureProvider<int>((ref) => ref.watch(orderProductProvider).getOrderCount());
final orderPrice=FutureProvider<double>((ref) => ref.watch(orderProductProvider).getOrderPrice());