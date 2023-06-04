import 'package:flutter/material.dart';
import 'package:sadra_store/constants.dart';
import 'package:sadra_store/size_config.dart';
import 'sign_form.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SizedBox(
            width: double.infinity,
            child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20)),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: SizeConfig.screenHeight * 0.04,
                      ),
                      Text(
                        "خوش آمدید",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: getProportionateScreenWidth(28),
                            fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        "برای ورود به فروشگاه \n ایمیل و کلمه عبور خود را وارد کنید",
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: SizeConfig.screenHeight * 0.08,
                      ),
                      const SignForm(),
                      SizedBox(
                        height: SizeConfig.screenHeight * 0.08,
                      ),
                      Row(
                        children: [
                          Text("حساب کاربری ندارید؟",
                              style: TextStyle(
                                  fontSize: getProportionateScreenWidth(16))),
                          Text(
                            "نامنویسی",
                            style: TextStyle(
                                fontSize: getProportionateScreenWidth(16),
                                color: kPrimaryColor),
                          )
                        ],
                      ),
                      SizedBox(
                        height: SizeConfig.screenHeight * 0.08,
                      ),
                    ],
                  ),
                ))));
  }
}
