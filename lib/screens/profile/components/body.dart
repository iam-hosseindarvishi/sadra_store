import 'package:flutter/material.dart';
import 'package:sadra_store/constants/constants.dart';
import 'package:sadra_store/constants/size_config.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 20,
                      color: Colors.black.withOpacity(.1),
                    ),
                  ],
                  borderRadius: const BorderRadius.all(Radius.circular(12))),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "مشخصات کاربری",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: kPrimaryColor,
                          fontSize: getProportionateScreenWidth(18)),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(12),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "نام  :  ",
                          style: TextStyle(
                              fontSize: getProportionateScreenWidth(14),
                              fontWeight: FontWeight.w600,
                              color: kSecondaryColor),
                        ),
                        Text(
                          "حسین",
                          style: TextStyle(
                              fontSize: getProportionateScreenWidth(14),
                              fontWeight: FontWeight.w600,
                              color: kSecondaryColor),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(30),
                    ),
                    //email section
                    Row(
                      children: [
                        Text(
                          " نام خانوادگی :  ",
                          style: TextStyle(
                              fontSize: getProportionateScreenWidth(14),
                              fontWeight: FontWeight.w600,
                              color: kSecondaryColor),
                        ),
                        Text(
                          "درویشی",
                          style: TextStyle(
                              fontSize: getProportionateScreenWidth(14),
                              fontWeight: FontWeight.w600,
                              color: kSecondaryColor),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(30),
                    ),
                    //email section
                    Row(
                      children: [
                        Text(
                          " ایمیل :  ",
                          style: TextStyle(
                              fontSize: getProportionateScreenWidth(14),
                              fontWeight: FontWeight.w600,
                              color: kSecondaryColor),
                        ),
                        Text(
                          "iam.hosseindarvishi@gmail.com",
                          style: TextStyle(
                              fontSize: getProportionateScreenWidth(14),
                              fontWeight: FontWeight.w600,
                              color: kSecondaryColor),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(30),
                    ),
                    //email section
                    Row(
                      children: [
                        Text(
                          " شماره تماس :  ",
                          style: TextStyle(
                              fontSize: getProportionateScreenWidth(14),
                              fontWeight: FontWeight.w600,
                              color: kSecondaryColor),
                        ),
                        Text(
                          "09179360559",
                          style: TextStyle(
                              fontSize: getProportionateScreenWidth(14),
                              fontWeight: FontWeight.w600,
                              color: kSecondaryColor),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(30),
                    ),
                    //email section
                    Row(
                      children: [
                        Text(
                          " تفلن همراه :  ",
                          style: TextStyle(
                              fontSize: getProportionateScreenWidth(14),
                              fontWeight: FontWeight.w600,
                              color: kSecondaryColor),
                        ),
                        Text(
                          "09363760782",
                          style: TextStyle(
                              fontSize: getProportionateScreenWidth(14),
                              fontWeight: FontWeight.w600,
                              color: kSecondaryColor),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(30),
                    ),
                    //email section
                    Row(
                      children: [
                        Text(
                          " آدرس :  ",
                          style: TextStyle(
                              fontSize: getProportionateScreenWidth(14),
                              fontWeight: FontWeight.w600,
                              color: kSecondaryColor),
                        ),
                        Text(
                          "میناب",
                          style: TextStyle(
                              fontSize: getProportionateScreenWidth(14),
                              fontWeight: FontWeight.w600,
                              color: kSecondaryColor),
                        ),
                      ],
                    )
                  ]),
            ),
            SizedBox(
              height: getProportionateScreenHeight(20),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 20,
                      color: Colors.black.withOpacity(.1),
                    ),
                  ],
                  borderRadius: const BorderRadius.all(Radius.circular(12))),
              child: Column(children: [
                Text(
                  "امکان تغییر اطلاعات کاربری از طریق برنامه وجود ندارد",
                  style: TextStyle(
                      color: Colors.amber,
                      fontSize: getProportionateScreenWidth(18)),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(10),
                ),
                Text(
                  "برای تغییر مشخصات کاربری خود ، با دفتر تماس بگیرید",
                  style: TextStyle(
                      color: Colors.yellowAccent,
                      fontSize: getProportionateScreenWidth(18)),
                )
              ]),
            )
          ],
        ),
      ),
    ));
  }
}
