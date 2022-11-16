import 'package:automated_payments_on_eth_blockchain_frontend/core/errors/errors.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

/// {@template use_case}
/// An interface that contains common methods for use cases.
///
/// The implementing use case should return either a [Failure] or [Entity].
///
/// [Params] should be a class encapsulating all needed parameters to this use
/// case to work properly.
/// {@endtemplate}
mixin UseCase<Entity, Params> {
  /// The main function ta call this use case.
  /// Example:
  /// ```dart
  /// final MyUseCase myUseCase = MyUseCase();
  /// final result = myUseCase.execute();
  /// ```
  Future<Either<Failure, Entity>> execute({
    required Params params,
  });
}

/// {@template no_params}
/// A class to indicate a use case needs no params to be executed.
/// {@endtemplate}
class NoParams extends Equatable {
  /// {@macro no_params}
  const NoParams();

  @override
  List<Object?> get props => [];
}
