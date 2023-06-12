import 'package:flutter/material.dart';
import 'package:sadra_store/screens/cart/cart_screen.dart';
import 'package:sadra_store/screens/complate_profile/complate_profile_screen.dart';
import 'package:sadra_store/screens/details/details_screen.dart';
import 'package:sadra_store/screens/forgot_password/forgot_password_screen.dart';
import 'package:sadra_store/screens/home/home_screen.dart';
import 'package:sadra_store/screens/sign_in/sign_in_screen.dart';
import 'package:sadra_store/screens/sign_up/sign_up_screen.dart';
import '../screens/splash/splash_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  SignInScreen.routeName: (context) => const SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => const ForgotPasswordScreen(),
  SignUpScreen.routeName: (context) => const SignUpScreen(),
  ComplateProfileScreen.routeName: (context) => const ComplateProfileScreen(),
  HomeScreen.routeName: (context) => const HomeScreen(),
  DetailsScreen.routeName: (context) => const DetailsScreen(),
  CartScreen.routeName: (context) => const CartScreen(),
};
