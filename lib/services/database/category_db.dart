import 'package:sqflite/sqflite.dart';

import '../../models/product_category.dart';
import 'core.dart';

class CategoryDb extends CoreDatabase {
  Future<int> store(ProductCategory category) async {
    Database db = await database();
    return await db.insert(categoryTableNmae, category.toJson());
  }

  Future<List<ProductCategory>> getAllCategoreis() async {
    Database db = await database();
    final List<Map<String, dynamic>> maps = await db.query(categoryTableNmae);
    List<ProductCategory> categories = [];
    categories.addAll(maps.map((e) {
      return ProductCategory.fromJson(e);
    }));
    return categories;
  }

  Future<bool> checkCategoryExsit([int? id]) async {
    Database db = await database();
    final List<Map<String, dynamic>> maps = id == null
        ? await db.query(categoryTableNmae)
        : await db.query(categoryTableNmae,
            where: "productCategoryId=?", whereArgs: [id]);
    if (maps.isEmpty) {
      return false;
    } else {
      return true;
    }
  }

  Future<int> update(ProductCategory productCategory, int id) async {
    Database db = await database();
    return await db.update(categoryTableNmae, productCategory.toJson(),
        where: "productCategoryId=?", whereArgs: [id]);
  }

  Future<ProductCategory> getCategory(int id) async {
    Database db = await database();
    final List<Map<String, dynamic>> maps = await db.query(categoryTableNmae,
        where: "productCategoryId=?", whereArgs: [id]);
    if (maps.isEmpty) {
      return ProductCategory();
    }
    return ProductCategory.fromJson(maps.first);
  }
}
