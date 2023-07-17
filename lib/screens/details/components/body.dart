import 'package:flutter/material.dart';
import 'package:sadra_store/constants/size_config.dart';
import '../../../models/product.dart';
import 'product_description.dart';
import 'product_images.dart';

// ignore: must_be_immutable
class Body extends StatelessWidget {
  Body({Key? key, required this.product}) : super(key: key);
  final Product product;
  int count = 1;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
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
          ),
        ],
      ),
    );
  }
}
