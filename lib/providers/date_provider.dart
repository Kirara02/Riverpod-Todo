import 'package:flutter_riverpod/flutter_riverpod.dart';

final dateProvider = StateProvider.autoDispose<DateTime>(
  (ref) => DateTime.now(),
);
