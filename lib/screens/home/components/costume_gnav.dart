import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:sadra_store/screens/favorite/favorite_screen.dart';
import 'package:sadra_store/screens/settings/setting_screen.dart';

import '../../../size_config.dart';
import '../../profile/profile_screen.dart';
import '../home_screen.dart';

class CostumeGnav extends StatefulWidget {
  const CostumeGnav({Key? key, this.index = 0}) : super(key: key);
  final int index;
  @override
  _CostumeGnavState createState() => _CostumeGnavState();
}

class _CostumeGnavState extends State<CostumeGnav> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: getProportionateScreenHeight(80),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
          child: GNav(
            rippleColor: Colors.grey[300]!,
            hoverColor: Colors.grey[100]!,
            gap: 8,
            activeColor: Colors.black,
            iconSize: 24,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            duration: const Duration(milliseconds: 400),
            tabBackgroundColor: Colors.grey[100]!,
            color: Colors.black,
            tabs: [
              GButton(
                  icon: Icons.home,
                  text: "خانه",
                  onPressed: () {
                    widget.index == 0
                        ? null
                        : Navigator.popAndPushNamed(
                            context, HomeScreen.routeName);
                  }),
              GButton(
                icon: Icons.favorite,
                text: "علاقه مندی ها",
                onPressed: () {
                  widget.index == 1
                      ? null
                      : Navigator.popAndPushNamed(
                          context, FavoriteScreen.routeName);
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("این ویژگی در نسخه های بعدی اضافه میشود")));
                },
              ),
              GButton(
                icon: Icons.person,
                text: "پروفایل",
                onPressed: () {
                  widget.index == 2
                      ? null
                      : Navigator.popAndPushNamed(
                          context, ProfileScreen.routeName);
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("این ویژگی در نسخه های بعدی اضافه میشود")));
                },
              ),
              GButton(
                active: false,
                icon: Icons.settings,
                text: "تنظیمات",
                onPressed: () {
                  widget.index == 3
                      ? null
                      : Navigator.popAndPushNamed(
                          context, SettingScreen.routeName);
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("این ویژگی در نسخه های بعدی اضافه میشود")));
                },
              )
            ],
            selectedIndex: widget.index,
            // onTabChange: (index) {
            //   setState(() {
            //     _currentIndex = index;
            //   });
            // },
          ),
        ),
      ),
    );
  }
}
