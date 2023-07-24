import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../api/picture_remote.dart';

final pictureDataProvider = FutureProvider((ref) {
  return ref.watch(prictureRemoteProvider).getPictures();
});
