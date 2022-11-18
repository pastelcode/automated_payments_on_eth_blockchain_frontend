import 'package:automated_payments_on_eth_blockchain_frontend/features/home/domain/entities/duration.dart';
import 'package:equatable/equatable.dart';

/// {@template lapsed}
/// A lapsed for the contract.
/// {@endtemplate}
class Lapsed extends Equatable {
  /// {@macro lapsed}
  const Lapsed({
    required this.percents,
    required this.every,
    required this.unit,
  });

  /// The percents of the lapseds.
  final List<String> percents;

  /// The number every lapsed is executed.
  ///
  /// For example: 1, 5, 9.
  final String every;

  /// The time unit for [every].
  final DurationUnit unit;

  @override
  List<Object?> get props => [
        percents,
        every,
        unit,
      ];
}
