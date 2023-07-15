import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sqflite/sqflite.dart';
import '../../models/product.dart';
import '../api/api_services.dart';
import 'core.dart';

class ProductDb extends CoreDatabase {
  // save signle product
  Future<int> store(Product product) async {
    Database db = await database();
    try {
      return await db.insert(productTableName, product.toJson());
    } catch (e) {
      return 0;
    }
  }

  // get And save products from api
  Future<bool> storeFromApi() async {
    List<Product> products = await ApiServices().getProducts();
    if (await checkProductExist()) {
      if (products.isNotEmpty) {
        await deleteAll();
      } else {
        return false;
      }
    } else {
      return false;
    }
    for (var element in products) {
      await store(element);
    }
    return true;
  }

  Future<int> update(Product product) async {
    Database db = await database();
    return db.update(productTableName, product.toJson(),
        where: "productId=?", whereArgs: [product.productId]);
  }

  Future<List<Product>> getProducts() async {
    Database db = await database();
    List<Map<String, dynamic>> maps = await db.query(productTableName);
    List<Product> products = [];
    products.addAll(maps.map((e) => Product.fromJson(e)));
    return products;
  }

  Future<bool> checkProductExist([int? id]) async {
    Database db = await database();
    List<Map<String, dynamic>> maps = id == null
        ? await db.query(productTableName)
        : await db
            .query(productTableName, where: "productId=?", whereArgs: [id]);
    return maps.isEmpty ? false : true;
  }

  Future<Product> getProduct(int id) async {
    Database db = await database();
    List<Map<String, dynamic>> maps =
        await db.query(productTableName, where: "productId=?", whereArgs: [id]);
    return maps.isEmpty
        ? throw Exception(["محصول یافت نشد"])
        : Product.fromJson(maps.first);
  }

  Future<int> deleteAll() async {
    Database db = await database();
    return await db.delete(productTableName);
  }
}

final productProvider = Provider<ProductDb>((ref) => ProductDb());
