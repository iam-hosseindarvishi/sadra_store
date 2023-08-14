import 'package:flutter/material.dart';
import 'package:sadra_store/screens/cart/cart_screen.dart';
import '../../../constants/size_config.dart';
import 'icon_btn_with_counter.dart';
import 'search_field.dart';
class HomeHeader extends StatelessWidget {
  const HomeHeader({
    super.key, required this.searchFunc,
  });
  final VoidCallback searchFunc;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
           SearchField(onSearch: searchFunc),
          IconBtnWithCounter(
            svgSrc: "assets/icons/Cart.svg",
            press: () {
              Navigator.pushNamed(context, CartScreen.routeName);
            },
          ),
          IconBtnWithCounter(
            svgSrc: "assets/icons/Bell.svg",
            press: () {},
            numOfItems: 3,
          ),
        ],
      ),
    );
  }
}
