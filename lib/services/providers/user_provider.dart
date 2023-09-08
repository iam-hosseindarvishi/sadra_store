import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../models/user.dart';
import '../database/user_db.dart';

final getUserProvider =
    FutureProvider<User>((ref) => ref.watch(userProvider).getUser());
