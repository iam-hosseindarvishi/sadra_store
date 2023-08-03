import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/setting_model.dart';
import '../database/setting_db.dart';

final settingDataProvider = FutureProvider<SettingModel>(
    (ref) => ref.watch(settingProvider).getSettings());
