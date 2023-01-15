part of 'errors.dart';

/// {@template core.errors.failure}
/// An interface to represent a failure.
/// {@endtemplate}
abstract class Failure extends _BaseError {
  /// {@macro core.errors.failure}
  Failure({
    required super.message,
  }) : super(
          type: _ErrorType.failure,
        );
}

/// {@template core.errors.anotherFailure}
/// An unknown failure.
/// {@endtemplate}
class AnotherFailure extends Failure {
  /// {@macro core.errors.anotherFailure}
  AnotherFailure({
    required super.message,
  });
}

/// {@template core.errors.serverFailure}
/// A server failure.
/// {@endtemplate}
class ServerFailure extends Failure {
  /// {@macro core.errors.serverFailure}
  ServerFailure({
    required super.message,
    required this.statusCode,
  });

  /// {@macro core.errors.serverException.statusCode}
  final int statusCode;

  @override
  List<Map<String, dynamic>> get props => [
        {
          'statusCode': statusCode,
        },
      ];
}
