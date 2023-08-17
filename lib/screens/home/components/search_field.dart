import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sadra_store/services/database/product_db.dart';
import 'package:sadra_store/services/providers/search_state_notifier.dart';

import '../../../constants/constants.dart';
import '../../../constants/size_config.dart';

class SearchField extends ConsumerStatefulWidget {
  const SearchField({
    super.key, required this.onSearch,
  });
  final VoidCallback onSearch;
  @override
  ConsumerState<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends ConsumerState<SearchField> {

  @override
  Widget build(BuildContext context ) {
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
