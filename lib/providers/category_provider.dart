import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_todo/utils/utils.dart';

final categoryProvider = StateProvider.autoDispose<TaskCategory>(
  (ref) => TaskCategory.others,
);
