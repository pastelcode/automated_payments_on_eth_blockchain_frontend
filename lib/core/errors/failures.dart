part of 'errors.dart';

/// {@template failure}
/// An interface to represent a failure.
/// {@endtemplate}
abstract class Failure extends _BaseError {
  /// {@macro failure}
  Failure({
    required super.message,
  }) : super(
          type: _ErrorType.failure,
        );
}

/// {@template server_failure}
/// A server failure.
/// {@endtemplate}
class ServerFailure extends Failure {
  /// {@macro server_failure}
  ServerFailure({
    required super.message,
    required this.statusCode,
  });

  /// The status code of the failed request.
  final int statusCode;

  @override
  List<Map<String, dynamic>> get props => [
        {
          'statusCode': statusCode,
        },
      ];
}

/// {@template another_failure}
/// An unknown failure.
/// {@endtemplate}
class AnotherFailure extends Failure {
  /// {@macro another_failure}
  AnotherFailure({
    required super.message,
  });
}
