import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import '../../constants/size_config.dart';
import '../../services/providers/product_provider.dart';
import '../favorite/favorite_screen.dart';
import '../profile/profile_screen.dart';
import '../settings/setting_screen.dart';
import 'components/body.dart';

class HomeScreen extends ConsumerStatefulWidget {
  static String routeName = "/home";
  const HomeScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  int _currentIndex = 0;
  bool isLoadingData = false;
  List<Widget> items = [
    const Body(),
    const FavoriteScreen(),
    const ProfileScreen(),
    const SettingScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        exit(0);
      },
      child: Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            body: items[_currentIndex],
            bottomNavigationBar: gNav(context),
            floatingActionButton: _currentIndex == 0
                ? FloatingActionButton(
                    onPressed: () async {
                      setState(() {
                        isLoadingData = true;
                      });
                      ref.refresh(initDataFromServer).whenData((value) => {
                            if (value)
                              {
                                ref
                                    .refresh(productDataProvider)
                                    .whenData((value) => {})
                              }
                          });
                      Future.delayed(Duration(seconds: 2)).then((value) {
                        setState(() {
                          isLoadingData = false;
                        });
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                                backgroundColor: Colors.blueGrey,
                                content: Center(
                                  child: Text(
                                    "بروزرسانی اطلاعات انجام شد",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )));
                      });
                    },
                    tooltip: "بروزرسانی اطلاعات",
                    backgroundColor: Colors.blueGrey,
                    child: isLoadingData == false
                        ? const Center(
                            child: Icon(
                            Icons.refresh_sharp,
                            color: Colors.white,
                          ))
                        : const SpinKitFadingCircle(
                            color: Colors.white,
                          ),
                  )
                : null,
          )),
    );
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
