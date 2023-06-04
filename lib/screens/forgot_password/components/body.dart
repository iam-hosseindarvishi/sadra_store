import 'package:flutter/material.dart';
import 'package:sadra_store/screens/forgot_password/components/forgot_pass_form.dart';
import 'package:sadra_store/size_config.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20)),
            child: Column(
              children: [
                SizedBox(
                  height: SizeConfig.screenHeight * 0.04,
                ),
                Text(
                  "بازیابی کلمه عبور",
                  style: TextStyle(
                      fontSize: getProportionateScreenWidth(28),
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                const Text(
                  "برای بازیابی کلمه عبور ایمیل خود را وارد کنید \n لینک بازیابی حساب کاربری برای شما ارسال میگردد.",
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: SizeConfig.screenHeight * 0.04,
                ),
                const ForgotPassForm(),
              ],
            ),
          ),
        ));
  }
}
