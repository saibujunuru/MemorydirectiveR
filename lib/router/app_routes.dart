import 'package:go_router/go_router.dart';
import 'package:memorydirective/pages/pages.dart';
import 'package:memorydirective/router/router.dart';

final appRoutes = [
  GoRoute(
    path: RouteLocation.login,
    parentNavigatorKey: navigationKey,
    builder: LoginPage.builder,
  ),
  GoRoute(
    path: RouteLocation.home,
    parentNavigatorKey: navigationKey,
    builder: HomePage.builder,
  )
];
