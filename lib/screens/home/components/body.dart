import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sadra_store/screens/home/components/body_data.dart';
import 'package:sadra_store/screens/home/components/body_shimmer.dart';
import '../../../services/providers/product_provider.dart';

class Body extends ConsumerStatefulWidget {
  const Body({Key? key}) : super(key: key);
  @override
  ConsumerState<Body> createState() => _BodyState();
}

class _BodyState extends ConsumerState<Body> {
  @override
  Widget build(BuildContext context) {
    setState(() {});

    final getData = ref.watch(initDataFromServer);
    return getData.when(
        data: ((data) => const BodyData()),
        error: (error, stackTrace) => const Center(
              child: Text(
                'خطا در دریافت اطلاعات',
                style: TextStyle(color: Colors.red),
              ),
            ),
        loading: () => const BodyShimmer());
  }
}
