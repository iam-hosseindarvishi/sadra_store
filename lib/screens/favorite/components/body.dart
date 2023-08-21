import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../constants/size_config.dart';
import '../../../models/product.dart';
import '../../../services/providers/product_provider.dart';
import '../../home/components/body_data.dart';
import '../../home/components/build_grid_view.dart';
import '../../home/components/build_list_view.dart';

class Body extends ConsumerStatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  ConsumerState<Body> createState() => _BodyState();
}

class _BodyState extends ConsumerState<Body> {
  late List<Product> products;
  String _currentView = 'grid';
  @override
  Widget build(BuildContext context) {
    final favoritList = ref.refresh(favoriteDataProdiver);

    // .whenData((value) {
    //   setState(() {
    //     isDataLoading = true;
    //     products = value;
    //   });
    // });

    return SafeArea(
        child: Column(
      children: [
        SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: getProportionateScreenWidth(10),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("علاقه مندی ها"),
                    IconButton(
                        onPressed: () {
                          setState(() {
                            _currentView =
                                _currentView == 'grid' ? 'list' : 'grid';
                          });
                        },
                        icon: _currentView == 'grid'
                            ? const Icon(Icons.list_sharp)
                            : const Icon(Icons.grid_on_sharp))
                  ],
                ),
              ),
            ],
          ),
        ),
        favoritList.when(
          data: (data) {
            return Expanded(
              child: _currentView == 'grid'
                  ? BuildGridView(products: data)
                  : BuildListView(products: data),
            );
          },
          error: (error, stackTrace) {
            return const Center(
              child: Text(
                "خطا در دریافت اطلاعات",
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            );
          },
          loading: () {
            return buildGridViewShimmer();
          },
        )
      ],
    ));
  }
}
