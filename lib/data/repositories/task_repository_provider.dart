import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_todo/data/data.dart';

final taskRepositoryProvider = Provider<TaskRepository>(
  (ref) {
    final dataSource = ref.watch(taskDatasourceProvider);
    return TaskRepositoryImpl(dataSource);
  },
);
