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

/// {@template update_members}
/// An event to update the members of the main contract.
/// {@endtemplate}
class UpdateMembers extends ContractSettingsEvent {
  /// {@macro update_members}
  const UpdateMembers({
    required this.members,
  });

  /// The list of members for the contract.
  final List<Member> members;

  @override
  List<Object> get props => [
        members,
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
