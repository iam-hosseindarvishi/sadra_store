import 'package:flutter/material.dart';
import 'package:sadra_store/size_config.dart';
import 'categories.dart';
import 'home_header.dart';
import 'popular_products.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
            child: Column(children: [
      SizedBox(
        height: getProportionateScreenWidth(30),
      ),
      const HomeHeader(),
      SizedBox(
        height: getProportionateScreenWidth(10),
      ),
      // a place for Surpise section for future
      const Categories(),
      SizedBox(
        height: getProportionateScreenWidth(10),
      ),
      const PopularProducts(),
    ])));
  }
}
