const String categoryTableNmae = "product_categories";

class CategoryFields {
  static const String productCategoryId = "productCategoryId";
  static const String productCategoryClientId = "productCategoryClientId";
  static const String productCategoryCode = "productCategoryCode";
  static const String name = "name";
  static const String color = "color";
  static const String icon = "icon";
  static const String deleted = "deleted";
  static const String dataHash = "dataHash";
  static const String rowVersion = "rowVersion";
}

class ProductCategory {
  int? productCategoryId;
  int? productCategoryClientId;
  int? productCategoryCode;
  String? name;
  String? color;
  dynamic icon;
  bool? deleted;
  String? dataHash;
  int? rowVersion;

  ProductCategory({
    this.productCategoryId,
    this.productCategoryClientId,
    this.productCategoryCode,
    this.name,
    this.color,
    this.icon,
    this.deleted,
    this.dataHash,
    this.rowVersion,
  });

  factory ProductCategory.fromJson(Map<String, dynamic> json) {
    return ProductCategory(
      productCategoryId: json['ProductCategoryId'] as int?,
      productCategoryClientId: json['ProductCategoryClientId'] as int?,
      productCategoryCode: json['ProductCategoryCode'] as int?,
      name: json['Name'] as String?,
      color: json['Color'] as String?,
      icon: json['Icon'] as dynamic,
      deleted: json['Deleted'] as bool?,
      dataHash: json['DataHash'] as String?,
      rowVersion: json['RowVersion'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
        'ProductCategoryId': productCategoryId,
        'ProductCategoryClientId': productCategoryClientId,
        'ProductCategoryCode': productCategoryCode,
        'Name': name,
        'Color': color,
        'Icon': icon,
        'Deleted': deleted == false ? 0 : 1,
        'DataHash': dataHash,
        'RowVersion': rowVersion,
      };
}
