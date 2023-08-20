const productTableName = "products";

class ProductFields {
  static const String productId = "ProductId";
  static const String productClientId = "ProductClientId";
  static const String productCode = "ProductCode";
  static const String productCategoryId = "ProductCategoryId";
  static const String name = "Name";
  static const String unitName = "UnitName";
  static const String description = "Description";
  static const String deleted = "Deleted";
  static const String rowVersion = "RowVersion";
  static const String productCategoryClientId = "ProductCategoryClientId";
  static const String productCategoryCode = "ProductCategoryCode";
  static const String isFavorite = "isFavorite";
}

class Product {
  int? productId;
  int? productClientId;
  int? productCode;
  int? productCategoryId;
  String? name;
  String? unitName;
  String? description;
  int? deleted;
  int? rowVersion;
  int? productCategoryClientId;
  int? productCategoryCode;
  bool? isFavorite;
  Product({
    this.isFavorite,
    this.productId,
    this.productClientId,
    this.productCode,
    this.productCategoryId,
    this.name,
    this.unitName,
    this.description,
    this.deleted,
    this.rowVersion,
    this.productCategoryClientId,
    this.productCategoryCode,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        productId: json['ProductId'] as int?,
        productClientId: json['ProductClientId'] as int?,
        productCode: json['ProductCode'] as int?,
        productCategoryId: json['ProductCategoryId'] as int?,
        name: json['Name'] as String?,
        unitName: json['UnitName'] as String?,
        description: json['Description'] as String?,
        deleted: json['Deleted'] == false ? 0 : 1,
        rowVersion: json['RowVersion'] as int?,
        productCategoryClientId: json['ProductCategoryClientId'] as int?,
        productCategoryCode: json['ProductCategoryCode'] as int?,
        isFavorite: json["isFavorite"] == 0 ? false : true,
      );

  Map<String, dynamic> toJson() => {
        'ProductId': productId,
        'ProductClientId': productClientId,
        'ProductCode': productCode,
        'ProductCategoryId': productCategoryId,
        'Name': name,
        'UnitName': unitName,
        'Description': description,
        'Deleted': deleted,
        'RowVersion': rowVersion,
        'ProductCategoryClientId': productCategoryClientId,
        'ProductCategoryCode': productCategoryCode,
        "isFavorite": isFavorite == false ? 0 : 1,
      };
}
