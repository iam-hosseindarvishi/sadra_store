import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:sadra_store/models/product_category.dart';
import 'package:sadra_store/services/database/category_db.dart';
import '../../../components/default_button.dart';
import '../../../constants/constants.dart';
import '../../../constants/size_config.dart';
import '../../../models/user.dart';
import '../../../services/api/api_services.dart';
import '../../../services/database/user_db.dart';
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
  bool remember = true;
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
                    height: getProportionateScreenHeight(30),
                  ),
                  // Row(
                  //   children: [
                  //     // Checkbox(
                  //     //     value: remember,
                  //     //     activeColor: kPrimaryColor,
                  //     //     onChanged: (value) {
                  //     //       setState(() {
                  //     //         remember = value!;
                  //     //       });
                  //     //     }),
                  //     // const Text("مرا به خاطر بسپار"),
                  //     // const Spacer(),
                  //     GestureDetector(
                  //       onTap: () => ScaffoldMessenger.of(context)
                  //           .showSnackBar(buildAlertSnackBar(
                  //               const Duration(milliseconds: 800),
                  //               Colors.lightBlue,
                  //               "در حال حاظر امکان بازیابی کلمه عبور وجود ندارد",
                  //               const Icon(
                  //                 Icons.info_rounded,
                  //                 color: Colors.white,
                  //               ),
                  //               Colors.white)),
                  //       //  Navigator.pushNamed(
                  //       //     context, ForgotPasswordScreen.routeName),
                  //       child: const Text(
                  //         "فراموشی کلمه عبور!",
                  //         style: TextStyle(decoration: TextDecoration.underline),
                  //       ),
                  //     )
                  //   ],
                  // ),
                  DefaultButton(
                      text: "ورود",
                      press: () async {
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            loginMode = !loginMode;
                          });
                          User user;
                          try {
                            user = await ApiServices().getUser(
                                phoneController.text, passwordController.text);
                            if (user.deleted == false) {
                              if (await UserDb().checkUserExsist()) {
                                User localUser;
                                localUser = await UserDb().getUser();
                                if (localUser.phone != user.phone ||
                                    localUser.password != user.password) {
                                  UserDb()
                                      .update(user, localUser.phone.toString());
                                }
                              } else {
                                await UserDb().store(user);
                              }
                            }
                            if (!await CategoryDb().checkCategoryExsit()) {
                              List<ProductCategory> categories =
                                  await ApiServices().getCategories();
                              categories.map((e) => CategoryDb().store(e));
                            }
                            Navigator.pushNamed(context, HomeScreen.routeName);
                          } catch (e) {
                            setState(() {
                              loginMode = !loginMode;
                            });
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
