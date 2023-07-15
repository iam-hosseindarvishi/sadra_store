import 'package:flutter/material.dart';
import 'package:sadra_store/constants/size_config.dart';
import '../../../models/product.dart';
import 'product_add_to_cart.dart';
import 'product_description.dart';
import 'product_images.dart';

class Body extends StatelessWidget {
  Body({Key? key, required this.product}) : super(key: key);
  final Product product;
  int count = 1;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: getProportionateScreenWidth(20),
        ),
        ProtuctImages(product: product),
        SizedBox(
          height: getProportionateScreenWidth(20),
        ),
        ProductDescription(
          product: product,
          pressOnSeeMore: () {},
        ),
        OrderWidget(),
      ],
    );
  }
}
