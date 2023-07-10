import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import '../../constants/size_config.dart';
import '../favorite/favorite_screen.dart';
import '../profile/profile_screen.dart';
import '../settings/setting_screen.dart';
import 'components/body.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = "/home";
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  List<Widget> items = [
    const Body(),
    const FavoriteScreen(),
    const ProfileScreen(),
    const SettingScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
            body: items[_currentIndex], bottomNavigationBar: gNav(context)));
  }

  //  gnav

  Widget gNav(BuildContext context) {
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
            tabBackgroundColor: Colors.grey[300]!,
            color: Colors.black,
            tabs: const [
              GButton(
                icon: Icons.home,
                text: "خانه",
              ),
              GButton(
                icon: Icons.favorite,
                text: "علاقه مندی ها",
              ),
              GButton(
                icon: Icons.person,
                text: "پروفایل",
              ),
              GButton(
                icon: Icons.settings,
                text: "تنظیمات",
              )
            ],
            selectedIndex: _currentIndex,
            onTabChange: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
        ),
      ),
    );
  }
}
