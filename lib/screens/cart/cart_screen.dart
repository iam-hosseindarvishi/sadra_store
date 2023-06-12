import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sadra_store/components/default_button.dart';
import 'package:sadra_store/size_config.dart';

import '../../models/Cart.dart';
import 'components/body.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  static String routeName = "/cart";

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: buildAppBar(context),
          body: const Body(),
          bottomNavigationBar: CheckOurCart(),
        ));
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
        centerTitle: true,
        title: Column(
          children: [
            const Text(
              "سبد خرید شما",
              style: TextStyle(color: Colors.black),
            ),
            Text(
              "${demoCarts.length} کالا",
              style: Theme.of(context).textTheme.bodySmall,
            )
          ],
        ));
  }
}

class CheckOurCart extends StatelessWidget {
  const CheckOurCart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 147,
      padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(30),
          vertical: getProportionateScreenWidth(15)),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          boxShadow: [
            BoxShadow(
                offset: Offset(0, -15),
                blurRadius: 20,
                color: Color(0xFFDADADA))
          ]),
      child: SafeArea(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.all(10),
                height: getProportionateScreenWidth(40),
                width: getProportionateScreenWidth(40),
                decoration: BoxDecoration(
                    color: Color(0xFFF5F6F9),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text.rich(TextSpan(text: "جمع کل : \n", children: [
                      TextSpan(
                          text: "250000 ريال",
                          style: TextStyle(fontSize: 16, color: Colors.black))
                    ])),
                    // DefaultButton(text: "خرید", press: () {}),
                  ],
                ),
              )
            ],
          )
        ]),
      ),
    );
  }
}
