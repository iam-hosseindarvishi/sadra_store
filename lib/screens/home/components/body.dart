import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sadra_store/constants.dart';
import 'package:sadra_store/models/Product.dart';
import 'package:sadra_store/size_config.dart';
import 'categories.dart';
import 'home_header.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      child: Column(children: [
        SizedBox(
          height: getProportionateScreenWidth(30),
        ),
        const HomeHeader(),
        SizedBox(
          height: getProportionateScreenWidth(10),
        ),
        // a place for Surpise section for future
        const Categories(),
        SizedBox(
          height: getProportionateScreenWidth(10),
        ),
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
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...List.generate(demoProducts.length,
                  (index) => ProductCard(product: demoProducts[index]))
            ],
          ),
        )
      ]),
    ));
  }
}

class ProductCard extends StatelessWidget {
  const ProductCard({
    this.width = 140,
    this.aspectRetion = 1.02,
    required this.product,
    super.key,
  });

  final double width, aspectRetion;
  final Product product;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: getProportionateScreenWidth(20)),
      child: SizedBox(
        width: getProportionateScreenWidth(width),
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: aspectRetion,
              child: Container(
                padding: EdgeInsets.all(getProportionateScreenWidth(20)),
                decoration: BoxDecoration(
                    color: kSecondaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(15)),
                child: Image.asset(product.image),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              product.title,
              style: const TextStyle(
                color: Colors.black,
              ),
              maxLines: 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.circular(30),
                  child: Container(
                    padding: EdgeInsets.all(getProportionateScreenWidth(8)),
                    width: getProportionateScreenWidth(28),
                    height: getProportionateScreenWidth(28),
                    decoration: BoxDecoration(
                        color: product.isFavourite
                            ? kPrimaryColor.withOpacity(0.1)
                            : kSecondaryColor.withOpacity(0.1),
                        shape: BoxShape.circle),
                    child: SvgPicture.asset(
                      "assets/icons/Heart.svg",
                      colorFilter: ColorFilter.mode(
                          product.isFavourite
                              ? Color(0xFFFF48)
                              : Color(0xFFDBDEE4),
                          BlendMode.darken),
                    ),
                  ),
                ),
                Text(
                  "${product.price}ريال",
                  style: const TextStyle(
                      color: kPrimaryColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
