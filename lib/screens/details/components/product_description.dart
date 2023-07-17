import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sadra_store/models/product_detail.dart';
import '../../../constants/size_config.dart';
import '../../../models/product.dart';
import '../../../services/providers/product_provider.dart';

// ignore: must_be_immutable

class ProductDescription extends ConsumerWidget {
  const ProductDescription({
    super.key,
    required this.product,
  });

  final Product product;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productDetail =
        ref.read(productDetailProvider(product.productId!)).value;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Text(
                    "نام کالا : ",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 21),
                  ),
                  Text(
                    product.name!,
                    style: TextStyle(
                      fontSize: 21,
                      color: Colors.green[800],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    "واحد کالا : ",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  Text(
                    product.unitName!,
                    style: TextStyle(
                        color: Colors.green[800],
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    "موجودی کالا : ",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    productDetail!.count1! >= 1
                        ? "در انبار صدرا موجود می باشد"
                        : "این کالا در انبار موجودی ندارد",
                    style: TextStyle(
                        color: productDetail.count1! >= 1
                            ? Colors.green[800]
                            : Colors.red[800],
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    "توضیحات: ",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    product.description == null
                        ? "توضیحاتی وجود ندارد"
                        : product.description!,
                    maxLines: 5,
                    style: TextStyle(
                        fontSize: 16,
                        color: product.description == null
                            ? Colors.red[800]
                            : Colors.green[900]),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
