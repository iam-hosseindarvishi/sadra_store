import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sadra_store/services/api/api_services.dart';

final pictureDataProvider = FutureProvider((ref) {
  return ref.watch(apiProvider).getPictures();
});
