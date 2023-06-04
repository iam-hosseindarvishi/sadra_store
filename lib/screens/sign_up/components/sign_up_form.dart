import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:sadra_store/screens/complate_profile/complate_profile_screen.dart';

import '../../../components/custom_surffix_icon.dart';
import '../../../components/default_button.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  _SignUpForm createState() => _SignUpForm();
}

class _SignUpForm extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
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
                buildEmailFormField(_emailController),
                SizedBox(
                  height: getProportionateScreenHeight(30),
                ),
                buildPasswordFormField(
                    _passwordController, "کلمه عبور", "کلمه عبور را وارد کنید"),
                SizedBox(
                  height: getProportionateScreenHeight(30),
                ),
                buildPasswordFormField(_confirmPasswordController,
                    "تکرار کلمه عبور", "کلمه عبور خود را تکرار کنید"),
                SizedBox(
                  height: getProportionateScreenHeight(30),
                ),
                DefaultButton(
                    text: "ادامه",
                    press: () {
                      // if (_formKey.currentState!.validate()) {
                      //   if (_passwordController.text !=
                      //       _confirmPasswordController.text) {
                      //     ScaffoldMessenger.of(context).showSnackBar(
                      //         const SnackBar(
                      //             content:
                      //                 Text("رمز عبور و تکرار آن یکسان نیست")));
                      //   }
                      // }
                      Navigator.pushNamed(
                          context, ComplateProfileScreen.routeName);
                    })
              ],
            ),
          ),
        ));
  }
}

TextFormField buildEmailFormField(TextEditingController emailController) {
  return TextFormField(
    controller: emailController,
    keyboardType: TextInputType.emailAddress,
    validator: (value) {
      if (value == null || value.isEmpty) {
        return kEmailNullError;
      }
      if (!EmailValidator.validate(value, true)) {
        return kInvalidemailError;
      }
      return null;
    },
    decoration: const InputDecoration(
      labelText: "ایمیل",
      hintText: "ایمیل خود را وارد کنید",
      floatingLabelBehavior: FloatingLabelBehavior.always,
      suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
    ),
  );
}

TextFormField buildPasswordFormField(
    TextEditingController passwordController, String text, String hintText) {
  return TextFormField(
    controller: passwordController,
    keyboardType: TextInputType.visiblePassword,
    validator: (value) {
      if (value == null || value.isEmpty) {
        return kPassNullError;
      } else if (value.length < 8) {
        return kShortPassError;
      }
      return null;
    },
    obscureText: true,
    decoration: const InputDecoration(
      labelText: "کلمه عبور",
      hintText: "کلمه عبور خود را وارد کنید",
      floatingLabelBehavior: FloatingLabelBehavior.always,
      suffixIcon: Padding(
        padding: EdgeInsets.all(2),
        child: CustomSurffixIcon(svgIcon: "assets/icons/Secure.svg"),
      ),
    ),
  );
}
