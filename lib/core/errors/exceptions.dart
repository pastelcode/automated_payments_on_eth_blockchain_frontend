part of 'errors.dart';

/// {@template custom_exception}
/// An interface to represent an exception.
/// {@endtemplate}
abstract class _CustomException extends _BaseError implements Exception {
  /// {@macro custom_exception}
  _CustomException({
    required super.message,
  }) : super(
          type: _ErrorTypes.exception,
        );
}

/// {@template server_exception}
/// A server failure.
/// {@endtemplate}
class ServerException extends _CustomException {
  /// {@macro server_exception}
  ServerException({
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
