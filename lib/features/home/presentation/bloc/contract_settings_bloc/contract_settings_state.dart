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
    this.failure,
    required this.isValidated,
  });

  /// The members for the main contract.
  final List<ContractMember> members;

  /// The lapse of payment for the main contract.
  final ContractLapse lapse;

  /// The duration for the main contract.
  final ContractDuration duration;

  /// A possible failure while adding members or validating the contract
  /// settings.
  final Failure? failure;

  /// Whether the contract settings are totally valid and ready to be
  /// submitted;
  final bool isValidated;

  /// Returns a copy of this [ContractSettingsState] with replaced given
  /// parameters.
  ContractSettingsState copyWith({
    List<ContractMember>? members,
    ContractLapse? lapse,
    ContractDuration? duration,
    Failure? failure,
    bool? isValidated,
  }) {
    return ContractSettingsState(
      members: members ?? this.members,
      lapse: lapse ?? this.lapse,
      duration: duration ?? this.duration,
      failure: failure,
      isValidated: isValidated ?? this.isValidated,
    );
  }

  @override
  List<Object?> get props => [
        members,
        lapse,
        duration,
        failure,
        isValidated,
      ];
}
