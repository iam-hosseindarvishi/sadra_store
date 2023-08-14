import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../constants/constants.dart';
import '../../../constants/size_config.dart';
import '../../../models/product.dart';
import '../../details/details_screen.dart';
import 'product_image.dart';

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
          return Animate(
            autoPlay: true,
            effects: const [
              BlurEffect(
                  begin: Offset(10, 10),
                  end: (Offset(0, 0)),
                  duration: Duration(milliseconds: 500),
                  delay: Duration(milliseconds: 5))
            ],
            child: InkWell(
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
                      child: ProductImage(
                        productID: products[index].productId!,
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 200,
                          child: AutoSizeText(
                            products[index].name!,
                            maxLines: 2 ,
                            style: const TextStyle(
                                color: Colors.black, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Text(
                          showPrice == true
                              ? '${products[index]} ریال'
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
            ),
          );
        });
  }
}
