import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class CategoryListItem extends StatelessWidget {
  const CategoryListItem(
      {super.key,
      required this.text,
      required this.press,
      this.isActive = false});
  final String text;
  final GestureTapCallback press;
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: isActive ? kPrimaryColor : null,
      decoration: isActive
          ? BoxDecoration(
              color: kPrimaryColor, borderRadius: BorderRadius.circular(10))
          : null,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(5),
            vertical: getProportionateScreenWidth(2)),
        child: InkWell(
          borderRadius: BorderRadius.circular(5),
          onTap: press,
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Center(
              child: Text(text,
                  textAlign: TextAlign.center,
                  style:
                      TextStyle(color: isActive ? Colors.white : Colors.black)),
            ),
          ),
        ),
      ),
    );
  }
}
