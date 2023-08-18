import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sadra_store/services/providers/search_state_notifier.dart';
import 'package:shimmer/shimmer.dart';

import '../../../constants/constants.dart';
import '../../../constants/size_config.dart';
import '../../../models/product.dart';
import '../../../services/providers/product_provider.dart';
import 'build_grid_view.dart';
import 'build_list_view.dart';
import 'home_header.dart';

class BodyData extends ConsumerStatefulWidget {
  const BodyData({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _BodyDataState();
}

class _BodyDataState extends ConsumerState<BodyData> {
  String _currentView = 'grid';
  late List<Product> products;
  bool isDataLoaded = false;
  bool isSearched = false;
  String searchText = "";
  @override
  Widget build(BuildContext context) {
    ref.watch(productDataProvider).whenData((value) {
      setState(() {
        isDataLoaded = true;
        products = value;
      });
    });
    final searchState = ref.watch(searchProvider);
    searchState.addListener(() {
      print("has been searched");
      if (searchState.search != "") {
        setState(() {
          isSearched = true;
          searchText = searchState.search;
        });
      } else {
        setState(() {
          isSearched = false;
          // searchText = searchState.search;
        });
      }
      print("search text is $searchText");
      print("search state is $isSearched");
    });
    return SafeArea(
        child: Column(
      children: [
        SingleChildScrollView(
            child: Column(children: [
          SizedBox(
            height: getProportionateScreenWidth(30),
          ),
          HomeHeader(searchFunc: () {}),
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
                        if (products.isNotEmpty) {
                          isDataLoaded = true;
                        }
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
          child: isDataLoaded == false
              ? _currentView == "grid"
                  ? buildGridViewShimmer()
                  : buildListViewShimmer()
              : _currentView == 'grid'
                  ? BuildGridView(
                      products: isSearched != true
                          ? products
                          : products
                              .where((element) =>
                                  element.name!.contains(searchText))
                              .toList(),
                    )
                  : BuildListView(
                      products: isSearched != true
                          ? products
                          : products
                              .where((element) =>
                                  element.name!.contains(searchText))
                              .toList(),
                    ),
        ),
        // child: products.when(
        //     data: (data) => _currentView == 'grid'
        //         ? BuildGridView(products: data)
        //         : BuildListView(
        //             products: data,
        //           ),
        //     error: (err, s) => Center(child: Text("$err")),
        //     loading: () => _currentView == "grid"
        //         ? buildGridViewShimmer()
        //         : buildListViewShimmer()))
      ],
    ));
  }
}

Widget buildGridViewShimmer() {
  return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5),
      itemBuilder: (_, int index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            decoration: BoxDecoration(
                color: kSecondaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(15)),
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 20,
                  width: 20,
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(color: Colors.grey[300]),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 10,
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(color: Colors.grey[300]),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      height: 10,
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(color: Colors.grey[300]),
                    )
                  ],
                )
              ],
            ),
          ),
        );
      });
}

Widget buildListViewShimmer() {
  return ListView.builder(
      itemCount: 5,
      itemBuilder: (_, int index) {
        return Container(
            margin: const EdgeInsets.only(top: 15, left: 10, right: 10),
            height: getProportionateScreenHeight(50 * 2),
            padding: EdgeInsets.symmetric(
                vertical: getProportionateScreenWidth(10),
                horizontal: getProportionateScreenWidth(10)),
            decoration: BoxDecoration(
                color: kSecondaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(color: Colors.grey[300]),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      height: 12,
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(color: Colors.grey[300]),
                    ),
                    Container(
                      height: 12,
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(color: Colors.grey[300]),
                    ),
                  ],
                )
              ],
            ));
      });
}
