String orderTableName = "orders";

class OrderTableFields {
  static String orderClientId = "orderClientId";
  static String personId = "personId";
  static String visitorId = "visitorId";
  static String orderType = "orderType";
  static String personCode = "personCode";
  static String isActive = "isActive";
}

class Order {
  int? orderClientId;
  int? personId;
  int? visitorId;
  int? orderType;
  int? personCode;
  bool? isActive;
  Order({
    this.orderClientId,
    this.personId,
    this.visitorId,
    this.orderType,
    this.personCode,
    this.isActive,
  });

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        orderClientId: json['orderClientId'] as int?,
        personId: json['personId'] as int?,
        visitorId: json['visitorId'] as int?,
        orderType: json['orderType'] as int?,
        personCode: json['personCode'] as int?,
        isActive: json["isActive"] == 0 ? false : true,
      );

  Map<String, dynamic> toJson() => {
        'orderClientId': orderClientId,
        'personId': personId,
        'visitorId': visitorId,
        'orderType': orderType,
        'personCode': personCode,
        "isActive": isActive == true ?1 : 0
      };
}
