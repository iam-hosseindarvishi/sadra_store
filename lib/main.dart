import 'package:flutter/material.dart';
import './screens/splash/splash_screen.dart';
import './routs.dart';
import './theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'صدرا پخش',
      theme: theme(),
      // home:  SplashScreen(),
      initialRoute: SplashScreen.routeName,
      routes: routes,
    );
  }
}
