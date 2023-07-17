import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sadra_store/models/product_detail.dart';
import 'package:sqflite/sqflite.dart';

import 'core.dart';

class ProductDatailsDb extends CoreDatabase {
  Future<int> store(ProductDetail productDetail) async {
    Database db = await database();
    return await db.insert(productDatailTableName, productDetail.toJson());
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
}

final detailProvider = Provider<ProductDatailsDb>((ref) => ProductDatailsDb());