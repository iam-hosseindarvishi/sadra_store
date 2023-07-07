import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sadra_store/constants/size_config.dart';
import '../../../models/Cart.dart';
import 'cart_item_cart.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: ListView.builder(
          itemCount: demoCarts.length,
          itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Dismissible(
                  onDismissed: (direction) {
                    setState(() {
                      demoCarts.removeAt(index);
                    });
                  },
                  direction: DismissDirection.endToStart,
                  movementDuration: const Duration(seconds: 2),
                  resizeDuration: Duration(seconds: 2),
                  background: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                        color: Color(0xFFFFE6E6),
                        borderRadius: BorderRadius.circular(15)),
                    child: Row(
                      children: [
                        Spacer(),
                        SvgPicture.asset("assets/icons/Tresh.svg")
                      ],
                    ),
                  ),
                  key: Key(demoCarts[index].product.productId.toString()),
                  child: CartItemCard(
                    cart: demoCarts[index],
                  ),
                ),
              )),
    );
  }
}
