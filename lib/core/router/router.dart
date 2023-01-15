import 'package:automated_payments_on_eth_blockchain_frontend/features/home/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

part 'routes.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

/// {@template core.router.router}
/// The application router.
/// {@endtemplate}
final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  debugLogDiagnostics: true,
  initialLocation: Routes.home.path,
  routes: <RouteBase>[
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      name: Routes.home.name,
      path: Routes.home.path,
      builder: (
        BuildContext context,
        GoRouterState state,
      ) {
        return const HomePage();
      },
    ),
  ],
);
