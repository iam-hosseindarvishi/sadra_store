import 'package:flutter/material.dart';

import '../../../components/default_button.dart';
import '../../../components/rounded_icon_btn.dart';
import '../../../size_config.dart';
import 'top_rounded_container.dart';

class PrudoctAddToCart extends StatefulWidget {
  PrudoctAddToCart({
    super.key,
  });

  int count = 1;

  @override
  State<PrudoctAddToCart> createState() => _PrudoctAddToCartState();
}

class _PrudoctAddToCartState extends State<PrudoctAddToCart> {
  @override
  Widget build(BuildContext context) {
    return TopRoundedContainer(
      color: const Color(0xFFF6F7F9),
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RoundedIconBtn(
                    iconData: Icons.add,
                    press: () {
                      setState(() {
                        widget.count++;
                      });
                    }),
                SizedBox(
                  width: getProportionateScreenWidth(10),
                ),
                Text(
                  widget.count.toString(),
                  style: TextStyle(
                      fontSize: getProportionateScreenWidth(18),
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  width: getProportionateScreenWidth(10),
                ),
                RoundedIconBtn(
                    iconData: Icons.remove,
                    press: () {
                      setState(() {
                        widget.count <= 1 ? widget.count = 1 : widget.count--;
                      });
                    }),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: DefaultButton(text: "افزودن به سبد خرید", press: () {}),
            )
          ],
        ),
      ),
    );
  }
}
