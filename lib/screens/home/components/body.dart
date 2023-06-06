import 'package:flutter/material.dart';
import 'package:sadra_store/size_config.dart';
import 'categories.dart';
import 'home_header.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      child: Column(children: [
        SizedBox(
          height: getProportionateScreenWidth(20),
        ),
        const HomeHeader(),
        // a place for Surpise section for future
        const Categories(),
      ]),
    ));
  }
}
