import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_todo/config/config.dart';
import 'package:riverpod_todo/screens/screens.dart';

final navigationKey = GlobalKey<NavigatorState>();

final appRoutes = [
  GoRoute(
    path: RouteLocation.home,
    parentNavigatorKey: navigationKey,
    builder: HomeScreen.builder,
  ),
  GoRoute(
    path: RouteLocation.createTask,
    parentNavigatorKey: navigationKey,
    builder: CreateTaskScreen.builder,
  ),
];
