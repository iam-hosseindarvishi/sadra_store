import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sadra_store/models/product_detail.dart';
import 'package:sadra_store/models/product_detail_store_assets.dart';
import 'package:sadra_store/services/api/product_remote.dart';
import 'package:sqflite/sqflite.dart';
import '../../models/product.dart';
import 'core.dart';
import 'detail_db.dart';
import 'store_assets_db.dart';

class ProductDb extends CoreDatabase {
  // save signle product
  Future<int> store(Product product) async {
    Database db = await database();
    return await db.insert(productTableName, product.toJson());
  }

  // get And save products from api
  Future<bool> storeFromApi() async {
    final List<Product> products = await ProductApi().getProducts();
    final List<ProductDetail> details = await ProductApi().getProductsDatails();
    final List<ProductDetailStoreAssets> detailsStoreAssets =
        await ProductApi().getDetailAssets();
    for (var product in products) {
      await initProduct(product);
      ProductDetail detail =
          details.singleWhere((el) => el.productId == product.productId);
      await ProductDatailsDb().initDetails(detail, detailsStoreAssets);
      ProductDetailStoreAssets detailAssets = detailsStoreAssets
          .singleWhere((el) => el.productDetailId == detail.productDetailId);
      await StoreAssetsDb().initDetailAssets(detailAssets);
    }
    return true;
  }

  Future initProduct(Product product) async {
    await checkProductExist(product.productId)
        ? update(product)
        : store(product);
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
