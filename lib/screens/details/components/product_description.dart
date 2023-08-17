import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shimmer/shimmer.dart';
import '../../../constants/size_config.dart';
import '../../../models/product.dart';
import '../../../models/product_detail.dart';
import '../../../models/product_detail_store_assets.dart';
import '../../../services/providers/product_provider.dart';

// ignore: must_be_immutable

class ProductDescription extends ConsumerWidget {
   ProductDescription({
    super.key,
    required this.product,
  });
  late ProductDetail productDetail;
   ProductDetailStoreAssets productStoreAsset = ProductDetailStoreAssets();
  final Product product;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
        ref.watch(productDetailProvider(product.productId!)).whenData((value) {
            productDetail=value;
            ref.watch(productStoreAssetsProvider(value.productDetailId!)).whenData((value) {
              productStoreAsset =value;
            });
        });
    // return dataLoaded(product, productStoreAsset!);
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
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      "نام کالا : ",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                    Text(
                      product.name!,
                      softWrap: true,
                      maxLines: 3,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.green[800],
                        fontWeight: FontWeight.bold,

                      ),
                    ),
                  ],
                ),
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
                        fontSize: 16),
                  ),
                  Text(
                    product.unitName!,
                    style: TextStyle(
                        color: Colors.green[800],
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
          productStoreAsset.productDetailId !=null ? Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                "موجودی کالا : ",
                style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold),
              ),
              Text(
                productStoreAsset.count1! >= 1
                    ? "در انبار صدرا موجود می باشد"
                    : "این کالا در انبار موجودی ندارد",
                style: TextStyle(
                    color: productStoreAsset.count1! >= 1
                        ? Colors.green[800]
                        : Colors.red[800],
                    fontWeight: FontWeight.bold),
              )
            ],
          ) : shimmerLoading(),
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

Widget shimmerLoading([int count = 1]) {
  return Shimmer.fromColors(
    baseColor: Colors.grey[300]!,
    highlightColor: Colors.grey[100]!,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: ListView.builder(
            itemCount: count,
            itemBuilder: (context, index) {
              return Column(children: [
                Container(
                  height: 15,
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(5)),
                ),
                const SizedBox(
                  height: 15,
                )
              ]);
            },
          ),
        ),
      ],
    ),
  );
}
