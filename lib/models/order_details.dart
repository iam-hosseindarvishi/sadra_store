String orderDetailsTableName="order_details";
class OrderDetailsfields{
      static String id="id";
      static String orderClientId="orderClientId";
      static String itemType="itemType";
      static String productDetailId="productDetailId";
      static String price="price";
      static String count1="count1";
      static String description="description";
      static String storeId="storeId";
      static String rowVersion="rowVersion";
}
class OrderDetails {
  OrderDetails({
      this.itemType, 
      this.productDetailId, 
      this.price, 
      this.count1, 
      this.description, 
      this.storeId,
      this.rowVersion, 
      this.orderClientId,});

  OrderDetails.fromJson(dynamic json) {
    id=json['id'] as int;
    itemType = json['itemType'] as int;
    productDetailId = json['productDetailId'] as int;
    price = json['price'] as double;
    count1 = json['count1'] as double;
    description = json['description'] ;
    storeId = json['storeId'] as int;
    rowVersion = json['rowVersion'] ;
    orderClientId = json['orderClientId'] as int;
  }
  int? id;
  int? itemType;
  int? productDetailId;
  double? price;
  double? count1;
  String? description;
  int? storeId;
  int? rowVersion;
  int? orderClientId;

  Map<String, dynamic> toJson() => {
    'id':id,
    'itemType' : itemType,
    'productDetailId' : productDetailId,
    'price' : price,
    'count1' : count1,
    'description' : description,
    'storeId' : storeId,
    'rowVersion' : rowVersion,
    'orderClientId' : orderClientId,
  };

}