import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../constants/size_config.dart';
import '../../../services/database/product_db.dart';
import '../../../services/providers/product_provider.dart';
import 'build_grid_view.dart';
import 'build_list_view.dart';
import 'home_header.dart';

class Body extends ConsumerStatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  ConsumerState<Body> createState() => _BodyState();
}

class _BodyState extends ConsumerState<Body> {
  String _currentView = 'grid';
  @override
  Widget build(BuildContext context) {
    ProductDb().storeFromApi();
    final products = ref.watch(productDataProvider);
    return SafeArea(
        child: Column(
      children: [
        SingleChildScrollView(
            child: Column(children: [
          SizedBox(
            height: getProportionateScreenWidth(30),
          ),
          const HomeHeader(),
          SizedBox(
            height: getProportionateScreenWidth(10),
          ),
          // a place for Surpise section for future
          // const Categories(),
          // SizedBox(
          //   height: getProportionateScreenWidth(10),
          // ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("همه محصولات"),
                IconButton(
                    onPressed: () {
                      setState(() {
                        _currentView = _currentView == 'grid' ? 'list' : 'grid';
                      });
                    },
                    icon: _currentView == 'grid'
                        ? const Icon(Icons.list_sharp)
                        : const Icon(Icons.grid_on_sharp))
              ],
            ),
          )
          // const PopularProducts(),
        ])),
        Expanded(
            //   child: BuildGridView(
            // products: products,
            child: products.when(
                data: (data) => _currentView == 'grid'
                    ? BuildGridView(products: data)
                    : BuildListView(
                        products: data,
                      ),
                error: (err, s) => Center(child: Text("$err")),
                loading: () => const CircularProgressIndicator()))
      ],
    ));
  }
}
