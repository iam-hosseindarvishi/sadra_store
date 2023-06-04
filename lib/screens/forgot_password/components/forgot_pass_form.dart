import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:sadra_store/components/default_button.dart';
import 'package:sadra_store/components/no_account_text.dart';
import 'package:sadra_store/size_config.dart';

import '../../../components/custom_surffix_icon.dart';
import '../../../constants.dart';

class ForgotPassForm extends StatefulWidget {
  const ForgotPassForm({Key? key}) : super(key: key);

  @override
  _ForgotPassFormState createState() => _ForgotPassFormState();
}

class _ForgotPassFormState extends State<ForgotPassForm> {
  final emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String? email;
  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            SizedBox(
              height: SizeConfig.screenHeight * 0.01,
            ),
            buildEmailFormField(emailController),
            SizedBox(
              height: getProportionateScreenHeight(30),
            ),
            SizedBox(
              height: SizeConfig.screenHeight * 0.01,
            ),
            DefaultButton(
                text: "بازیابی حساب",
                press: () {
                  if (_formKey.currentState!.validate()) {
                    setState(() {
                      email = emailController.text;
                    });
                  }
                }),
            SizedBox(
              height: SizeConfig.screenHeight * 0.01,
            ),
            const NoAccountText(),
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
