import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../models/Product.dart';
import '../../../size_config.dart';
import '../../details/details_screen.dart';

class BuildListView extends StatelessWidget {
  const BuildListView({
    super.key,
    required this.products,
    this.imageAspectRatio = 1,
    this.showPrice = false,
  });
  final List<Product> products;
  final double imageAspectRatio;
  final bool showPrice;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: products.length,
        itemBuilder: (_, int index) {
          return InkWell(
            onTap: () {
              Navigator.pushNamed(context, DetailsScreen.routeName,
                  arguments: ProductDetailsArguments(products[index]));
            },
            child: Container(
              margin: const EdgeInsets.only(top: 15, left: 10, right: 10),
              height: getProportionateScreenHeight(50 * 2),
              padding: EdgeInsets.symmetric(
                  vertical: getProportionateScreenWidth(10),
                  horizontal: getProportionateScreenWidth(10)),
              decoration: BoxDecoration(
                  color: kSecondaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AspectRatio(
                    aspectRatio: imageAspectRatio,
                    child: Image.asset(products[index].images[0]),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        products[index].title,
                        style: const TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        showPrice == true
                            ? '${products[index].price} ریال'
                            : 'امکان مشاهده قیمت وجود ندارد',
                        maxLines: 2,
                        style: const TextStyle(
                            color: Colors.deepOrange,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }
}
