import 'package:flutter/material.dart';
import '../../models/Cart.dart';
import 'components/body.dart';
import 'components/check_our_cart.dart';

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
          bottomNavigationBar: const CheckOurCart(),
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
