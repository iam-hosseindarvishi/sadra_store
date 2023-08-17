import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import 'package:sadra_store/components/default_button.dart';
import 'package:sadra_store/models/order_details.dart';
import 'package:sadra_store/models/product_detail_store_assets.dart';
import 'package:sadra_store/screens/cart/cart_screen.dart';
import 'package:sadra_store/services/database/order_db.dart';
import 'package:sadra_store/services/database/order_detail_db.dart';
import 'package:sadra_store/services/database/store_assets_db.dart';
import '../../models/order.dart';
import '../../models/product.dart';
import '../../models/product_detail.dart';
import '../../services/database/detail_db.dart';
import 'components/body.dart';

class DetailsScreen extends StatefulWidget {
  DetailsScreen({Key? key}) : super(key: key);

  static String routeName = "/details";

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  bool addingToCart = false;
  bool isOnCart = false;
  double count = 1;
  late ProductDetail details;
  late Order order;
  late OrderDetails orderDetails;
  late ProductDetailStoreAssets assets;
  initOrder(int productId) async{
    order=await OrderDb().getCurrentOrder();
    details=await ProductDatailsDb().getDetail(productId);
    assets=await StoreAssetsDb().getDetail(details.productDetailId!);
    orderDetails=await OrderDetailDb().getOrderDetail(details.productDetailId!);
    if(orderDetails.orderClientId!=null){
      setState(() {
        count=orderDetails.count1!;
        isOnCart=true;
      });
    }
  }
  updateCount(double count)async{
    orderDetails.count1=count;
    await OrderDetailDb().update(orderDetails).then((value) {
      setState(() {

      });
    });
  }
  @override
  Widget build(BuildContext context) {
    final ProductDetailsArguments arguments =
        ModalRoute.of(context)!.settings.arguments as ProductDetailsArguments;
       initOrder(arguments.product.productId!);
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: AppBar(
            title: Text(arguments.product.name!),
          ),
          body: SingleChildScrollView(
            child: Body(
              product: arguments.product,
            ),
          ),
          bottomNavigationBar: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 25),
                    decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20))),
                    child: isOnCart == false
                        ? SizedBox(
                            child: addingToCart == false
                                ? DefaultButton(
                                    text: "افزودن به سبد خرید",
                                    press: () async {
                                      if(assets.count1! <= 0){
                                       errorMessage("کالا داری موجودی نیست");
                                        return;
                                      }
                                      setState(() {
                                        addingToCart = !addingToCart;
                                      });

                                      OrderDetails orderDetail=OrderDetails(description: "",storeId:assets.storeId,count1: count.toDouble(),price:details.price1!,itemType: 1,productDetailId: details.productDetailId,orderClientId: order.orderClientId);
                                      await OrderDetailDb().store(orderDetail).then((value){
                                        if(value>=1){
                                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                              backgroundColor: Colors.blueGrey,
                                              duration: Duration(seconds: 2),
                                              content: Row(

                                                children: [
                                                 const Text("به سبد خرید افزوده شد",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                                                  TextButton(onPressed: (){
                                                    Navigator.pushNamed(context, CartScreen.routeName);
                                                  }, child:const Text("مشاهده سبد خرید",style: TextStyle(color: Colors.black45,fontWeight: FontWeight.bold,fontSize: 18),))
                                                ],
                                              )
                                          ));
                                          setState(() {
                                            // isOnCart=true;
                                            addingToCart=!addingToCart;
                                          });
                                        }
                                        }
                                      );
                                    },
                                    backColor: Colors.red,
                                    icon: const Icon(
                                      Icons.add_shopping_cart,
                                      color: Colors.white,
                                    ),
                                  )
                                : const SpinKitThreeBounce(
                                    color: Colors.red,
                                    size: 50,
                                  ).animate(effects: [
                                    const FadeEffect(
                                        duration: Duration(seconds: 1)),
                                  ]),
                          )
                        : SizedBox(
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                    onTap: () async{
                                      count++;
                                      if(assets.count1! < count){
                                        errorMessage("تعداد مجاز نمی باشد");
                                        return;
                                      }
                                      if (count <= 100) {
                                        updateCount(count);
                                      }else{
                                        errorMessage("تعداد وارد شده بیش از حد مجاز است");
                                      }
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.all(10),
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                          color: Colors.red[900],
                                          borderRadius:
                                              BorderRadius.circular(50)),
                                      child: const Icon(
                                        Icons.add,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                    )),
                              const  SizedBox(
                                  width: 5,
                                ),
                                GestureDetector(
                                  onTap: (){
                                    showDialog(context: context, builder: (BuildContext context){
                                      return AlertDialog(
                                        titlePadding: EdgeInsets.symmetric(horizontal: 0,vertical: 5),
                                        title: Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            TextButton(onPressed: ()=>Navigator.of(context).pop(), child: Icon(Icons.close)),
                                          ],
                                        ),

                                        alignment: Alignment.center,
                                        actionsAlignment: MainAxisAlignment.start,

                                        content: Directionality(
                                          textDirection: TextDirection.rtl,
                                          child: Row(
                                            children: [
                                              Text("تعداد را وارد کنید : " , style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey[700]),),
                                              Container(
                                                width: 60,
                                                height: 30,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.rectangle,
                                                  borderRadius: BorderRadius.circular(8),
                                                  border: Border.all(width: 2,color: Colors.grey[700]!)
                                                ),
                                                child: TextField(
                                                    onSubmitted: (value) async{
                                                      double valCount=double.parse(value);
                                                      if(assets.count1! < valCount){
                                                        errorMessage("تعداد مجاز نمی باشد");
                                                        Navigator.of(context).pop();
                                                        return;
                                                      }
                                                      if(valCount>0 && valCount<=100){
                                                        orderDetails.count1=valCount;
                                                        await OrderDetailDb().update(orderDetails).then((value) {
                                                          setState(() {

                                                          });
                                                        });
                                                      }

                                                      Navigator.of(context).pop();
                                                    },
                                                    inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}$')), LengthLimitingTextInputFormatter(4)],
                                                    keyboardType: TextInputType.number,
                                                    decoration:const InputDecoration(
                                                      contentPadding: EdgeInsets.all(0), // پدینگ متن در دایره
                                                      isDense: true, // تنظیمات کوچک‌تر کردن TextField
                                                      border: InputBorder.none,
                                                      enabledBorder: InputBorder.none, // حذف حاشیه داخلی TextField
                                                      focusedBorder: InputBorder.none,
                                                      disabledBorder: InputBorder.none,
                                                    ),
                                                  autofocus: true,
                                              ))
                                            ],
                                          ),
                                        ),

                                      );
                                    });
                                  },
                                  child: Container(
                                    width: 50,
                                    height: 50,

                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(color: Colors.red[900]!,width: 3)),
                                    child: Center(
                                       child:  Text(count.toString().toPersianDigit(),style: TextStyle(fontSize: 16 ,color: Colors.red[900],  fontWeight: FontWeight.w900),),
                                    ),
                                  ),
                                ),
                               const SizedBox(
                                  width: 5,
                                ),
                                InkWell(
                                    onTap: ()async {
                                      if (count >1) {
                                        count--;
                                        // if(orderDetails.count1! <= count){
                                        //   errorMessage("تعداد مجاز نمی باشد");
                                        //   return;
                                        // }
                                        orderDetails.count1=count;
                                        await OrderDetailDb().update(orderDetails).then((value) {
                                          setState(() {

                                          });
                                        });
                                      }
                                    },
                                    child: Container(
                                      width: 50,
                                      height: 50,
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          color: Colors.red[900],
                                          borderRadius:
                                              BorderRadius.circular(50)),
                                      child: const Icon(
                                        Icons.remove,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                    )),
                              ]),
                        ).animate(effects: [FadeEffect(duration: Duration(seconds: 1))]))
              ],
            ),
          ),
        ));
  }
  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> errorMessage(String text){
    return ScaffoldMessenger.of(context).showSnackBar( SnackBar(
      content: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(text,style: TextStyle(fontWeight:FontWeight.bold,color: Colors.red[900]),),
            Icon(Icons.error,color: Colors.red[900],)                                                ],
        ),
      ),
      backgroundColor: Colors.red[200],
      behavior: SnackBarBehavior.floating,
    ));
  }
}

// we use name route so we need to create a arguments class

class ProductDetailsArguments {
  final Product product;
  ProductDetailsArguments(this.product);
}
