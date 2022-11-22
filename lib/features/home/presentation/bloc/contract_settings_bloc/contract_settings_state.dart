part of 'contract_settings_bloc.dart';

/// {@template contract_settings_state}
/// The contract settings state.
/// {@endtemplate}
class ContractSettingsState extends Equatable {
  /// {@macro contract_settings_state}
  const ContractSettingsState({
    required this.members,
    required this.lapse,
    required this.duration,
  });

  final List<ContractMember> members;
  final ContractLapse lapse;
  final ContractDuration duration;

  ContractSettingsState copyWith({
    List<ContractMember>? members,
    ContractLapse? lapse,
    ContractDuration? duration,
  }) {
    return ContractSettingsState(
      members: members ?? this.members,
      lapse: lapse ?? this.lapse,
      duration: duration ?? this.duration,
    );
  }

  @override
  List<Object?> get props => [
        members,
        lapse,
        duration,
      ];
}
