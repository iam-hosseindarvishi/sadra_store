import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sadra_store/services/database/detail_db.dart';
import 'package:sqflite/sqflite.dart';
import '../../models/product.dart';
import '../../models/product_detail.dart';
import '../api/api_services.dart';
import 'core.dart';

class ProductDb extends CoreDatabase {
  // save signle product
  Future<int> store(Product product) async {
    Database db = await database();
    return await db.insert(productTableName, product.toJson());
  }

  // get And save products from api
  Future<bool> storeFromApi() async {
    List<Product> products = await ApiServices().getProducts();
    List<ProductDetail> productsDatails =
        await ApiServices().getProductsDatails();

    for (var element in products) {
      var datail = productsDatails
          .singleWhere((el) => el.productId == element.productId);
      await checkProductExist(element.productId)
          ? await update(element)
          : await store(element);
      await ProductDatailsDb().checkDetailExist(element.productId)
          ? ProductDatailsDb().update(datail)
          : ProductDatailsDb().store(datail);
    }
    return true;
  }

  Future<int> update(Product product) async {
    Database db = await database();
    return db.update(productTableName, product.toJson(),
        where: "ProductId=?", whereArgs: [product.productId]);
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
            .query(productTableName, where: "ProductId=?", whereArgs: [id]);
    return maps.isEmpty ? false : true;
  }

  Future<Product> getProduct(int id) async {
    Database db = await database();
    List<Map<String, dynamic>> maps =
        await db.query(productTableName, where: "ProductId=?", whereArgs: [id]);
    return maps.isEmpty
        ? throw Exception(["محصول یافت نشد"])
        : Product.fromJson(maps.first);
  }
}

final productProvider = Provider<ProductDb>((ref) => ProductDb());
