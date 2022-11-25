import 'package:automated_payments_on_eth_blockchain_frontend/features/home/domain/entities/entities.dart';
import 'package:equatable/equatable.dart';

/// {@template contractSettings.domain.entities.contractDuration}
/// The duration for the main contract.
/// {@endtemplate}
class ContractDuration extends Equatable {
  /// {@macro contractSettings.domain.entities.contractDuration}
  const ContractDuration({
    required this.end,
    required this.unit,
  });

  /// {@template contractSettings.domain.entities.contractDuration.end}
  /// The end of this contract in number.
  ///
  /// For example: 2, 6, 8.
  /// {@endtemplate}
  final int? end;

  /// {@template contractSettings.domain.entities.contractDuration.unit}
  /// The unit of the time for [end].
  /// {@endtemplate}
  final DurationUnit? unit;

  @override
  List<Object?> get props => [
        end,
        unit,
      ];
}
