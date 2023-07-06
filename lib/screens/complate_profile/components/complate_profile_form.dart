import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

import '../../../components/custom_surffix_icon.dart';
import '../../../components/default_button.dart';
import '../../../constants/constants.dart';
import '../../../constants/size_config.dart';

class ComplateProfileForm extends StatefulWidget {
  ComplateProfileForm({Key? key}) : super(key: key);

  @override
  _ComplateProfileForm createState() => _ComplateProfileForm();
}

class _ComplateProfileForm extends State<ComplateProfileForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressdController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20)),
            child: Column(
              children: [
                buildTextFormField(
                    _firstNameController,
                    "نام",
                    "نام خود را وارد کنید",
                    TextInputType.name,
                    "assets/icons/User.svg"),
                SizedBox(
                  height: getProportionateScreenHeight(30),
                ),
                buildTextFormField(
                    _lastNameController,
                    "نام خانوادگی",
                    "نام خانوادگی خود را وارد کنید",
                    TextInputType.name,
                    "assets/icons/User.svg"),
                SizedBox(
                  height: getProportionateScreenHeight(30),
                ),
                buildTextFormField(
                    _phoneController,
                    "تلفن",
                    "شماره تماس خود را وارد کنید",
                    TextInputType.phone,
                    "assets/icons/Phone.svg"),
                SizedBox(
                  height: getProportionateScreenHeight(30),
                ),
                buildTextFormField(
                    _addressdController,
                    "آدرس",
                    "آدرس خود را وارد کنید",
                    TextInputType.streetAddress,
                    "assets/icons/Location.svg"),
                SizedBox(
                  height: getProportionateScreenHeight(30),
                ),
                DefaultButton(text: "تکمیل پروفایل", press: () {}),
                SizedBox(
                  height: getProportionateScreenHeight(30),
                ),
                Text("با ادامه دادن شما شرایط و ضوابط ما را تایید میکنید"),
                SizedBox(
                  height: getProportionateScreenHeight(30),
                ),
              ],
            ),
          ),
        ));
  }

  TextFormField buildTextFormField(TextEditingController textController,
      String text, String hintText, TextInputType inputType, String svgIcon) {
    return TextFormField(
      controller: textController,
      keyboardType: inputType,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return kPhonNullError;
        }
        if (!EmailValidator.validate(value, true)) {
          return kInvalidPhonError;
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: text,
        hintText: hintText,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: svgIcon),
      ),
    );
  }
}
