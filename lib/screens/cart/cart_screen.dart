import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sadra_store/services/database/order_detail_db.dart';
import '../../models/Cart.dart';
import 'components/body.dart';
import 'components/check_our_cart.dart';

class CartScreen extends ConsumerStatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  static String routeName = "/cart";

  @override
  ConsumerState<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends ConsumerState<CartScreen> {
  int ordersCount=0;
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
    ref.watch(orderProductProvider).getOrderCount().then((value) {
      setState(() {
        ordersCount=value;
      });
    });
    return AppBar(
        centerTitle: true,
        title: Column(
          children: [
            const Text(
              "سبد خرید شما",
              style: TextStyle(color: Colors.black),
            ),
            Text(
              "$ordersCount کالا",
              style: Theme.of(context).textTheme.bodySmall,
            )
          ],
        ));
  }
}
