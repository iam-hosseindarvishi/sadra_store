import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:sadra_store/services/database/user_db.dart';
import 'package:sadra_store/services/providers/user_provider.dart';
import '../../../components/default_button.dart';
import '../../../constants/constants.dart';
import '../../../constants/size_config.dart';
import '../../../models/product_category.dart';
import '../../../models/user.dart';
import '../../../services/api/category_remote.dart';
import '../../../services/database/category_db.dart';
import '../../home/home_screen.dart';
import 'remmaber_user.dart';

class SignForm extends ConsumerStatefulWidget {
  const SignForm({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignFormState();
}

class _SignFormState extends ConsumerState<SignForm> {
  final _formKey = GlobalKey<FormState>();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();

  bool remember = false;
  bool loginMode = false;
  final List<String> errors = [];
  void getUserInfo() async {
    User user = await UserDb().getUser();
    if (user.phone != null) {
      phoneController.text = user.phone!;
      passwordController.text = user.password!;
    }
  }

  @override
  Widget build(BuildContext context) {
    getUserInfo();
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
                      icon: const Icon(
                        Icons.login,
                        color: Colors.white,
                      ),
                      text: "ورود به فروشگاه",
                      press: () async {
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            loginMode = !loginMode;
                          });
                          try {
                            await User().login(
                                phoneController.text, passwordController.text);

                            if (await CategoryDb().checkCategoryExsit() ==
                                false) {
                              List<ProductCategory> categories =
                                  await CategoryApi().getCategories();
                              for (var element in categories) {
                                await CategoryDb().store(element);
                              }
                            }

                            Navigator.pushNamed(context, HomeScreen.routeName);
                          } catch (err) {
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
                                        err.toString(),
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
            : SizedBox(
                width: MediaQuery.sizeOf(context).width,
                height: MediaQuery.sizeOf(context).height,
                // decoration: const BoxDecoration(color: Colors.white),
                child: const Column(
                  children: [
                    LoadingIndicator(
                      indicatorType: Indicator.ballClipRotatePulse,
                      strokeWidth: 1.0,
                      colors: [
                        kPrimaryColor,
                        kPrimaryLightColor,
                        kSecondaryColor
                      ],
                    ),
                    Text(
                      "در حال تایید هویت",
                      style: TextStyle(
                          color: kPrimaryColor, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
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
