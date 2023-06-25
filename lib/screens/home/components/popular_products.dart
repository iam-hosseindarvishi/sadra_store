import 'package:flutter/material.dart';
import 'package:sadra_store/screens/details/details_screen.dart';

import '../../../constants/constants.dart';
import '../../../models/Product.dart';
import '../../../constants/size_config.dart';
import 'product_card.dart';

class PopularProducts extends StatelessWidget {
  const PopularProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Title(
          color: kSecondaryColor,
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(10)),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("محبوب ترین محصولات"),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text("بیشتر"),
                  )
                ]),
          )),
      SizedBox(
        height: getProportionateScreenWidth(10),
      ),
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            ...List.generate(
                demoProducts.length,
                (index) => ProductCard(
                      product: demoProducts[index],
                      press: () {
                        Navigator.pushNamed(context, DetailsScreen.routeName,
                            arguments:
                                ProductDetailsArguments(demoProducts[index]));
                      },
                    ))
          ],
        ),
      )
    ]);
  }
}
