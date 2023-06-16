import 'package:flutter/material.dart';
import '../../size_config.dart';
import 'components/body.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/home";
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return const Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          body: Body(),
        ));
  }
}