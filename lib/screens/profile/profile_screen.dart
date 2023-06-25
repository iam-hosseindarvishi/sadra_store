import 'package:flutter/material.dart';
import 'package:sadra_store/components/costume_gnav.dart';
import 'components/body.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  static String routeName = '/profile';

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("ناحیه کاربری"),
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
        body: const Body(),
        bottomNavigationBar: const CostumeGnav(
          index: 2,
        ),
      ),
    );
  }
}
