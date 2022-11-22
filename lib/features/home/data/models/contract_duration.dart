import 'package:automated_payments_on_eth_blockchain_frontend/features/home/domain/entities/entities.dart';
import 'package:equatable/equatable.dart';

/// {@template duration}
/// The duration for the main contract.
/// {@endtemplate}
class ContractDuration extends Equatable {
  /// {@macro duration}
  const ContractDuration({
    required this.end,
    required this.unit,
  });

  /// The end of this contract in number.
  ///
  /// For example: 2, 6, 8.
  final int? end;

  /// The unit of the time for [end].
  final DurationUnit? unit;

  /// Copies this class with given parameters.
  ContractDuration copyWith({
    int? end,
    DurationUnit? unit,
  }) {
    return ContractDuration(
      end: end ?? this.end,
      unit: unit ?? this.unit,
    );
  }

  @override
  List<Object?> get props => [
        end,
        unit,
      ];
}
