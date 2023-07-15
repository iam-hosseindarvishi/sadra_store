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

  Product({
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
      );

  Map<String, dynamic> toJson() => {
        'productId': productId,
        'productClientId': productClientId,
        'productCode': productCode,
        'productCategoryId': productCategoryId,
        'name': name,
        'unitName': unitName,
        'description': description,
        'deleted': deleted,
        'rowVersion': rowVersion,
        'productCategoryClientId': productCategoryClientId,
        'productCategoryCode': productCategoryCode,
      };

  List<Product> demoProducts = [];
}
