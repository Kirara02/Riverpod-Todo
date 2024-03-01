import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_todo/config/config.dart';

final routesProvider = Provider<GoRouter>(
  (ref) => GoRouter(
    initialLocation: RouteLocation.home,
    navigatorKey: navigationKey,
    routes: appRoutes,
  ),
);
