part of 'errors.dart';

/// {@template core.errors.customException}
/// An interface to represent an exception.
/// {@endtemplate}
abstract class _CustomException extends _BaseError implements Exception {
  /// {@macro core.errors.customException}
  _CustomException({
    required super.message,
  }) : super(
          type: _ErrorType.exception,
        );
}

/// {@template core.errors.serverException}
/// A server exception.
/// {@endtemplate}
class ServerException extends _CustomException {
  /// {@macro core.errors.serverException}
  ServerException({
    required super.message,
    required this.statusCode,
  });

  /// {@template core.errors.serverException.statusCode}
  /// The status code of the failed request.
  /// {@endtemplate}
  final int statusCode;

  @override
  List<Map<String, dynamic>> get props => [
        {
          'statusCode': statusCode,
        },
      ];
}
