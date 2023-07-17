import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sadra_store/models/product_detail.dart';
import 'package:sadra_store/services/database/detail_db.dart';
import '../../models/product.dart';
import '../database/product_db.dart';

final productDataProvider = FutureProvider<List<Product>>((ref) {
  return ref.watch(productProvider).getProducts();
});

final productDetailProvider =
    FutureProvider.family<ProductDetail, int>((ref, productId) {
  return ref.read(detailProvider).getDetail(productId);
});