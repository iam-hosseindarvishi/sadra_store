import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sadra_store/components/default_button.dart';
import '../../models/product.dart';
import 'components/body.dart';

class DetailsScreen extends StatefulWidget {
  DetailsScreen({Key? key}) : super(key: key);

  static String routeName = "/details";

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  bool addingToCart = false;
  bool isOnCart = true;
  @override
  Widget build(BuildContext context) {
    final ProductDetailsArguments arguments =
        ModalRoute.of(context)!.settings.arguments as ProductDetailsArguments;
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: AppBar(
            title: Text(arguments.product.name!),
          ),
          body: Body(
            product: arguments.product,
          ),
          bottomNavigationBar: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                  child: addingToCart == false
                      ? DefaultButton(
                          text: "افزودن به سبد خرید",
                          press: () async {
                            setState(() {
                              addingToCart = !addingToCart;
                            });
                            await Future.delayed(Duration(seconds: 5))
                                .then((value) {
                              setState(() {
                                addingToCart = !addingToCart;
                              });
                            });
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
                          FadeEffect(duration: Duration(seconds: 1)),
                        ]))
            ],
          ),
        ));
  }
}

// we use name route so we need to create a arguments class

class ProductDetailsArguments {
  final Product product;

  ProductDetailsArguments(this.product);
}
