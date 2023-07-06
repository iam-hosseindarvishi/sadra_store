import 'package:flutter/material.dart';

import 'size_config.dart';

// App Title & company Name

const String appTitle = "عمده فروشی صدرا";

const kPrimaryColor = Color(0xFFFF7643);
const kPrimaryLightColor = Color(0xFFFFECDF);
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFFFFA53E), Color(0xFFFF7643)],
);
const kSecondaryColor = Color(0xFF979797);
const kTextColor = Color(0xFF757575);
const kAnimationDuartion = Duration(milliseconds: 200);

// Form errors

const String kPhonNullError = "شماره تلفن نمیتواند خالی باشد";
const String kInvalidPhonError = "شماره تلفن وارد شده معتبر نمیباشد !";
const String kPassNullError = "کلمه عبور نمیتواند خالی باشد";
const String kShortPassError = "کلمه عبور بسیار کوتاه است";
const String kMatchPassError = "کلمه عبور وارد شده صحیح نمیباشد";

// heading style

final headingStyle = TextStyle(
    fontSize: getProportionateScreenWidth(28),
    fontWeight: FontWeight.bold,
    color: Colors.black,
    height: 1.5);

// remote data constanst

const Map apiInfo = {
  "userName": "2512140",
  "packageNo": "2512140",
  "password": "069515",
  "databaseId": 2790027,
  "language": "fa",
};

const String baseUri = "mahakacc.mahaksoft.com";
