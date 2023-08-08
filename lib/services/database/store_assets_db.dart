import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sqflite/sqflite.dart';
import '../../models/product_detail_store_assets.dart';
import './core.dart';

class StoreAssetsDb extends CoreDatabase {
  Future<int> store(ProductDetailStoreAssets productDetailStoreAssets) async {
    Database db = await database();
    return db.insert(
        detailStoreAssetTableName, productDetailStoreAssets.toJson());
  }

  Future initDetailAssets(ProductDetailStoreAssets detailStoreAssets) async {
    await checkAssetsExist(detailStoreAssets.productDetailId)
        ? update(detailStoreAssets)
        : store(detailStoreAssets);
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
        where: "${StoreAssetsTableFields.productDetailId}=?",
        whereArgs: [detail.productDetailId]);
  }

  Future<bool> checkAssetsExist([int? detailAssetsId]) async {
    Database db = await database();
    List<Map<String, dynamic>> maps = detailAssetsId == null
        ? await db.query(detailStoreAssetTableName)
        : await db.query(detailStoreAssetTableName,
            where: "${StoreAssetsTableFields.productDetailId}=?",
            whereArgs: [detailAssetsId]);
    return maps.isEmpty ? false : true;
  }
  Future delete(ProductDetailStoreAssets storeAssets)async{
    Database db=await database();
    db.delete(detailStoreAssetTableName,where: "${StoreAssetsTableFields.productDetailId}=?",whereArgs: [storeAssets.productDetailId]);
  }
}

final storeAssetsProvider = Provider<StoreAssetsDb>((ref) => StoreAssetsDb());
