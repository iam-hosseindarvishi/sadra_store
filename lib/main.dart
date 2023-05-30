import 'package:flutter/material.dart';
import 'constants.dart';
import './screens/splash/splash_screen.dart';
import './routs.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
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
          bodySmall: TextStyle(color: kTextColor)
        ),
        useMaterial3: true,
      ),
      // home:  SplashScreen(),
      initialRoute: SplashScreen.routeName,
      routes: routes,
    );
  }
}
