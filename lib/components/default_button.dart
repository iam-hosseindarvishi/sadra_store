import 'package:flutter/material.dart';
import '../constants/constants.dart';
import '../constants/size_config.dart';

class DefaultButton extends StatefulWidget {
  DefaultButton(
      {super.key,
      required this.text,
      required this.press,
      this.backColor = kPrimaryColor,
      this.icon});

  final String text;
  final Function press;
  Color backColor;
  Icon? icon;
  @override
  _DefaultButtonState createState() => _DefaultButtonState();
}

class _DefaultButtonState extends State<DefaultButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: getProportionateScreenHeight(56),
      child: ElevatedButton(

          style: TextButton.styleFrom(
              backgroundColor: widget.backColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10))),
          onPressed: () {
            setState(() {});
            widget.press();
          },
          child: widget.icon == null
              ? Text(
                  widget.text,
                  style: TextStyle(
                    fontSize: getProportionateScreenWidth(18),
                    color: Colors.white,
                  ),
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.text,
                      style: TextStyle(
                        fontSize: getProportionateScreenWidth(18),
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    widget.icon!
                  ],
                )),
    );
  }
}
