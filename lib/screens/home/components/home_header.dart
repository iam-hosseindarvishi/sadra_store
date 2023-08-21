import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sadra_store/screens/cart/cart_screen.dart';
import '../../../constants/size_config.dart';
import '../../../services/database/order_detail_db.dart';
import 'icon_btn_with_counter.dart';
import 'search_field.dart';

class HomeHeader extends ConsumerStatefulWidget {
  const HomeHeader({
    super.key,
  });

  @override
  ConsumerState<HomeHeader> createState() => _HomeHeaderState();
}

class _HomeHeaderState extends ConsumerState<HomeHeader> {
  int ordersCount = 0;
  @override
  Widget build(BuildContext context) {
    ref.watch(orderProductProvider).getOrderCount().then((value) {
      setState(() {
        ordersCount = value;
      });
    });
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SearchField(),
          IconBtnWithCounter(
            svgSrc: "assets/icons/Cart.svg",
            numOfItems: ordersCount,
            press: () {
              Navigator.pushNamed(context, CartScreen.routeName);
            },
          ),
          // IconBtnWithCounter(
          //   svgSrc: "assets/icons/Bell.svg",
          //   press: () {},
          //   numOfItems: 3,
          // ),
        ],
      ),
    );
  }
}
