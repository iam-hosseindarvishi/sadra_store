import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:loading_indicator/loading_indicator.dart';
import '../../../constants/size_config.dart';
import '../../../services/database/order_detail_db.dart';
import '../../../services/providers/cart_items_provider.dart';
import 'cart_item_cart.dart';

class Body extends ConsumerStatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  ConsumerState<Body> createState() => _BodyState();
}

class _BodyState extends ConsumerState<Body> {
  @override
  Widget build(BuildContext context) {
    ref.refresh(cartItemsProvider);
    final cartItem=ref.watch(cartItemsProvider);
    return cartItem.when(data: (data) {
     return Padding(
        padding:
        EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) => Container(
              decoration: BoxDecoration(
                color: index%2==0?Colors.white30   : Colors.white10
              ),
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Dismissible(
                onDismissed: (direction) {
                  setState(() async{
                    await OrderDetailDb().delete(data[index].orderDetail).then((value){
                      data.removeAt(index);
                    });
                  });
                },
                direction: DismissDirection.endToStart,
                movementDuration: const Duration(seconds: 2),
                resizeDuration: Duration(seconds: 2),
                background: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                      color: Color(0xFFFFE6E6),
                      borderRadius: BorderRadius.circular(15)),
                  child:const Row(
                    children: [
                      Spacer(),
                      Icon(Icons.delete,color: Colors.red,size: 20,)
                    ],
                  ),
                ),
                key: Key(data[index].product.productId.toString()),
                child: CartItemCard(
                  cart: data[index],
                ),
              ),
            )),
      );
    }, error: (error, stackTrace) {
      return const Center(child: Text("خطا در انجام عملیات",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red),));
    },
      loading: () {
            return  Center(
              child: Container(
                  width: 250,
                  padding: const EdgeInsets.all(16.0),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      LoadingIndicator(
                        indicatorType: Indicator.ballPulseSync,
                        colors: [
                          Colors.red,
                          Colors.green,
                          Colors.yellow,
                          Colors.blueAccent,
                          Colors.greenAccent,
                        ],
                      ),
                      // SizedBox(
                      //   height: 50,
                      // ),
                      Text(
                        "دریافت اطلاعات از بانک اطلاعاتی",
                        style: TextStyle(
                            color: Colors.blueGrey,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      )
                    ],
                  )),
            );
      },
    );
  }
}
