import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:memorydirective/providers/provider.dart';
import 'package:memorydirective/router/router.dart';

final navigationKey = GlobalKey<NavigatorState>();

final routesProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authStateChangesProvider);

  final redirection =
      authState.valueOrNull != null ? RouteLocation.home : RouteLocation.login;

  return GoRouter(
    initialLocation: redirection,
    navigatorKey: navigationKey,
    routes: appRoutes,
  );
});
