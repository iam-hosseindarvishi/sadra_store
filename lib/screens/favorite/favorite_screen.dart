import 'package:flutter/material.dart';
import 'components/body.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);
  static String routeName = "/favorite";
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("علاقه مندی ها"),
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
        body: const Body(),
      ),
    );
  }
}
