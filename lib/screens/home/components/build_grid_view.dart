import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../constants/constants.dart';
import '../../../models/product.dart';
import '../../details/details_screen.dart';
import 'product_image.dart';

class BuildGridView extends ConsumerWidget {
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
  Widget build(BuildContext context, WidgetRef ref) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          childAspectRatio: childAspectRatio,
          crossAxisSpacing: crossAxisSpacing,
          mainAxisSpacing: mainAxisSpacing,
        ),
        itemCount: products.length,
        itemBuilder: (_, int index) {
          return Animate(
            autoPlay: true,
            effects: const [
              FadeEffect(
                  begin: 0,
                  end: 1,
                  duration: Duration(seconds: 1),
                  delay: Duration(milliseconds: 15)),
            ],
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, DetailsScreen.routeName,
                    arguments: ProductDetailsArguments(products[index]));
              },
              child: Container(
                decoration: BoxDecoration(
                    color: kSecondaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(15)),
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: showPrice == true
                      ? MainAxisAlignment.spaceBetween
                      : MainAxisAlignment.spaceAround,
                  children: [
                    AspectRatio(
                        aspectRatio: 3 / 2,
                        child: ProductImage(
                          productID: products[index].productId!,
                        )),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          products[index].name!,
                          maxLines: 1,
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
                                  ? '${products[index].description} ریال'
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
            ),
          );
        });
  }
}
