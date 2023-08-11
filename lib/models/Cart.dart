import 'product.dart';
import '../../models/order_details.dart';
class Cart {
  final Product product;
  final OrderDetails orderDetail;
  Cart({required this.orderDetail, required this.product});
}

// demo data

List<Cart> demoCarts = [];
