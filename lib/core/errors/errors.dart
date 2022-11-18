import 'dart:developer';

import 'package:equatable/equatable.dart';

part 'exceptions.dart';
part 'failures.dart';

/// {@template error_type}
/// An enum to represent the different types of errors this application has.
/// {@endtemplate}
enum _ErrorType {
  /// The exception type.
  exception,

  /// The failure type.
  failure;

  /// {@macro error_type}
  const _ErrorType();
}

/// {@template base_error}
/// A custom base class to extend failures and exceptions.
///
/// When an instance of this base error class is created, a log instruction
/// is automatically triggered.
/// {@endtemplate}
abstract class _BaseError extends Equatable {
  /// {@macro base_error}
  _BaseError({
    required this.message,
    required _ErrorType type,
  }) {
    log(
      toString(),
      name: type.name,
      stackTrace: type == _ErrorType.exception ? StackTrace.current : null,
    );
  }

  /// The message of this error.
  final String message;

  @override
  String toString() {
    final propsMap = {
      // By adding `message` to the map, we avoid the need to add `message` to
      // the `props` property on each subclass.
      'message': message,
      ...props[0],
    };

    // This returns something like 'MyError(message: my message, myProp: value)'
    return '$runtimeType${propsMap.entries.map<String>(
      (
        MapEntry<String, dynamic> element,
      ) {
        final name = element.key;
        final value = element.value;
        return '$name: $value';
      },
    )}';
  }

  /// **Note**: for [toString] to work properly, [props] should be a list
  /// of a map with the name of the prop as the key and its corresponding value.
  ///
  /// `message` should not be overwritten.
  ///
  /// Example:
  ///
  /// ```dart
  /// List<Map<String, dynamic>> get props => [
  ///       {
  ///         'statusCode': statusCode,
  ///         'requestUrl': url,
  ///       },
  ///     ];
  /// ```
  @override
  List<Map<String, dynamic>> get props => [
        {
          'message': message,
        },
      ];
}
