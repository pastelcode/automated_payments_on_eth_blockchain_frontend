import 'package:automated_payments_on_eth_blockchain_frontend/core/errors/errors.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

/// {@template core.domain.useCases.useCase}
/// An interface that contains common methods for use cases.
///
/// The implementing use case should return either a [Failure] or [Entity].
///
/// [Params] should be a class encapsulating all needed parameters to this use
/// case to work properly.
/// {@endtemplate}
mixin UseCase<Entity, Params extends Equatable> {
  /// {@template core.domain.useCases.useCase.execute}
  /// The main function ta call this use case.
  ///
  /// {@tool snippet}
  /// Example:
  /// ```dart
  /// final MyUseCase myUseCase = MyUseCase();
  /// final result = myUseCase.execute();
  /// ```
  /// {@end-tool}
  ///
  /// {@endtemplate}
  Future<Either<Failure, Entity>> execute({
    required Params params,
  });
}

/// {@template core.domain.useCases.noParams}
/// A class to indicate a use case needs no params to be executed.
/// {@endtemplate}
class NoParams extends Equatable {
  /// {@macro core.domain.useCases.noParams}
  const NoParams();

  @override
  List<Object?> get props => [];
}
