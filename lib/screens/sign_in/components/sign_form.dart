import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:sadra_store/models/product_category.dart';
import 'package:sadra_store/models/setting_model.dart';
import 'package:sadra_store/screens/sign_in/components/remmaber_user.dart';
import 'package:sadra_store/services/api/category_remote.dart';
import 'package:sadra_store/services/database/category_db.dart';
import 'package:sadra_store/services/database/setting_db.dart';
import '../../../components/default_button.dart';
import '../../../constants/constants.dart';
import '../../../constants/size_config.dart';
import '../../../models/user.dart';
import '../../home/home_screen.dart';

class SignForm extends StatefulWidget {
  const SignForm({Key? key}) : super(key: key);

  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  bool remember = false;
  bool loginMode = false;
  final List<String> errors = [];
  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: loginMode == false
            ? Column(
                children: [
                  buildPhonNumberFormField(phoneController),
                  SizedBox(
                    height: getProportionateScreenHeight(30),
                  ),
                  buildPasswordFormField(passwordController),
                  SizedBox(
                    height: getProportionateScreenHeight(10),
                  ),
                  // const RemmaberUser(),
                  SizedBox(
                    height: getProportionateScreenHeight(30),
                  ),
                  DefaultButton(
                      text: "ورود",
                      press: () async {
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            loginMode = !loginMode;
                          });
                          try {
                            var login = await User().login(
                                phoneController.text, passwordController.text);
                            // if (login) {
                            //   await SettingDb()
                            //       .update(SettingModel(remmaberUser: remember));
                            // }
                            if (await CategoryDb().checkCategoryExsit() ==
                                false) {
                              List<ProductCategory> categories =
                                  await CategoryApi().getCategories();
                              for (var element in categories) {
                                await CategoryDb().store(element);
                              }
                            }

                            Navigator.pushNamed(context, HomeScreen.routeName);
                          } catch (e) {
                            setState(() {
                              loginMode = !loginMode;
                            });
                            print(e);
                            showDialog<String>(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                      icon: const Icon(Icons.error),
                                      iconColor: Colors.red,
                                      title: const Text(
                                        "خطا",
                                        style: TextStyle(
                                            color: Colors.red,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      content: Text(
                                        e.toString(),
                                        style: const TextStyle(
                                            color: Colors.redAccent),
                                      ),
                                      actions: [
                                        TextButton(
                                            onPressed: () =>
                                                Navigator.pop(context),
                                            child: const Text("فهمیدم"))
                                      ],
                                    ));
                            // ScaffoldMessenger.of(context)
                            //     .showSnackBar(buildAlertSnackBar(
                            //         const Duration(seconds: 2),
                            //         Colors.redAccent,
                            //         e.toString(),
                            //         const Icon(
                            //           Icons.error_sharp,
                            //           color: Colors.white,
                            //         ),
                            //         Colors.white));
                          }

                          // Navigator.popAndPushNamed(context, HomeScreen.routeName);
                        }
                      }),
                ],
              )
            : const LoadingIndicator(
                indicatorType: Indicator.ballClipRotatePulse,
                strokeWidth: 1.0,
                colors: [kPrimaryColor, kPrimaryLightColor, kSecondaryColor],
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
      if (!RegExp(r'^[0-9]{11}$').hasMatch(value)) {
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
      } else if (value.length < 6) {
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
