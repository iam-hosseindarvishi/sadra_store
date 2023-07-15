import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../models/product.dart';
import '../database/product_db.dart';

final productDataProdiver = FutureProvider<List<Product>>((ref) {
  return ref.watch(productProvider).getProducts();
});
