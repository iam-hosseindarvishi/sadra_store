import 'package:flutter/material.dart';

import '../../../constants/constants.dart';
import '../../../models/Product.dart';
import '../../details/details_screen.dart';

class BuildGridView extends StatelessWidget {
  const BuildGridView({
    super.key,
    required this.products,
    this.crossAxisCount = 2,
    this.childAspectRatio = 1,
    this.crossAxisSpacing = 5,
    this.mainAxisSpacing = 5,
    this.showPrice = false,
  });

  final List<Product> products;
  final int crossAxisCount;
  final double childAspectRatio, crossAxisSpacing, mainAxisSpacing;
  final bool showPrice;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          childAspectRatio: childAspectRatio,
          crossAxisSpacing: crossAxisSpacing,
          mainAxisSpacing: mainAxisSpacing,
        ),
        itemCount: products.length,
        itemBuilder: (_, int index) {
          return InkWell(
            onTap: () {
              Navigator.pushNamed(context, DetailsScreen.routeName,
                  arguments: ProductDetailsArguments(products[index]));
            },
            child: Container(
              decoration: BoxDecoration(
                  color: kSecondaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(15)),
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: showPrice == true
                    ? MainAxisAlignment.spaceBetween
                    : MainAxisAlignment.spaceAround,
                children: [
                  AspectRatio(
                      aspectRatio: 3 / 2,
                      child: Image.asset(products[index].images[0])),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        products[index].title,
                        style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Text(
                            showPrice == true
                                ? '${products[index].price} ریال'
                                : 'امکان مشاهده قیمت  وجود ندارد',
                            maxLines: 2,
                            style: const TextStyle(
                                color: Colors.deepOrange,
                                fontWeight: FontWeight.w600,
                                fontSize: 12),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }
}
