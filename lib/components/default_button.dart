import 'package:flutter/material.dart';
import '../constants.dart';
import '../size_config.dart';

class DefaultButton extends StatelessWidget{
    const DefaultButton ({
        super.key,
       required this.text,
        required this.press
       }) ;
    final String text;
    final Function press;

  @override
  Widget build(BuildContext context) {
  return  SizedBox(
    width: double.infinity,
    height: getProportionateScreenHeight(56),
    child:     TextButton(
        style:TextButton.styleFrom(
            backgroundColor: kPrimaryColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
            )
        ),
        onPressed: null,
        child: Text("بزن بریم خرید",
          style: TextStyle(
            fontSize: getProportionateScreenWidth(18),
            color: Colors.white,
          ),
        )
    ),
  );
  }
}