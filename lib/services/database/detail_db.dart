import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sadra_store/models/product_detail.dart';
import 'package:sadra_store/models/product_detail_store_assets.dart';
import 'package:sqflite/sqflite.dart';
import 'core.dart';

class ProductDatailsDb extends CoreDatabase {
  Future<int> store(ProductDetail productDetail) async {
    Database db = await database();
    return await db.insert(productDatailTableName, productDetail.toJson());
  }

  Future initDetails(ProductDetail detail,
      List<ProductDetailStoreAssets> detailStoreAssets) async {
    await checkDetailExist(detail.productId) ? update(detail) : store(detail);
  }

  Future<bool> checkDetailExist([int? id]) async {
    Database db = await database();
    List<Map<String, dynamic>> maps = id == null
        ? await db.query(productDatailTableName)
        : await db.query(productDatailTableName,
            where: "ProductId=?", whereArgs: [id]);
    return maps.isEmpty ? false : true;
  }

  Future<int> update(ProductDetail productDetail) async {
    Database db = await database();
    return db.update(productDatailTableName, productDetail.toJson(),
        where: "ProductId=?", whereArgs: [productDetail.productId]);
  }

  Future<List<ProductDetail>> getDetails() async {
    Database db = await database();
    List<Map<String, dynamic>> maps = await db.query(productDatailTableName);
    List<ProductDetail> datails = [];
    datails.addAll(maps.map((e) => ProductDetail.fromJson(e)));
    return datails;
  }

  Future<ProductDetail> getDetail(int id) async {
    Database db = await database();
    List<Map<String, dynamic>> maps = await db
        .query(productDatailTableName, where: "ProductId=?", whereArgs: [id]);
    return maps.isEmpty
        ? throw Exception(["محصول یافت نشد"])
        : ProductDetail.fromJson(maps.first);
  }
  Future<ProductDetail> getDetailUsingDetailId(int id) async{
    Database db = await database();
    List<Map<String, dynamic>> maps = await db
        .query(productDatailTableName, where: "${ProductDatailFields.productDatailId}=?", whereArgs: [id]);
    return maps.isEmpty
        ? throw Exception(["محصول یافت نشد"])
        : ProductDetail.fromJson(maps.first);
  }
  Future delete(ProductDetail productDetail) async{
   Database db=await database();
   await db.delete(productDatailTableName,where: "ProductId=?",whereArgs: [productDetail.productId]);
  }
}

final detailProvider = Provider<ProductDatailsDb>((ref) => ProductDatailsDb());
