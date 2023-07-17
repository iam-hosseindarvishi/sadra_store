import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sadra_store/constants/size_config.dart';
import 'package:sadra_store/services/providers/picture_provider.dart';
import '../../../models/product.dart';
import 'product_description.dart';

// ignore: must_be_immutable
class Body extends ConsumerWidget {
  const Body({super.key, required this.product});
  final Product product;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productPicture = ref.watch(pictureDataProvider).value;
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: getProportionateScreenWidth(20),
          ),
          SizedBox(
            width: getProportionateScreenWidth(238),
            child: AspectRatio(
              aspectRatio: 1.5,
              child: productPicture!.containsKey(product.productId)
                  ? Image.asset(productPicture[product.productId]!)
                  : Image.asset("assets/images/no-photo.png"),
            ),
          ),
          SizedBox(
            height: getProportionateScreenWidth(20),
          ),
          ProductDescription(
            product: product,
          ),
        ],
      ),
    );
  }
}
