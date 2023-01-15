part of 'router.dart';

/// {@template core.router.routes}
/// Routes for this application.
/// {@endtemplate}
enum Routes {
  /// The route for the initial location of app.
  home(
    name: 'Home',
    path: '/',
  );

  /// {@macro core.router.routes}
  const Routes({
    required this.name,
    required this.path,
  });

  /// The name for this route.
  final String name;

  /// The path for this route.
  final String path;
}
