import 'package:automated_payments_on_eth_blockchain_frontend/features/home/domain/entities/entities.dart';
import 'package:equatable/equatable.dart';

/// {@template contract_lapse}
/// A lapse for the contract.
/// {@endtemplate}
class ContractLapse extends Equatable {
  /// {@macro contract_lapse}
  const ContractLapse({
    required this.every,
    required this.unit,
  });

  /// The number every lapsed is executed.
  ///
  /// For example: 1, 5, 9.
  final num? every;

  /// The time unit for [every].
  final DurationUnit? unit;

  /// Copies this class with given parameters.
  ContractLapse copyWith({
    num? every,
    DurationUnit? unit,
  }) {
    return ContractLapse(
      every: every ?? this.every,
      unit: unit ?? this.unit,
    );
  }

  @override
  List<Object?> get props => [
        every,
        unit,
      ];
}
