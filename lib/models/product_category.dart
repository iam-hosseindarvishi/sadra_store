const String categoryTableNmae = "product_categories";

class CategoryFields {
  static const String productCategoryId = "ProductCategoryId";
  static const String productCategoryClientId = "ProductCategoryClientId";
  static const String productCategoryCode = "ProductCategoryCode";
  static const String name = "Name";
  static const String color = "Color";
  static const String icon = "Icon";
  static const String deleted = "Deleted";
  static const String dataHash = "DataHash";
  static const String rowVersion = "RowVersion";
}

class ProductCategory {
  int? productCategoryId;
  int? productCategoryClientId;
  int? productCategoryCode;
  String? name;
  String? color;
  dynamic icon;
  int? deleted;
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
      deleted: json['Deleted'] == false ? 0 : 1,
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
        'Deleted': deleted,
        'DataHash': dataHash,
        'RowVersion': rowVersion,
      };
}
