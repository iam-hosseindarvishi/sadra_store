import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../constants/constants.dart';
import '../../../models/Product.dart';
import '../../../constants/size_config.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    this.width = 140,
    this.aspectRetion = 1.02,
    required this.product,
    super.key,
    required this.press,
  });

  final double width, aspectRetion;
  final Product product;
  final GestureTapCallback press;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Expanded(
        child: SizedBox(
          width: getProportionateScreenWidth(width),
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: aspectRetion,
                child: Container(
                  padding: EdgeInsets.all(getProportionateScreenWidth(40)),
                  decoration: BoxDecoration(
                      color: kSecondaryColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(15)),
                  child: Image.asset(product.images[0]),
                ),
              ),
              // const SizedBox(
              //   height: 5,
              // ),
              Text(
                product.title,
                style: const TextStyle(
                  color: Colors.black,
                ),
                maxLines: 1,
              ),
              Text(
                "${product.price}ريال",
                style: const TextStyle(
                    color: kPrimaryColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              )
            ],
          ),
        ),
      ),
    );
  }
}
