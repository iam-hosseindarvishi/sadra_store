import 'package:flutter/material.dart';
import 'package:sadra_store/screens/sign_up/sign_up_screen.dart';

import '../constants/constants.dart';
import '../constants/theme.dart';
import '../screens/forgot_password/forgot_password_screen.dart';
import '../constants/size_config.dart';

class NoAccountText extends StatelessWidget {
  const NoAccountText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text("  حساب کاربری ندارید؟",
            style: TextStyle(fontSize: getProportionateScreenWidth(16))),
        GestureDetector(
          onTap: () =>
              ScaffoldMessenger.of(context).showSnackBar(buildAlertSnackBar(
                  const Duration(milliseconds: 800),
                  Colors.lightBlue,
                  "در حال حاظر امکان نامنویسی از طریق برنامه ندارد",
                  const Icon(
                    Icons.info_rounded,
                    color: Colors.white,
                  ),
                  Colors.white)),
          //  Navigator.pushNamed(context, SignUpScreen.routeName),
          child: Text(
            " نامنویسی ",
            style: TextStyle(
                fontSize: getProportionateScreenWidth(16),
                color: kPrimaryColor),
          ),
        )
      ],
    );
  }
}
