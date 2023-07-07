const String userTableName = "user";

class UserFields {
  static const String personId = "personId";
  static const String personClientId = "personClientId";
  static const String personCode = "personCode";
  static const String personGroupId = "personGroupId";
  static const String personType = "personType";
  static const String prifix = "prifix";
  static const String firstName = "firstName";
  static const String lastName = "lastName";
  static const String organization = "organization";
  static const String gender = "gender";
  static const String email = "email";
  static const String userName = "userName";
  static const String password = "password";
  static const String address = "address";
  static const String phone = "phone";
  static const String mobile = "mobile";
  static const String deleted = "deleted";
  static const String dataHash = "dataHash";
  static const String rowVersion = "rowVersion";
  static const String personGroupClientId = "personGroupClientId";
  static const String personGroupCode = "personGroupCode";
}

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
  String? email;
  String? userName;
  String? password;
  String? address;
  String? phone;
  String? mobile;
  bool? deleted;
  String? dataHash;
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
    this.email,
    this.userName,
    this.password,
    this.address,
    this.phone,
    this.mobile,
    this.deleted,
    this.dataHash,
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
        email: json['Email'] as String?,
        userName: json['UserName'] as String?,
        password: json['Password'] as String?,
        address: json['Address'] as String?,
        phone: json['Phone'] as String?,
        mobile: json['Mobile'] as String?,
        deleted: json['Deleted'] as bool?,
        dataHash: json['DataHash'] as String?,
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
        'Email': email,
        'UserName': userName,
        'Password': password,
        'Address': address,
        'Phone': phone,
        'Mobile': mobile,
        'Deleted': deleted == false ? 0 : 1,
        'DataHash': dataHash,
        'RowVersion': rowVersion,
        'PersonGroupClientId': personGroupClientId,
        'PersonGroupCode': personGroupCode,
      };
}
