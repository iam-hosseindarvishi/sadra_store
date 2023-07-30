import 'package:flutter/material.dart';
import 'package:sadra_store/models/user.dart';
import 'package:sadra_store/screens/home/home_screen.dart';
import 'package:sadra_store/services/database/user_db.dart';
import '../../../services/database/setting_db.dart';
import '../../sign_in/sign_in_screen.dart';
import '../../../constants/constants.dart';
import '../../../constants/size_config.dart';
import '../components/splash_content.dart';
import '../../../components/default_button.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<StatefulWidget> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {
      "text":
          "به فروشگاه اینترنتی صدرا خوش آمدید \n لذت خرید آنلاین را با ما تجربه کنید",
      "image": "assets/images/splash-online-shoping.webp"
    },
    {
      "text": "پرداخت آنلاین مانده حساب",
      "image": "assets/images/splash-online-pay.webp"
    },
    {
      "text": "ارسال بار رایگان برای خرید های بالای 50 میلیون",
      "image": "assets/images/splash-delivery.webp"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Directionality(
      textDirection: TextDirection.rtl,
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Expanded(
                flex: 3,
                child: PageView.builder(
                  onPageChanged: (value) {
                    setState(() {
                      currentPage = value;
                    });
                  },
                  itemCount: splashData.length,
                  itemBuilder: (context, index) => SplashContent(
                    text: splashData[index]["text"] ?? "",
                    image: splashData[index]["image"] ?? "",
                  ),
                )),
            Expanded(
                flex: 2,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(20)),
                  child: Column(children: <Widget>[
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                          splashData.length, (index) => buildDot(index)),
                    ),
                    const Spacer(),
                    DefaultButton(
                        text: "بزن بریم خرید",
                        press: () async {
                          if (await SettingDb().checkSettingExsit()) {
                            var setting = await SettingDb().getSettings();
                            if (setting.autoLogin == true &&
                                await UserDb().checkUserExsist()) {
                              var user = await UserDb().getUser();
                              var login =
                                  User().Login(user.phone!, user.password!);
                              login == true
                                  ? Navigator.pushNamed(
                                      context, HomeScreen.routeName)
                                  : Navigator.pushNamed(
                                      context, SignInScreen.routeName);
                            }
                          } else {
                            await SettingDb().initSetting();
                            Navigator.pushNamed(
                                context, SignInScreen.routeName);
                          }
                        }),
                    const Spacer(),
                  ]),
                ))
          ],
        ),
      ),
    ));
  }

  AnimatedContainer buildDot(int index) {
    return AnimatedContainer(
      duration: kAnimationDuartion,
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
          color: currentPage == index ? kPrimaryColor : const Color(0xFFD8D8D8),
          borderRadius: BorderRadius.circular(3)),
    );
  }
}
