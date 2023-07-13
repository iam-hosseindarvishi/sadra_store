const productTableName = "products";

class ProductFields {
  static const String productId = "productId";
  static const String productClientId = "productClientId";
  static const String productCode = "productCode";
  static const String productCategoryId = "productCategoryId";
  static const String name = "name";
  static const String unitName = "unitName";
  static const String description = "description";
  static const String deleted = "deleted";
  static const String rowVersion = "rowVersion";
  static const String productCategoryClientId = "productCategoryClientId";
  static const String productCategoryCode = "productCategoryCode";
}

class Product {
  int? productId;
  int? productClientId;
  int? productCode;
  int? productCategoryId;
  String? name;
  String? unitName;
  String? description;
  bool? deleted;
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
        productId: json['productId'] as int?,
        productClientId: json['productClientId'] as int?,
        productCode: json['productCode'] as int?,
        productCategoryId: json['productCategoryId'] as int?,
        name: json['name'] as String?,
        unitName: json['unitName'] as String?,
        description: json['description'] as String?,
        deleted: json['deleted'] as bool?,
        rowVersion: json['rowVersion'] as int?,
        productCategoryClientId: json['productCategoryClientId'] as int?,
        productCategoryCode: json['productCategoryCode'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'productId': productId,
        'productClientId': productClientId,
        'productCode': productCode,
        'productCategoryId': productCategoryId,
        'name': name,
        'unitName': unitName,
        'description': description,
        'deleted': deleted == false ? 0 : 1,
        'rowVersion': rowVersion,
        'productCategoryClientId': productCategoryClientId,
        'productCategoryCode': productCategoryCode,
      };

  List<Product> demoProducts = [];
}
