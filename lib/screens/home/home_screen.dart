import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:sadra_store/screens/profile/profile_screen.dart';
import '../../size_config.dart';
import 'components/body.dart';
import 'components/costume_gnav.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = "/home";
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
            body: Body(),
            bottomNavigationBar: CostumeGnav(
              index: 0,
            )));
  }
}
