import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sadra_store/services/database/setting_db.dart';
import 'package:sadra_store/services/providers/setting_provider.dart';
import 'package:shimmer/shimmer.dart';

import '../../../constants/constants.dart';

class RemmaberUser extends ConsumerWidget {
  const RemmaberUser({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final setting = ref.watch(settingDataProvider);
    return Row(
      children: [
        setting.when(
          data: ((data) {
            return Checkbox(
                value: data.remmaberUser,
                activeColor: kPrimaryColor,
                onChanged: (value) {
                  data.remmaberUser = value;
                  SettingDb()
                      .update(data)
                      .then((value) => ref.refresh(settingDataProvider));
                });
          }),
          error: (error, stackTrace) => const Icon(
            Icons.error,
            color: Colors.red,
          ),
          loading: () {
            return Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(50)),
                ));
          },
        ),
        const Text("مرا به خاطر بسپار"),
      ],
    );
  }
}

// Widget buildShemmerRemmamber() {
//   return 
// }
