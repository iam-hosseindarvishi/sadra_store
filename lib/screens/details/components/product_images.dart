import 'package:flutter/material.dart';

import '../../../constants/constants.dart';
import '../../../models/Product.dart';
import '../../../constants/size_config.dart';

class ProtuctImages extends StatefulWidget {
  const ProtuctImages({Key? key, required this.product}) : super(key: key);

  final Product product;

  @override
  _ProtuctImagesState createState() => _ProtuctImagesState();
}

class _ProtuctImagesState extends State<ProtuctImages> {
  int selectedImage = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: getProportionateScreenWidth(238),
          child: AspectRatio(
            aspectRatio: 1.5,
            child: Image.asset(widget.product.images[selectedImage]),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ...List.generate(widget.product.images.length,
                  (index) => BuildSmallPreview(index))
            ],
          ),
        )
      ],
    );
  }

  GestureDetector BuildSmallPreview(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedImage = index;
        });
      },
      child: Container(
        margin: EdgeInsets.only(right: getProportionateScreenWidth(15)),
        padding: EdgeInsets.all(getProportionateScreenHeight(8)),
        height: getProportionateScreenWidth(48),
        width: getProportionateScreenWidth(48),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
                color: selectedImage == index
                    ? kPrimaryColor
                    : Colors.transparent)),
        child: Image.asset(widget.product.images[index]),
      ),
    );
  }
}
