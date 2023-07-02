import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sadra_store/screens/forgot_password/forgot_password_screen.dart';
import 'package:sadra_store/services/remote/get_token.dart';

import '../../../components/custom_surffix_icon.dart';
import '../../../components/default_button.dart';
import '../../../constants/constants.dart';
import '../../../constants/size_config.dart';
import '../../../constants/theme.dart';
import '../../../models/token.dart';

class SignForm extends StatefulWidget {
  const SignForm({Key? key}) : super(key: key);

  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  String? phone;
  String? password;
  bool remember = true;
  final List<String> errors = [];
  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            buildPhonNumberFormField(phoneController),
            SizedBox(
              height: getProportionateScreenHeight(30),
            ),
            buildPasswordFormField(passwordController),
            SizedBox(
              height: getProportionateScreenHeight(30),
            ),
            Row(
              children: [
                Checkbox(
                    value: remember,
                    activeColor: kPrimaryColor,
                    onChanged: (value) {
                      setState(() {
                        remember = value!;
                      });
                    }),
                const Text("مرا به خاطر بسپار"),
                const Spacer(),
                GestureDetector(
                  onTap: () => ScaffoldMessenger.of(context)
                      .showSnackBar(buildAlertSnackBar(
                          const Duration(milliseconds: 800),
                          Colors.lightBlue,
                          "در حال حاظر امکان بازیابی کلمه عبور وجود ندارد",
                          const Icon(
                            Icons.info_rounded,
                            color: Colors.white,
                          ),
                          Colors.white)),
                  //  Navigator.pushNamed(
                  //     context, ForgotPasswordScreen.routeName),
                  child: const Text(
                    "فراموشی کلمه عبور!",
                    style: TextStyle(decoration: TextDecoration.underline),
                  ),
                )
              ],
            ),
            DefaultButton(
                text: "ورود",
                press: () {
                  var token = GetToken().getToken();
                  // if (_formKey.currentState!.validate()) {
                  //   email = phoneController.text;
                  //   password = passwordController.text;
                  //   Navigator.popAndPushNamed(context, HomeScreen.routeName);
                  // }
                })
          ],
        ));
  }
}

TextFormField buildPhonNumberFormField(TextEditingController phoneController) {
  return TextFormField(
    controller: phoneController,
    keyboardType: TextInputType.phone,
    inputFormatters: [
      FilteringTextInputFormatter.digitsOnly,
    ],
    validator: (value) {
      if (value == null || value.isEmpty) {
        return kPhonNullError;
      }
      if (!RegExp(r'^[0-9]{3}-[0-9]{3}-[0-9]{4}$').hasMatch(value)) {
        return kInvalidPhonError;
      }
      return null;
    },
    decoration: const InputDecoration(
      labelText: "تلفن",
      hintText: "تلفن خود را وارد کنید",
      floatingLabelBehavior: FloatingLabelBehavior.always,
      suffixIcon: Icon(Icons.phone_iphone),
    ),
  );
}

TextFormField buildPasswordFormField(TextEditingController passwordController) {
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
      suffixIcon: Icon(Icons.lock),
    ),
  );
}
