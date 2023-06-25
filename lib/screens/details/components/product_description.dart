import 'package:flutter/material.dart';

import '../../../constants/constants.dart';
import '../../../models/Product.dart';
import '../../../constants/size_config.dart';

class ProductDescription extends StatelessWidget {
  const ProductDescription({
    super.key,
    required this.product,
    required this.pressOnSeeMore,
  });

  final Product product;
  final GestureTapCallback pressOnSeeMore;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Column(
            children: [
              Text(
                product.title,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(
                height: 15,
              ),
              Text(product.description,
                  maxLines: 3,
                  style: Theme.of(context).textTheme.headlineSmall),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(20), vertical: 10),
          child: GestureDetector(
            onTap: pressOnSeeMore,
            child: const Row(children: [
              Text(
                "توضیحات بیشتر",
                style: TextStyle(
                    color: kPrimaryColor, fontWeight: FontWeight.w600),
              ),
              SizedBox(width: 5),
              Icon(
                Icons.arrow_forward,
                color: kPrimaryColor,
              )
            ]),
          ),
        )
      ],
    );
  }
}
