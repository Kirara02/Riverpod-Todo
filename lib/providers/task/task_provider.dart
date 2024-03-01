import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_todo/data/data.dart';
import 'package:riverpod_todo/providers/providers.dart';

final taskProvider = StateNotifierProvider<TaskNotifier, TaskState>((ref) {
  final repository = ref.watch(taskRepositoryProvider);
  return TaskNotifier(repository);
});
