import 'package:equatable/equatable.dart';
import 'package:go_router/go_router.dart';

part 'routes.dart';

/// {@template application_router}
/// The application router.
/// {@endtemplate}
class ApplicationRouter {
  /// {@macro application_router}
  factory ApplicationRouter() {
    if (_singleton != null) {
      return _singleton!;
    }
    _singleton = ApplicationRouter._internal();
    return _singleton!;
  }

  ApplicationRouter._internal();

  static ApplicationRouter? _singleton;

  /// The root router for this application.
  final router = GoRouter(
    debugLogDiagnostics: true,
    initialLocation: Routes.home.path,
    routes: <RouteBase>[
      GoRoute(
        name: Routes.home.name,
        path: Routes.home.path,
      ),
    ],
  );
}
