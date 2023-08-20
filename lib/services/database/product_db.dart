import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sadra_store/models/order_details.dart';
import 'package:sadra_store/models/product_detail.dart';
import 'package:sadra_store/models/product_detail_store_assets.dart';
import 'package:sadra_store/services/api/product_remote.dart';
import 'package:sadra_store/services/database/order_db.dart';
import 'package:sadra_store/services/database/order_detail_db.dart';
import 'package:sqflite/sqflite.dart';
import '../../models/order.dart';
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
      ProductDetail detail =
          details.singleWhere((el) => el.productId == product.productId);
      ProductDetailStoreAssets detailAssets = detailsStoreAssets
          .singleWhere((el) => el.productDetailId == detail.productDetailId);
      // checking deleted data
      if (product.deleted == 1) {
        //if product is in database
        if (await ProductDb().checkProductExist(product.productId)) {
          // checking product is in current order list or not
          OrderDetails orderDetails =
              await OrderDetailDb().getOrderDetail(detail.productDetailId!);
          if (orderDetails.orderClientId != 0) {
            // delete product form current order list if product exist in current order list
            await OrderDetailDb().delete(orderDetails);
          }
          // finally remove product and product details and store assets from databse
          await StoreAssetsDb().delete(detailAssets);
          await ProductDatailsDb().delete(detail);
          await delete(product);
        }
        // go to next product
        continue;
      }
      //init data
      await initProduct(product);
      await ProductDatailsDb().initDetails(detail, detailsStoreAssets);
      await StoreAssetsDb().initDetailAssets(detailAssets);
    }
    return true;
  }

  Future initProduct(Product product) async {
    if (await checkProductExist(product.productId)) {
      product.isFavorite = await checkIsFavoriteProduct(product);
      update(product);
    } else {
      product.isFavorite = false;
      store(product);
    }
  }

  Future<bool> checkIsFavoriteProduct(Product product) async {
    Database db = await database();
    List<Map<String, dynamic>> maps = await db.query(productTableName,
        where: "ProductId=?", whereArgs: [product.productId]);
    Product getProduct = Product.fromJson(maps.first);
    return getProduct.isFavorite!;
  }

  Future<List<Product>> getFavoritProducts() async {
    List<Product> favorits = List.empty();
    Database db = await database();
    List<Map<String, dynamic>> maps = await db.query(productTableName,
        where: "${ProductFields.isFavorite}=?", whereArgs: [1]);
    maps.isEmpty
        ? throw Exception(["محصول مورد علاقه ای وجود ندارد"])
        : favorits.addAll(maps.map((e) => Product.fromJson(e)));
    return favorits;
  }

  Future addToFavorit(Product product) async {
    Database db = await database();
    product.isFavorite = true;
    await db.update(productTableName, product.toJson(),
        where: "${ProductFields.productId}=?", whereArgs: [product.productId]);
  }

  Future removeFromFavorit(Product product) async {
    Database db = await database();
    product.isFavorite = false;
    await db.update(productTableName, product.toJson(),
        where: "${ProductFields.productId}=?", whereArgs: [product.productId]);
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

  Future delete(Product product) async {
    Database db = await database();
    db.delete(productTableName,
        where: "${ProductFields.productId}=?", whereArgs: [product.productId]);
  }
}

final productProvider = Provider<ProductDb>((ref) => ProductDb());
