import 'package:flutter/material.dart';
import 'package:sadra_store/components/default_button.dart';
import 'package:sadra_store/constants.dart';
import 'package:sadra_store/size_config.dart';
import 'package:email_validator/email_validator.dart';

import '../../../components/custom_surffix_icon.dart';

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
              child: Column(
                children: [
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
                  SignForm(),
                ],
              ),
            )));
  }
}

class SignForm extends StatefulWidget {
  const SignForm({Key? key}) : super(key: key);

  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  String? email;
  String? password;
  final List<String> errors = [];
  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            buildEmailFormField(emailController),
            SizedBox(
              height: getProportionateScreenHeight(20),
            ),
            buildPasswordFormField(passwordController),
            SizedBox(
              height: getProportionateScreenHeight(20),
            ),
            DefaultButton(
                text: "ورود",
                press: () {
                  if (_formKey.currentState!.validate()) {
                    email = emailController.text;
                    password = passwordController.text;
                    print('email is $email and password is $password');
                  }
                })
          ],
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

TextFormField buildPasswordFormField(TextEditingController passwordController) {
  return TextFormField(
    controller: passwordController,
    keyboardType: TextInputType.visiblePassword,
    validator: (value) {
      if (value == null || value.isEmpty) {
        return kPassNullError;
      }
      return null;
    },
    obscureText: true,
    decoration: const InputDecoration(
      labelText: "کلمه عبور",
      hintText: "کلمه عبور خود را وارد کنید",
      floatingLabelBehavior: FloatingLabelBehavior.always,
      suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Secure.svg"),
    ),
  );
}
