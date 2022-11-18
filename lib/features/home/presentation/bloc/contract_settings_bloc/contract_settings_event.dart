part of 'contract_settings_bloc.dart';

/// {@template contract_settings_event}
/// A base abstract class for [ContractSettingsBloc] events.
/// {@endtemplate}
abstract class ContractSettingsEvent extends Equatable {
  /// {@macro contract_settings_event}
  const ContractSettingsEvent();

  @override
  List<Object> get props => [];
}

/// {@template reset_failure}
/// An event to reset the [ContractSettingsState.failure] property.
/// {@endtemplate}
class ResetFailure extends ContractSettingsEvent {
  /// {@macro reset_failure}
  const ResetFailure();
}

/// {@template add_member}
/// An event to add a new member for the main contract.
/// {@endtemplate}
class AddMember extends ContractSettingsEvent {
  /// {@macro add_member}
  const AddMember({
    required this.member,
  });

  /// The member to add to the list of members of the main contract.
  final Member member;

  @override
  List<Object> get props => [
        member,
      ];
}

/// {@template remove_member}
/// An event to delete a member from the list of members for the main contract.
/// {@endtemplate}
class RemoveMember extends ContractSettingsEvent {
  /// {@macro remove_member}
  const RemoveMember({
    required this.member,
  });

  /// The member to be deleted.
  final Member member;

  @override
  List<Object> get props => [
        member,
      ];
}

/// {@template update_lapseds}
/// An event to update the lapseds of the main contract.
/// {@endtemplate}
class UpdateLapseds extends ContractSettingsEvent {
  /// {@macro update_lapseds}
  const UpdateLapseds({
    required this.lapseds,
  });

  /// The list of lapseds for the contract.
  final List<Lapsed> lapseds;

  @override
  List<Object> get props => [
        lapseds,
      ];
}

/// {@template update_duration}
/// An event to update the duration of the main contract.
/// {@endtemplate}
class UpdateDuration extends ContractSettingsEvent {
  /// {@macro update_duration}
  const UpdateDuration({
    required this.duration,
  });

  /// The duration for the contract.
  final Duration duration;

  @override
  List<Object> get props => [
        duration,
      ];
}
