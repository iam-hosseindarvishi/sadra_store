import 'package:flutter/material.dart';

import 'components/body.dart';

class ComplateProfileScreen extends StatelessWidget {
  const ComplateProfileScreen({Key? key}) : super(key: key);
  static String routeName = "/complate_profile";
  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: AppBar(
            title: const Text("ایجاد حساب کاربری"),
            centerTitle: true,
          ),
          body: const Body(),
        ));
  }
}
