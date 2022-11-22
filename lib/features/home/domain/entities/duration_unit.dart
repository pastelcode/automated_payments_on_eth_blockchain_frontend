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
