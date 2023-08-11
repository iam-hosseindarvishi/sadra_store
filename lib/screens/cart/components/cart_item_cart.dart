import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:sadra_store/screens/details/details_screen.dart';
import '../../../constants/constants.dart';
import '../../../models/Cart.dart';
import '../../../constants/size_config.dart';

class CartItemCard extends StatelessWidget {
  const CartItemCard({
    super.key,
    required this.cart,
  });
  final Cart cart;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, DetailsScreen.routeName,
          arguments: ProductDetailsArguments(cart.product)),
      child: Row(
        children: [
          SizedBox(
            width: getProportionateScreenWidth(88),
            child: AspectRatio(
              aspectRatio: 0.88,
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Color(0xFFF5F6F9),
                    borderRadius: BorderRadius.circular(15)),
                child: Image.asset("cart.product.images[0]"),
              ),
            ),
          ),
          SizedBox(
            width: getProportionateScreenWidth(20),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 200,
                // height: 140,
                child: AutoSizeText(
                  cart.product.name!,
                  style: TextStyle(fontSize: 16, color: Colors.black),
                  maxLines: 2,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Directionality(
                  textDirection: TextDirection.ltr,
                  child: Text.rich(TextSpan(
                      text: "${cart.product.unitName}",
                      style: TextStyle(color: kPrimaryColor),
                      children: [
                        TextSpan(
                            text: " x ${cart.orderDetail.count1}",
                            style: TextStyle(color: kTextColor))
                      ])))
            ],
          )
        ],
      ),
    );
  }
}
