import 'package:flutter/material.dart';

import '../../components/costume_gnav.dart';
import 'components/body.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);
  static String routeName = "/settings";
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("تنظیمات"),
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
        body: const Body(),
        bottomNavigationBar: const CostumeGnav(
          index: 3,
        ),
      ),
    );
  }
}
