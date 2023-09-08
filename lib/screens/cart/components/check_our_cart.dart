import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import  'package:persian_number_utility/persian_number_utility.dart';
import 'package:sadra_store/services/api/order_remote.dart';
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
   double totalPrice=0;
   bool isSendingOrder=false;
  @override
  Widget build(BuildContext context) {
    ref.watch(orderProductProvider).getOrderPrice().then((value) => {
    setState(() {
      totalPrice=value;
      })
    });
    return WillPopScope(
      onWillPop: () async{
        ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
        return true;
      },
      child: Container(
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
                        text: "${totalPrice.toInt().toString().toPersianDigit().seRagham()} ریال ",
                        style:const TextStyle(
                            color: kPrimaryColor, fontWeight: FontWeight.bold))
                  ],
                  style:const TextStyle(fontSize: 16))),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(

                child: AutoSizeText(
                  "${totalPrice.toInt().toString().beToman().toWord()} تومان ",
                  maxLines: 3,
                  style: TextStyle(color: Colors.red),
              ),
          )]),
          const SizedBox(
            height: 30,
          ),
          isSendingOrder==false? DefaultButton(text: "تکمیل خرید", press: () async{

            setState(() {
              isSendingOrder = !isSendingOrder;
            });
            ref.watch(orderProductProvider).getOrderCount().then((value) {
                if(value<=0){
                 ScaffoldMessenger.of(context).showMaterialBanner(MaterialBanner(
                    leading: Icon(Icons.error_outlined,color: Colors.red,),
                     backgroundColor: Colors.red[100],
                     content: Text("سبد خرید شما خالی است",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black54,fontSize: 20),), actions: [
                   ElevatedButton(onPressed: (){
                    ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
                   }, child: Text("بستن"))
                 ]));
                 // بستن MaterialBanner پس از 5 ثانیه
                 Future.delayed(Duration(seconds: 5), () {
                   ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
                 });
                  setState(() {
                    isSendingOrder = !isSendingOrder;
                  });
                  return;
                }
            });
            await OrderApi().sendOrder().then((value) {
              ScaffoldMessenger.of(context).showSnackBar(
                   SnackBar(
                      backgroundColor:value==true? Colors.blueGrey : Colors.red,
                      content: Center(child: Text(value==true?"سفارش شما ارسال شد":"خطا در ارسال سفارش",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),)
                  ));
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
      ),
    );
  }
}
