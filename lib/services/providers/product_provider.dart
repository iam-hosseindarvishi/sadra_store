import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sadra_store/models/product_detail.dart';
import 'package:sadra_store/models/product_detail_store_assets.dart';
import 'package:sadra_store/services/database/detail_db.dart';
import '../../models/product.dart';
import '../database/product_db.dart';
import '../database/store_assets_db.dart';

final productDataProvider = FutureProvider<List<Product>>((ref) {
  return ref.watch(productProvider).getProducts();
});

final productDetailProvider =
    FutureProvider.family<ProductDetail, int>((ref, productId) {
  return ref.read(detailProvider).getDetail(productId);
});
final productStoreAssetsProvider =
    FutureProvider.family<ProductDetailStoreAssets, int>(
        (ref, productAssetsId) {
  return ref.read(storeAssetsProvider).getDetail(productAssetsId);
});

// // init data from server
// final getProductFromServer = FutureProvider<List<Product>>((ref) {
//   return ref.read(initProductsProvider).getProducts();
// });
// final getProductDetailsFromServer = FutureProvider<List<ProductDetail>>((ref) {
//   return ref.read(initProductsProvider).getProductsDatails();
// });
// final getProductDetailAssetsFromServer =
//     FutureProvider<List<ProductDetailStoreAssets>>((ref) {
//   return ref.read(initProductsProvider).getDetailAssets();
// });
