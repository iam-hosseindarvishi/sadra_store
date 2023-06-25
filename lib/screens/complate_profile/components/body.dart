import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:sadra_store/components/default_button.dart';
import 'package:sadra_store/constants/constants.dart';

import '../../../components/custom_surffix_icon.dart';
import '../../../constants/size_config.dart';
import 'complate_profile_form.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(children: [
          Text(
            "تکمیل پروفایل کاربر",
            style: headingStyle,
          ),
          const Text(
            "برای ادامه لطفا اطلاعات کاربری \n خود را تکمیل کنید",
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: SizeConfig.screenHeight * 0.08,
          ),
          ComplateProfileForm(),
        ]),
      ),
    );
  }
}
