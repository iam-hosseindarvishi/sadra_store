import 'package:flutter/material.dart';
import '../../../components/custom_surffix_icon.dart';
import '../../../components/default_button.dart';
import '../../../components/no_account_text.dart';
import '../../../constants/constants.dart';
import '../../../constants/size_config.dart';

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
        return kPhonNullError;
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
