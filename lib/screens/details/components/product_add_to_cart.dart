import 'package:flutter/material.dart';
import 'package:sadra_store/constants/size_config.dart';

class OrderWidget extends StatefulWidget {
  @override
  _OrderWidgetState createState() => _OrderWidgetState();
}

class _OrderWidgetState extends State<OrderWidget> {
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
      orderAmount++;
      _textEditingController.text = orderAmount.toString();
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
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(Icons.remove),
              onPressed: decreaseOrderAmount,
            ),
            SizedBox(width: 16.0),
            Container(
              width: 40,
              height: 40,
              child: TextField(
                controller: _textEditingController,
                onChanged: onTextChanged,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 18.0),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(vertical: 8.0),
                ),
              ),
            ),
            const SizedBox(width: 16.0),
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: increaseOrderAmount,
            ),
          ],
        ),
        const SizedBox(height: 16.0),
        GestureDetector(
          onTap: () {
            // Add to shopping cart functionality
            // Implement your logic to add the item to the cart
            print('Item added to shopping cart');
          },
          child: Container(
            width: getProportionateScreenWidth(110),
            height: getProportionateScreenWidth(30),
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Center(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("افزودن به سبد"),
                SizedBox(
                  width: getProportionateScreenWidth(10),
                ),
                const Icon(
                  Icons.shopping_cart,
                  color: Colors.white,
                )
              ],
            )),
          ),
        ),
      ],
    );
  }
}
