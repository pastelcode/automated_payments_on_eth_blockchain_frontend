part of 'contract_settings_bloc.dart';

/// {@template contract_settings_state}
/// The contract settings state.
/// {@endtemplate}
class ContractSettingsState extends Equatable {
  /// {@macro contract_settings_state}
  const ContractSettingsState({
    required this.members,
    required this.lapses,
    required this.duration,
    this.failure,
  });

  final List<ContractMember> members;
  final ContractLapse lapses;
  final ContractDuration duration;
  final Failure? failure;

  ContractSettingsState copyWith({
    List<ContractMember>? members,
    ContractLapse? lapses,
    ContractDuration? duration,
    Failure? failure,
  }) {
    return ContractSettingsState(
      members: members ?? this.members,
      lapses: lapses ?? this.lapses,
      duration: duration ?? this.duration,
      failure: failure,
    );
  }

  @override
  List<Object?> get props => [
        members,
        lapses,
        duration,
        failure,
      ];
}
