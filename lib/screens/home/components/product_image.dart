import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../services/providers/picture_provider.dart';

class ProductImage extends ConsumerWidget {
  const ProductImage({required this.productID, super.key});
  final int productID;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productPicture = ref.watch(pictureDataProvider);
    return productPicture.when(
        data: (data) => data.containsKey(productID)
            ? Image.network(data[productID].toString())
            : Image.asset("assets/images/no-photo.png"),
        error: (err, s) => const Center(
              child: Text(
                "خطا",
                style: TextStyle(color: Colors.red),
              ),
            ),
        loading: () => const CircularProgressIndicator());
  }
}
