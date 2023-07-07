const String productDatailTableName = "product_datail";

class ProductDatailFields {
  static const String productDatailId = "productDatailId";
  static const String productDetailClientId = "productDetailClientId";
  static const String productDetailCode = "productDetailCode";
  static const String productId = "productId";
  static const String count1 = "count1";
  static const String count2 = "count2";
  static const String price1 = "price1";
  static const String deleted = "deleted";
  static const String dataHash = "dataHash";
  static const String rowVersion = "rowVersion";
  static const String productClientId = "productClientId";
  static const String productCode = "productCode";
}

class ProductDetail {
  int? productDetailId;
  int? productDetailClientId;
  int? productDetailCode;
  int? productId;
  int? count1;
  int? count2;
  int? price1;
  bool? deleted;
  String? dataHash;
  int? rowVersion;
  int? productClientId;
  int? productCode;

  ProductDetail({
    this.productDetailId,
    this.productDetailClientId,
    this.productDetailCode,
    this.productId,
    this.count1,
    this.count2,
    this.price1,
    this.deleted,
    this.dataHash,
    this.rowVersion,
    this.productClientId,
    this.productCode,
  });

  factory ProductDetail.fromJson(Map<String, dynamic> json) => ProductDetail(
        productDetailId: json['productDetailId'] as int?,
        productDetailClientId: json['productDetailClientId'] as int?,
        productDetailCode: json['productDetailCode'] as int?,
        productId: json['ProductId'] as int?,
        count1: json['Count1'] as int?,
        count2: json['Count2'] as int?,
        price1: json['Price1'] as int?,
        deleted: json['Deleted'] as bool?,
        dataHash: json['DataHash'] as String?,
        rowVersion: json['RowVersion'] as int?,
        productClientId: json['ProductClientId'] as int?,
        productCode: json['ProductCode'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'productDetailId': productDetailId,
        'productDetailClientId': productDetailClientId,
        'productDetailCode': productDetailCode,
        'ProductId': productId,
        'Count1': count1,
        'Count2': count2,
        'Price1': price1,
        'Deleted': deleted,
        'DataHash': dataHash,
        'RowVersion': rowVersion,
        'ProductClientId': productClientId,
        'ProductCode': productCode,
      };
}
