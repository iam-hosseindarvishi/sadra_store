import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../../components/default_button.dart';
import '../../../constants/constants.dart';
import '../../../constants/size_config.dart';
import '../../../services/database/order_detail_db.dart';

class CheckOurCart extends ConsumerStatefulWidget {
  const CheckOurCart({
    super.key,
  });

  @override
  ConsumerState<CheckOurCart> createState() => _CheckOurCartState();
}

class _CheckOurCartState extends ConsumerState<CheckOurCart> {
   double totalPrice=0.0;
   String formattedNumber="";
  @override
  Widget build(BuildContext context) {
    ref.watch(orderProductProvider).getOrderPrice().then((value) => {
    setState(() {
      totalPrice=value;
      formattedNumber = NumberFormat('###,###.###').format(totalPrice);
    })
    });
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
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        const SizedBox(
          height: 10,
        ),
         Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text.rich(TextSpan(
                text: "جمع کل : ",
                children: [
                  TextSpan(
                      text: "$formattedNumber ریال ",
                      style:const TextStyle(
                          color: kPrimaryColor, fontWeight: FontWeight.bold))
                ],
                style:const TextStyle(fontSize: 16))),
            // Text.rich(TextSpan(
            //     text: "تعداد : ",
            //     children: [
            //       TextSpan(
            //           text: "50",
            //           style: TextStyle(
            //               color: kPrimaryColor, fontWeight: FontWeight.bold))
            //     ],
            //     style: TextStyle(fontSize: 16))),
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        DefaultButton(text: "تکمیل خرید", press: () {})
      ]),
    );
  }
}
