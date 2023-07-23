String detailStoreAssetTableName = "productDetailStoreAssets";

class StoreAssetsTableFields {
  static const String productDetailStoreAssetId = "ProductDetailStoreAssetId";
  static const String productDetailId = "ProductDetailId";
  static const String storeId = "StoreId";
  static const String count1 = "Count1";
  static const String count2 = "Count2";
  static const String deleted = "Deleted";
  static const String dataHash = "DataHash";
  static const String rowVersion = "RowVersion";
}

class ProductDetailStoreAssets {
  int? productDetailStoreAssetId;
  int? productDetailId;
  int? storeId;
  double? count1;
  double? count2;
  int? deleted;
  String? dataHash;
  int? rowVersion;

  ProductDetailStoreAssets({
    this.productDetailStoreAssetId,
    this.productDetailId,
    this.storeId,
    this.count1,
    this.count2,
    this.deleted,
    this.dataHash,
    this.rowVersion,
  });

  factory ProductDetailStoreAssets.fromJson(Map<String, dynamic> json) {
    return ProductDetailStoreAssets(
      productDetailStoreAssetId: json['ProductDetailStoreAssetId'] as int?,
      productDetailId: json['ProductDetailId'] as int?,
      storeId: json['StoreId'] as int?,
      count1: json['Count1'] as double?,
      count2: json['Count2'] as double?,
      deleted: json['Deleted'] as int?,
      dataHash: json['DataHash'] as String?,
      rowVersion: json['RowVersion'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
        'ProductDetailStoreAssetId': productDetailStoreAssetId,
        'ProductDetailId': productDetailId,
        'StoreId': storeId,
        'Count1': count1,
        'Count2': count2,
        'Deleted': deleted,
        'DataHash': dataHash,
        'RowVersion': rowVersion,
      };
}
