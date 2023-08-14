import 'package:flutter/material.dart';
import 'package:sadra_store/services/database/product_db.dart';

import '../../../constants/constants.dart';
import '../../../constants/size_config.dart';

class SearchField extends StatefulWidget {
  const SearchField({
    super.key, required this.onSearch,
  });
  final VoidCallback onSearch;
  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth * 0.6,
      decoration: BoxDecoration(
        color: kSecondaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
          onSubmitted: (value) async{
            if(value.isNotEmpty){
              // await ProductDb().getProducts(value);
            }
          },
          decoration: InputDecoration(
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              hintText: "جستجو محصولات",
              prefixIcon: Icon(Icons.search),
              contentPadding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(20),
                  vertical: getProportionateScreenWidth(9)))),
    );
  }
}
