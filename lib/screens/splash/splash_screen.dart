import 'package:flutter/material.dart';
import 'package:sadra_store/constants/size_config.dart';
import './components/body.dart';

class SplashScreen extends StatelessWidget {
  static String routeName = "/spllash";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return const Scaffold(
      body: Body(),
    );
  }
}
