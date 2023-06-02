import 'package:flutter/material.dart';
import 'constants.dart';
import './screens/splash/splash_screen.dart';
import './routs.dart';
import 'screens/sign_in/sign_in_screen.dart';

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
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Vazir',
        textTheme: const TextTheme(
            bodyLarge: TextStyle(color: kTextColor),
            bodyMedium: TextStyle(color: kTextColor),
            bodySmall: TextStyle(color: kTextColor)),
        useMaterial3: true,
      ),
      // home:  SplashScreen(),
      initialRoute: SplashScreen.routeName,
      routes: routes,
    );
  }
}
