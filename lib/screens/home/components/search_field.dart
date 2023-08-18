import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sadra_store/services/providers/search_state_notifier.dart';

import '../../../constants/constants.dart';
import '../../../constants/size_config.dart';

class SearchField extends ConsumerStatefulWidget {
  const SearchField({
    super.key,
    required this.onSearch,
  });
  final VoidCallback onSearch;

  @override
  ConsumerState<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends ConsumerState<SearchField> {
  TextEditingController searchTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // final searchNotifier=ref.watch(searchProvider as ProviderListenable);
    return Container(
      width: SizeConfig.screenWidth * 0.6,
      decoration: BoxDecoration(
        color: kSecondaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
          controller: searchTextController,
          onSubmitted: (value) async {
            if (value.isNotEmpty) {
              ref.read(searchProvider.notifier).add(value);
            } else {
              ref.read(searchProvider.notifier).remove();
            }
          },
          onChanged: (value) {
            if (value.isEmpty) {
              ref.read(searchProvider.notifier).remove();
            } else {
              ref.read(searchProvider.notifier).add(value);
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
