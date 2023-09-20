import 'package:sadra_store/models/order.dart';
import 'package:sadra_store/models/order_details.dart';
import 'package:sadra_store/models/product.dart';
import 'package:sadra_store/models/product_category.dart';
import 'package:sadra_store/models/product_detail.dart';
import 'package:sadra_store/models/product_detail_store_assets.dart';
import 'package:sadra_store/models/setting_model.dart';
import 'package:sadra_store/models/user.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../../models/token.dart';

const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
const primaryKey = 'INTEGER PRIMARY KEY';
// const boolType = 'BOOLEAN NOT NULL';
const doubleType = "REAL";
const integerType = 'INTEGER';
const textType = 'TEXT';

class CoreDatabase {
  Future<Database> database() async {
    return openDatabase(
      join(await getDatabasesPath(), 'sadra.db'),
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
            "CREATE TABLE $settingTableName (${SettingFialds.id} $idType  , ${SettingFialds.remmaberUser} $integerType , ${SettingFialds.lastTimeUpdate} $textType)");
        await db.execute(
            "CREATE TABLE $userTableName (${UserFields.personId} $primaryKey , ${UserFields.personClientId} $integerType , ${UserFields.personCode} $integerType,${UserFields.personGroupId} , ${UserFields.personType} $integerType , ${UserFields.prifix} $textType , ${UserFields.firstName} $textType , ${UserFields.lastName} $textType , ${UserFields.organization} $textType, ${UserFields.gender} $integerType , ${UserFields.email} $textType , ${UserFields.userName} $textType ,${UserFields.password} $textType , ${UserFields.address} $textType , ${UserFields.phone} $textType  , ${UserFields.mobile} $textType , ${UserFields.deleted} $integerType , ${UserFields.dataHash} $textType , ${UserFields.rowVersion} $integerType , ${UserFields.personGroupClientId} $integerType , ${UserFields.personGroupCode}  $integerType ,${UserFields.visitorID} $integerType )");
        await db.execute(
            "CREATE TABLE $categoryTableNmae (${CategoryFields.productCategoryId} $primaryKey , ${CategoryFields.productCategoryClientId} $integerType , ${CategoryFields.productCategoryCode} $integerType, ${CategoryFields.name} $textType , ${CategoryFields.color} $textType , ${CategoryFields.icon} $textType, ${CategoryFields.deleted} $integerType , ${CategoryFields.dataHash} $textType,${CategoryFields.rowVersion} $integerType )");
        await db.execute(
            "CREATE TABLE $productTableName (${ProductFields.productId} $primaryKey,${ProductFields.productClientId} $integerType,${ProductFields.productCode} $integerType,${ProductFields.productCategoryId} $integerType,${ProductFields.name} $textType, ${ProductFields.unitName} $textType,${ProductFields.description} $textType,${ProductFields.deleted} $integerType,${ProductFields.rowVersion} $integerType,${ProductFields.productCategoryClientId} $integerType,${ProductFields.productCategoryCode} $integerType , ${ProductFields.isFavorite} $integerType , FOREIGN KEY (${ProductFields.productCategoryId}) REFERENCES $categoryTableNmae (${CategoryFields.productCategoryId}))");
        await db.execute(
            "CREATE TABLE $productDatailTableName (${ProductDatailFields.productDatailId} $primaryKey,${ProductDatailFields.productDetailClientId},${ProductDatailFields.productClientId} $integerType,${ProductDatailFields.productDetailCode} $integerType, ${ProductDatailFields.productId} $integerType,${ProductDatailFields.count1} $doubleType,${ProductDatailFields.count2} $doubleType, ${ProductDatailFields.price1} $doubleType,${ProductDatailFields.deleted} $integerType , ${ProductDatailFields.dataHash} $textType,${ProductDatailFields.rowVersion} $integerType,${ProductDatailFields.productCode} $integerType , FOREIGN KEY (${ProductDatailFields.productId}) REFERENCES $productTableName (${ProductFields.productId}))");
        await db.execute(
            "CREATE TABLE $detailStoreAssetTableName (${StoreAssetsTableFields.productDetailStoreAssetId} $integerType , ${StoreAssetsTableFields.productDetailId} $primaryKey , ${StoreAssetsTableFields.storeId} $integerType , ${StoreAssetsTableFields.count1} $doubleType , ${StoreAssetsTableFields.count2} $doubleType , ${StoreAssetsTableFields.deleted} $integerType, ${StoreAssetsTableFields.dataHash} $textType , ${StoreAssetsTableFields.rowVersion} $integerType , FOREIGN KEY (${StoreAssetsTableFields.productDetailId}) REFERENCES $productDatailTableName (${ProductDatailFields.productDatailId}) )");
        await db.execute(
            "CREATE TABLE $orderTableName (${OrderTableFields.orderClientId} $primaryKey , ${OrderTableFields.orderType} $integerType , ${OrderTableFields.personId} $integerType , ${OrderTableFields.personCode} $integerType , ${OrderTableFields.visitorId} $integerType , ${OrderTableFields.isActive} $integerType)");
        await db.execute(
            "CREATE TABLE $orderDetailsTableName ( ${OrderDetailsfields.id} $idType, ${OrderDetailsfields.orderClientId} $integerType , ${OrderDetailsfields.itemType} $integerType , ${OrderDetailsfields.productDetailId} $integerType, ${OrderDetailsfields.price} $doubleType , ${OrderDetailsfields.count1} $doubleType , ${OrderDetailsfields.description} $textType , ${OrderDetailsfields.storeId} $integerType , ${OrderDetailsfields.rowVersion} $integerType , FOREIGN KEY (${OrderDetailsfields.orderClientId}) REFERENCES $orderTableName (${OrderTableFields.orderClientId}) )");
      },
      onUpgrade: (db, oldVersion, newVersion) async {},
    );
  }
}
