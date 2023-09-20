import 'package:sadra_store/models/token.dart';

import '../services/api/user_remote.dart';
import '../services/database/user_db.dart';

const String userTableName = "user";

class UserFields {
  static const String personId = "PersonId";
  static const String personClientId = "PersonClientId";
  static const String personCode = "PersonCode";
  static const String personGroupId = "PersonGroupId";
  static const String personType = "PersonType";
  static const String prifix = "Prifix";
  static const String firstName = "FirstName";
  static const String lastName = "LastName";
  static const String organization = "Organization";
  static const String gender = "Gender";
  static const String email = "Email";
  static const String userName = "UserName";
  static const String password = "Password";
  static const String address = "Address";
  static const String phone = "Phone";
  static const String mobile = "Mobile";
  static const String deleted = "Deleted";
  static const String dataHash = "DataHash";
  static const String rowVersion = "RowVersion";
  static const String personGroupClientId = "PersonGroupClientId";
  static const String personGroupCode = "PersonGroupCode";
  static const String visitorID = "VisitorId";
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
  int? deleted;
  String? dataHash;
  int? rowVersion;
  int? personGroupClientId;
  int? personGroupCode;
  int? visitorId;
  User(
      {this.personId,
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
      this.visitorId});

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
      deleted: json['Deleted'] == false ? 0 : 1,
      dataHash: json['DataHash'] as String?,
      rowVersion: json['RowVersion'] as int?,
      personGroupClientId: json['PersonGroupClientId'] as int?,
      personGroupCode: json['PersonGroupCode'] as int?,
      visitorId: json["VisitorId"] as int?);

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
        'Deleted': deleted,
        'DataHash': dataHash,
        'RowVersion': rowVersion,
        'PersonGroupClientId': personGroupClientId,
        'PersonGroupCode': personGroupCode,
        "VisitorId": visitorId
      };

  Future<bool> login(String phone, String password) async {
    try {
      User user;
      user = await UserApi().getUser(phone, password);
      // ignore: unrelated_type_equality_checks
      if (user.deleted == false) {
        throw Exception("نام کاربری یا رمز عبور اشتباه است");
      }
      if (await UserDb().checkUserExsist()) {
        await UserDb().update(user);
      } else {
        await UserDb().store(user);
      }
      return true;
    } catch (e) {
      // throw Exception("نام کاربری یا رمز عبور اشتباه است");
      throw Exception(e);
    }
  }
}
