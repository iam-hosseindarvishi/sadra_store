import 'package:flutter/material.dart';
import 'package:sadra_store/constants/constants.dart';

import '../../../constants/size_config.dart';
import '../../../models/product.dart';

class AddToOrder extends StatefulWidget {
  const AddToOrder({super.key, required this.prodcut});
  final Product prodcut;
  @override
  _AddToOrderState createState() => _AddToOrderState();
}

class _AddToOrderState extends State<AddToOrder> {
  int orderAmount = 0;
  TextEditingController _textEditingController = TextEditingController();
  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
    _textEditingController.text = orderAmount.toString();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  void increaseOrderAmount() {
    setState(() {
      if (orderAmount < 999) {
        orderAmount++;
        _textEditingController.text = orderAmount.toString();
      }
    });
  }

  void decreaseOrderAmount() {
    if (orderAmount > 0) {
      setState(() {
        orderAmount--;
        _textEditingController.text = orderAmount.toString();
      });
    }
  }

  void onTextChanged(String value) {
    setState(() {
      orderAmount = int.tryParse(value) ?? 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Row(
        //   mainAxisSize: MainAxisSize.min,
        //   mainAxisAlignment: MainAxisAlignment.end,
        //   children: [
        //     Text("data"),
        //     const SizedBox(width: 16.0),
        //     IconButton(
        //       icon: const Icon(Icons.add),
        //       onPressed: increaseOrderAmount,
        //     ),
        //     const SizedBox(width: 16.0),
        //     Container(
        //       width: 50,
        //       height: 50,
        //       child: TextField(
        //         controller: _textEditingController,
        //         onChanged: onTextChanged,
        //         keyboardType: TextInputType.number,
        //         textAlign: TextAlign.center,
        //         style: const TextStyle(
        //             fontSize: 18.0,
        //             color: Colors.black,
        //             fontWeight: FontWeight.bold),
        //         decoration: InputDecoration(
        //           focusColor: kPrimaryColor,
        //           hoverColor: kPrimaryColor,
        //           fillColor: kPrimaryColor,
        //           enabledBorder: OutlineInputBorder(
        //               borderRadius: BorderRadius.circular(50)),
        //           focusedBorder: OutlineInputBorder(
        //               borderRadius: BorderRadius.circular(50)),
        //           border: OutlineInputBorder(
        //             borderRadius: BorderRadius.circular(50),
        //           ),
        //           contentPadding: const EdgeInsets.symmetric(vertical: 8.0),
        //         ),
        //       ),
        //     ),
        //     const SizedBox(width: 16.0),
        //     IconButton(
        //       icon: const Icon(Icons.remove),
        //       onPressed: decreaseOrderAmount,
        //     ),
        //   ],
        // ),
        // const SizedBox(height: 16.0),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(30),
              vertical: getProportionateScreenWidth(20)),
          child: GestureDetector(
            onTap: () {
              // Add to shopping cart functionality
              // Implement your logic to add the item to the cart
              print('Item added to shopping cart');
            },
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(20)),
              width: getProportionateScreenWidth(160),
              height: getProportionateScreenWidth(50),
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: getProportionateScreenWidth(3)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "افزودن به خرید",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: getProportionateScreenWidth(10),
                      ),
                      const Icon(
                        Icons.add_shopping_cart,
                        color: Colors.white,
                      )
                    ],
                  )),
            ),
          ),
        ),
      ],
    );
  }
}
