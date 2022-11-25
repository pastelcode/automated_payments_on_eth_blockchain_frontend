import 'package:automated_payments_on_eth_blockchain_frontend/features/home/domain/entities/entities.dart';
import 'package:equatable/equatable.dart';

/// {@template contractSettings.domain.entities.contractLapse}
/// A lapse for the contract.
/// {@endtemplate}
class ContractLapse extends Equatable {
  /// {@macro contractSettings.domain.entities.contractLapse}
  const ContractLapse({
    required this.every,
    required this.unit,
  });

  /// {@template contractSettings.domain.entities.contractLapse.every}
  /// The number every lapsed is executed.
  ///
  /// For example: 1, 5, 9.
  /// {@endtemplate}
  final num? every;

  /// {@template contractSettings.domain.entities.contractLapse.unit}
  /// The time unit for [every].
  /// {@endtemplate}
  final DurationUnit? unit;

  @override
  List<Object?> get props => [
        every,
        unit,
      ];
}
