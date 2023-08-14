import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:sadra_store/services/api/order_remote.dart';
import 'package:sadra_store/services/database/order_db.dart';
import '../../../components/default_button.dart';
import '../../../constants/constants.dart';
import '../../../constants/size_config.dart';
import '../../../services/database/order_detail_db.dart';

class CheckOurCart extends ConsumerStatefulWidget {
  const CheckOurCart({
    super.key,
  });

  @override
  ConsumerState<CheckOurCart> createState() => _CheckOurCartState();
}

class _CheckOurCartState extends ConsumerState<CheckOurCart> {
   double totalPrice=0.0;
   String formattedNumber="";
   bool isSendingOrder=false;
  @override
  Widget build(BuildContext context) {
    ref.watch(orderProductProvider).getOrderPrice().then((value) => {
    setState(() {
      totalPrice=value;
      formattedNumber = NumberFormat('###,###.###').format(totalPrice);
    })
    });
    return Container(
      // height: 147,
      padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(30),
          vertical: getProportionateScreenWidth(15)),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          boxShadow: [
            BoxShadow(
                offset: Offset(0, -15),
                blurRadius: 20,
                color: Color(0xFFDADADA))
          ]),
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        const SizedBox(
          height: 10,
        ),
         Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text.rich(TextSpan(
                text: "جمع کل : ",
                children: [
                  TextSpan(
                      text: "$formattedNumber ریال ",
                      style:const TextStyle(
                          color: kPrimaryColor, fontWeight: FontWeight.bold))
                ],
                style:const TextStyle(fontSize: 16))),
            // Text.rich(TextSpan(
            //     text: "تعداد : ",
            //     children: [
            //       TextSpan(
            //           text: "50",
            //           style: TextStyle(
            //               color: kPrimaryColor, fontWeight: FontWeight.bold))
            //     ],
            //     style: TextStyle(fontSize: 16))),
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        isSendingOrder==false? DefaultButton(text: "تکمیل خرید", press: () async{
          setState(() {
            isSendingOrder = !isSendingOrder;
          });
          await OrderApi().sendOrder().then((value) {
            ScaffoldMessenger.of(context).showSnackBar( SnackBar(
              behavior: SnackBarBehavior.floating,
                backgroundColor: Colors.indigo,
                padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 5),
                margin: const EdgeInsets.only(bottom: 10,right: 5,left: 5),
                content:Text(value==true?"سفارش شما ارسال شد":"خطا در ارسال سفارش",style: TextStyle(color:value==true? Colors.green:Colors.red,fontWeight: FontWeight.bold,fontSize: 22),)
            )
            );
            setState(() {
              isSendingOrder = !isSendingOrder;
              setState(() {

              });
            });
          });
        }) :const SpinKitThreeBounce(
          color: Colors.red,
          size: 50,
        ).animate(effects: [
          const FadeEffect(
              duration: Duration(seconds: 1)),
        ]),
      ]),
    );
  }
}
