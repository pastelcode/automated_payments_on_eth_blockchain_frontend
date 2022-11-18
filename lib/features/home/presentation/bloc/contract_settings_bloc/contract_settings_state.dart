part of 'contract_settings_bloc.dart';

/// {@template contract_settings_state}
/// The contract settings state.
/// {@endtemplate}
class ContractSettingsState extends Equatable {
  /// {@macro contract_settings_state}
  const ContractSettingsState({
    required this.members,
    required this.lapseds,
    required this.duration,
  });

  final List<Member> members;
  final List<Lapsed> lapseds;
  final Duration? duration;

  @override
  List<Object?> get props => [
        members,
        lapseds,
        duration,
      ];
}
