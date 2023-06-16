import 'package:flutter/material.dart';

import '../../../components/default_button.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

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
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        const SizedBox(
          height: 10,
        ),
        const Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text.rich(TextSpan(
                text: "جمع کل : ",
                children: [
                  TextSpan(
                      text: "250000 ریال",
                      style: TextStyle(
                          color: kPrimaryColor, fontWeight: FontWeight.bold))
                ],
                style: TextStyle(fontSize: 16))),
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
