import 'package:flutter/material.dart';
import 'package:sadra_store/constants.dart';
import 'package:sadra_store/size_config.dart';
import 'sign_up_form.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Text(
            "ایجاد حساب",
            style: headingStyle,
          ),
          const Text(
            "برای ایجاد حساب کاربری \n اطلاعات خود را تکمیل کنید",
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: SizeConfig.screenHeight * 0.08,
          ),
          const SignUpForm(),
          SizedBox(
            height: SizeConfig.screenHeight * 0.08,
          ),
        ],
      ),
    );
  }
}
