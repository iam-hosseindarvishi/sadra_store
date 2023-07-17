const String productDatailTableName = "product_detail";

class ProductDatailFields {
  static const String productDatailId = "ProductDetailId";
  static const String productDetailClientId = "ProductDetailClientId";
  static const String productDetailCode = "ProductDetailCode";
  static const String productId = "ProductId";
  static const String count1 = "Count1";
  static const String count2 = "Count2";
  static const String price1 = "Price1";
  static const String deleted = "Deleted";
  static const String dataHash = "DataHash";
  static const String rowVersion = "RowVersion";
  static const String productClientId = "ProductClientId";
  static const String productCode = "ProductCode";
}

class ProductDetail {
  int? productDetailId;
  int? productDetailClientId;
  int? productDetailCode;
  int? productId;
  double? count1;
  double? count2;
  double? price1;
  int? deleted;
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
        productDetailId: json['ProductDetailId'] as int?,
        productDetailClientId: json['ProductDetailClientId'] as int?,
        productDetailCode: json['productDetailCode'] as int?,
        productId: json['ProductId'] as int?,
        count1: json['Count1'] as double?,
        count2: json['Count2'] as double?,
        price1: json['Price1'] as double?,
        deleted: json['Deleted'] == false ? 0 : 1,
        dataHash: json['DataHash'] as String?,
        rowVersion: json['RowVersion'] as int?,
        productClientId: json['ProductClientId'] as int?,
        productCode: json['ProductCode'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'ProductDetailId': productDetailId,
        'ProductDetailClientId': productDetailClientId,
        'ProductDetailCode': productDetailCode,
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
