import 'package:flutter/material.dart';

import '../../../constants/constants.dart';
import '../../../constants/size_config.dart';

class SplashContent extends StatelessWidget {
  const SplashContent({super.key, required this.text, required this.image});

  final String text, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const Spacer(),
        Text(
          "فروشگاه صدرا",
          style: TextStyle(
              fontSize: getProportionateScreenWidth(36),
              color: kPrimaryColor,
              fontWeight: FontWeight.bold),
        ),
        Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(height: 2),
        ),
        Spacer(
          flex: 2,
        ),
        Image.asset(image,
            width: getProportionateScreenWidth(235),
            height: getProportionateScreenHeight(265))
      ],
    );
  }
}
