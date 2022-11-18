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

  final List<Member> members;
  final List<Lapsed> lapseds;
  final Duration? duration;
  final Failure? failure;

  ContractSettingsState copyWith({
    List<Member>? members,
    List<Lapsed>? lapseds,
    Duration? duration,
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
