import 'package:flutter/material.dart';
import '../constants/constants.dart';
import '../constants/size_config.dart';

class DefaultButton extends StatefulWidget {
  const DefaultButton({super.key, required this.text, required this.press});

  final String text;
  final Function press;
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
              backgroundColor: kPrimaryColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10))),
          onPressed: () {
            setState(() {});
            widget.press();
          },
          child: Text(
            widget.text,
            style: TextStyle(
              fontSize: getProportionateScreenWidth(18),
              color: Colors.white,
            ),
          )),
    );
  }
}
