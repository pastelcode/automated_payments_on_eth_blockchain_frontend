part of 'sign_and_execute_contract_bloc.dart';

/// {@template sign_and_execute_contract_state}
/// A initial state for the status of the signing and execution of contract.
/// {@endtemplate}
class SignAndExecuteContractState extends Equatable {
  /// {@macro sign_and_execute_contract_state}
  const SignAndExecuteContractState({
    required this.members,
    required this.lapseds,
    required this.duration,
    required this.membersSigning,
  });

  /// The status for members registering.
  final OptionStatus members;

  /// The status for lapseds registering.
  final OptionStatus lapseds;

  /// The status for duration registering.
  final OptionStatus duration;

  /// The status for members signing.
  final OptionStatus membersSigning;

  @override
  List<Object> get props => [
        members,
        lapseds,
        duration,
        membersSigning,
      ];
}

/// {@template option_status}
/// A class to represent the status of every contract transaction.
///
/// For example, whether it was successful or whether it has any failure.
/// {@endtemplate}
class OptionStatus extends Equatable {
  /// {@macro option_status}
  const OptionStatus({
    required this.wasSuccessful,
    required this.isLoading,
    required this.failure,
  });

  /// Whether it was successful.
  final bool? wasSuccessful;

  /// Whether it is loading.
  final bool isLoading;

  /// The possible failure it something went wrong.
  final Failure? failure;

  @override
  List<Object?> get props => [
        wasSuccessful,
        isLoading,
        failure,
      ];
}
