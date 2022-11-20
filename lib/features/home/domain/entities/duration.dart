import 'package:equatable/equatable.dart';

/// {@template duration}
/// The duration for the main contract.
/// {@endtemplate}
class Duration extends Equatable {
  /// {@macro duration}
  const Duration({
    required this.end,
    required this.unit,
  });

  /// The end of this contract in number.
  ///
  /// For example: 2, 6, 8.
  final String? end;

  /// The unit of the time for [end].
  final DurationUnit? unit;

  @override
  List<Object?> get props => [
        end,
        unit,
      ];
}

/// {@template duration_unit}
/// The units for duration of the contract.
/// {@endtemplate}
enum DurationUnit {
  /// The unit `day`.
  day(
    humanReadableName: 'Days',
  ),

  /// The unit `month`.
  month(
    humanReadableName: 'Months',
  ),

  /// The unit `year`.
  year(
    humanReadableName: 'Years',
  );

  /// {@macro duration_unit}
  const DurationUnit({
    required this.humanReadableName,
  });

  /// The human-readable name for this unit.
  final String humanReadableName;
}
