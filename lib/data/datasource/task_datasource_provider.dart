import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_todo/data/data.dart';

final taskDatasourceProvider = Provider<TaskDatasource>(
  (ref) => TaskDatasource(),
);
