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
    this.failure,
  });

  final List<ContractMember> members;
  final List<ContractLapse> lapseds;
  final ContractDuration? duration;
  final Failure? failure;

  ContractSettingsState copyWith({
    List<ContractMember>? members,
    List<ContractLapse>? lapseds,
    ContractDuration? duration,
    Failure? failure,
  }) {
    return ContractSettingsState(
      members: members ?? this.members,
      lapseds: lapseds ?? this.lapseds,
      duration: duration ?? this.duration,
      failure: failure,
    );
  }

  @override
  List<Object?> get props => [
        members,
        lapseds,
        duration,
        failure,
      ];
}
