import 'package:flutter/material.dart';
import '../constants/constants.dart';
import '../constants/theme.dart';
import '../constants/size_config.dart';

class ForgotenPassword extends StatelessWidget {
  const ForgotenPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text("کلمه عبور خود را فراموش کرده اید ؟",
            style: TextStyle(fontSize: getProportionateScreenWidth(12))),
        GestureDetector(
          onTap: () =>
              ScaffoldMessenger.of(context).showSnackBar(buildAlertSnackBar(
                  const Duration(milliseconds: 800),
                  Colors.lightBlue,
                  "در حال حاظر امکان بازیابی کلمه عبور از طریق برنامه ندارد",
                  const Icon(
                    Icons.info_rounded,
                    color: Colors.white,
                  ),
                  Colors.white)),
          //  Navigator.pushNamed(context, SignUpScreen.routeName),
          child: Text(
            " بازیابی کلمه عبور ",
            style: TextStyle(
                fontSize: getProportionateScreenWidth(16),
                color: kPrimaryColor),
          ),
        )
      ],
    );
  }
}
