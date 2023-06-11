import 'package:flutter/material.dart';
import 'package:sadra_store/models/Product.dart';
import 'package:sadra_store/size_config.dart';

import '../../components/rounded_icon_btn.dart';
import 'components/body.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  static String routeName = "/details";

  @override
  Widget build(BuildContext context) {
    final ProductDetailsArguments arguments =
        ModalRoute.of(context)!.settings.arguments as ProductDetailsArguments;
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          backgroundColor: const Color(0xFFF5F6F9),
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            leading: SizedBox(
              height: getProportionateScreenWidth(40),
              width: getProportionateScreenWidth(40),
              child: RoundedIconBtn(
                iconData: Icons.arrow_back_ios,
                press: () => Navigator.pop(context),
              ),
            ),
          ),
          body: Body(
            product: arguments.product,
          ),
        ));
  }
}

// we use name route so we need to create a arguments class

class ProductDetailsArguments {
  final Product product;

  ProductDetailsArguments(this.product);
}
