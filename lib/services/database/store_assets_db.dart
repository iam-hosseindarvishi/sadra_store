import 'package:sqflite/sqflite.dart';

import '../../models/product_detail_store_assets.dart';
import './core.dart';

class StoreAssetsDb extends CoreDatabase {
  Future<int> store(ProductDetailStoreAssets productDetailStoreAssets) async {
    Database db = await database();
    return db.insert(
        detailStoreAssetTableName, productDetailStoreAssets.toJson());
  }

  Future<ProductDetailStoreAssets> getDetail(int id) async {
    Database db = await database();
    final List<Map<String, dynamic>> maps = await db.query(
        detailStoreAssetTableName,
        where: "${StoreAssetsTableFields.productDetailId}=?",
        whereArgs: [id]);

    return maps.isNotEmpty
        ? ProductDetailStoreAssets.fromJson(maps.first)
        : throw Exception(["مشخصات کالا یافت نشد"]);
  }

  Future<List<ProductDetailStoreAssets>> getDetails() async {
    Database db = await database();
    final List<Map<String, dynamic>> maps =
        await db.query(detailStoreAssetTableName);
    List<ProductDetailStoreAssets> details = [];
    maps.isEmpty
        ? throw Exception(["رکوردی یافت نشد"])
        : details.addAll(maps.map((e) => ProductDetailStoreAssets.fromJson(e)));
    return details;
  }

  Future<int> update(ProductDetailStoreAssets detail) async {
    Database db = await database();
    return db.update(detailStoreAssetTableName, detail.toJson(),
        where: "${detail.productDetailId}=?",
        whereArgs: [detail.productDetailId]);
  }
}
