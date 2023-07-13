import 'package:sqflite/sqflite.dart';
import '../../models/Product.dart';
import 'core.dart';

class ProductDb extends CoreDatabase {
  Future<int> sotre(Product product) async {
    Database db = await database();
    return await db.insert(productTableName, product.toJson());
  }

  Future<int> update(Product product, int id) async {
    Database db = await database();
    return db.update(productTableName, product.toJson(),
        where: "productId=?", whereArgs: [id]);
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
}
