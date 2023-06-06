import 'package:flutter/material.dart';

import '../../../size_config.dart';
import 'category_item.dart';

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  final List<String> categoryItems = [
    'همه محصولات',
    'نوشیدنی ها',
    'شوینده ها',
    'لبنیات',
    'خرازی'
  ];
  int activeTab = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(
          getProportionateScreenWidth(15),
          getProportionateScreenWidth(15),
          getProportionateScreenWidth(20),
          getProportionateScreenWidth(10)),
      height: 70,
      width: double.infinity,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categoryItems.length,
          itemBuilder: (context, index) {
            final item = categoryItems[index];
            return CategoryListItem(
              text: item,
              press: () {
                setState(() {
                  activeTab = index;
                });
              },
              isActive: activeTab == index ? true : false,
            );
          }),
    );
  }
}
