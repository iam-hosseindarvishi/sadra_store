import 'package:flutter/material.dart';
import 'package:sadra_store/models/Product.dart';
import 'product_add_to_cart.dart';
import 'product_description.dart';
import 'product_images.dart';
import 'top_rounded_container.dart';

class Body extends StatelessWidget {
  Body({Key? key, required this.product}) : super(key: key);
  final Product product;
  int count = 1;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProtuctImages(product: product),
        TopRoundedContainer(
          color: Colors.white,
          child: Column(
            children: [
              ProductDescription(
                product: product,
                pressOnSeeMore: () {},
              ),
              PrudoctAddToCart(),
            ],
          ),
        )
      ],
    );
  }
}
