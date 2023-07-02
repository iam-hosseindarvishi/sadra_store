import 'package:flutter/material.dart';

import 'constants.dart';

ThemeData theme() {
  return ThemeData(
    brightness: Brightness.light,
    appBarTheme: appBarTheme(),
    scaffoldBackgroundColor: Colors.grey[100],
    visualDensity: VisualDensity.adaptivePlatformDensity,
    fontFamily: 'Vazir',
    textTheme: textTheme(),
    useMaterial3: true,
    inputDecorationTheme: inputDecorationTheme(),
  );
}

TextTheme textTheme() {
  return const TextTheme(
      bodyLarge: TextStyle(color: kTextColor),
      bodyMedium: TextStyle(color: kTextColor),
      bodySmall: TextStyle(color: kTextColor));
}

AppBarTheme appBarTheme() {
  return const AppBarTheme(
      iconTheme: IconThemeData(color: Colors.black),
      color: Colors.white,
      elevation: 0,
      titleTextStyle: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: Color(
          0xFF8B8B8B,
        ),
      ));
}

InputDecorationTheme inputDecorationTheme() {
  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(20),
    borderSide: BorderSide(color: kTextColor),
    gapPadding: 10,
  );

  return InputDecorationTheme(
    contentPadding: EdgeInsets.symmetric(horizontal: 42, vertical: 20),
    enabledBorder: outlineInputBorder,
    focusedBorder: outlineInputBorder,
    border: outlineInputBorder,
  );
}

SnackBar buildAlertSnackBar(
  Duration duration,
  Color backgroundColor,
  String massage,
  Icon icon,
  Color massageColor,
) {
  return SnackBar(
      animation: kAlwaysCompleteAnimation,
      duration: duration,
      backgroundColor: backgroundColor,
      content: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              massage,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: massageColor,
              ),
            ),
            icon
          ],
        ),
      ));
}
