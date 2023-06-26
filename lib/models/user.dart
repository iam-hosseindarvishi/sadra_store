class User {
  int? personId;
  int? personClientId;
  int? personCode;
  int? personGroupId;
  int? personType;
  String? prifix;
  String? firstName;
  String? lastName;
  dynamic organization;
  int? gender;
  dynamic nationalCode;
  int? credit;
  int? balance;
  String? email;
  String? userName;
  String? password;
  int? discountPercent;
  int? sellPriceLevel;
  dynamic state;
  dynamic city;
  int? cityCode;
  dynamic zone;
  String? address;
  int? latitude;
  int? longitude;
  String? phone;
  String? mobile;
  String? fax;
  String? description;
  dynamic financeTaxPayerType;
  dynamic economicNo;
  dynamic postalCode;
  bool? deleted;
  String? dataHash;
  DateTime? createDate;
  DateTime? updateDate;
  int? createSyncId;
  int? updateSyncId;
  int? rowVersion;
  int? personGroupClientId;
  int? personGroupCode;

  User({
    this.personId,
    this.personClientId,
    this.personCode,
    this.personGroupId,
    this.personType,
    this.prifix,
    this.firstName,
    this.lastName,
    this.organization,
    this.gender,
    this.nationalCode,
    this.credit,
    this.balance,
    this.email,
    this.userName,
    this.password,
    this.discountPercent,
    this.sellPriceLevel,
    this.state,
    this.city,
    this.cityCode,
    this.zone,
    this.address,
    this.latitude,
    this.longitude,
    this.phone,
    this.mobile,
    this.fax,
    this.description,
    this.financeTaxPayerType,
    this.economicNo,
    this.postalCode,
    this.deleted,
    this.dataHash,
    this.createDate,
    this.updateDate,
    this.createSyncId,
    this.updateSyncId,
    this.rowVersion,
    this.personGroupClientId,
    this.personGroupCode,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        personId: json['PersonId'] as int?,
        personClientId: json['PersonClientId'] as int?,
        personCode: json['PersonCode'] as int?,
        personGroupId: json['PersonGroupId'] as int?,
        personType: json['PersonType'] as int?,
        prifix: json['Prifix'] as String?,
        firstName: json['FirstName'] as String?,
        lastName: json['LastName'] as String?,
        organization: json['Organization'] as dynamic,
        gender: json['Gender'] as int?,
        nationalCode: json['NationalCode'] as dynamic,
        credit: json['Credit'] as int?,
        balance: json['Balance'] as int?,
        email: json['Email'] as String?,
        userName: json['UserName'] as String?,
        password: json['Password'] as String?,
        discountPercent: json['DiscountPercent'] as int?,
        sellPriceLevel: json['SellPriceLevel'] as int?,
        state: json['State'] as dynamic,
        city: json['City'] as dynamic,
        cityCode: json['CityCode'] as int?,
        zone: json['Zone'] as dynamic,
        address: json['Address'] as String?,
        latitude: json['Latitude'] as int?,
        longitude: json['Longitude'] as int?,
        phone: json['Phone'] as String?,
        mobile: json['Mobile'] as String?,
        fax: json['Fax'] as String?,
        description: json['Description'] as String?,
        financeTaxPayerType: json['FinanceTaxPayerType'] as dynamic,
        economicNo: json['EconomicNo'] as dynamic,
        postalCode: json['PostalCode'] as dynamic,
        deleted: json['Deleted'] as bool?,
        dataHash: json['DataHash'] as String?,
        createDate: json['CreateDate'] == null
            ? null
            : DateTime.parse(json['CreateDate'] as String),
        updateDate: json['UpdateDate'] == null
            ? null
            : DateTime.parse(json['UpdateDate'] as String),
        createSyncId: json['CreateSyncId'] as int?,
        updateSyncId: json['UpdateSyncId'] as int?,
        rowVersion: json['RowVersion'] as int?,
        personGroupClientId: json['PersonGroupClientId'] as int?,
        personGroupCode: json['PersonGroupCode'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'PersonId': personId,
        'PersonClientId': personClientId,
        'PersonCode': personCode,
        'PersonGroupId': personGroupId,
        'PersonType': personType,
        'Prifix': prifix,
        'FirstName': firstName,
        'LastName': lastName,
        'Organization': organization,
        'Gender': gender,
        'NationalCode': nationalCode,
        'Credit': credit,
        'Balance': balance,
        'Email': email,
        'UserName': userName,
        'Password': password,
        'DiscountPercent': discountPercent,
        'SellPriceLevel': sellPriceLevel,
        'State': state,
        'City': city,
        'CityCode': cityCode,
        'Zone': zone,
        'Address': address,
        'Latitude': latitude,
        'Longitude': longitude,
        'Phone': phone,
        'Mobile': mobile,
        'Fax': fax,
        'Description': description,
        'FinanceTaxPayerType': financeTaxPayerType,
        'EconomicNo': economicNo,
        'PostalCode': postalCode,
        'Deleted': deleted,
        'DataHash': dataHash,
        'CreateDate': createDate?.toIso8601String(),
        'UpdateDate': updateDate?.toIso8601String(),
        'CreateSyncId': createSyncId,
        'UpdateSyncId': updateSyncId,
        'RowVersion': rowVersion,
        'PersonGroupClientId': personGroupClientId,
        'PersonGroupCode': personGroupCode,
      };
}
