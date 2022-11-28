part of 'sign_and_execute_contract_bloc.dart';

/// {@template sign_and_execute_contract_state}
/// A initial state for the status of the signing and execution of contract.
/// {@endtemplate}
class SignAndExecuteContractState extends Equatable {
  /// {@macro sign_and_execute_contract_state}
  const SignAndExecuteContractState({
    required this.members,
    required this.lapse,
    required this.duration,
    required this.membersSigning,
    required this.isLoading,
  });

  /// Whether the contract is waiting to be executed.
  final bool isLoading;

  /// The status for members registering.
  final OptionStatus members;

  /// The status for lapse registering.
  final OptionStatus lapse;

  /// The status for duration registering.
  final OptionStatus duration;

  /// The status for members signing.
  final OptionStatus membersSigning;

  /// Returns a copy of this state with replaced given parameters.
  SignAndExecuteContractState copyWith({
    bool? isLoading,
    OptionStatus? members,
    OptionStatus? lapse,
    OptionStatus? duration,
    OptionStatus? membersSigning,
  }) {
    return SignAndExecuteContractState(
      isLoading: isLoading ?? this.isLoading,
      members: members ?? this.members,
      lapse: lapse ?? this.lapse,
      duration: duration ?? this.lapse,
      membersSigning: membersSigning ?? this.lapse,
    );
  }

  @override
  List<Object> get props => [
        isLoading,
        members,
        lapse,
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

  /// The possible failure if something went wrong.
  final Failure? failure;

  /// Returns a copy of this [OptionStatus] with replaced given parameters.
  OptionStatus copyWith({
    bool? wasSuccessful,
    bool? isLoading,
    Failure? failure,
  }) {
    return OptionStatus(
      wasSuccessful: wasSuccessful ?? this.wasSuccessful,
      isLoading: isLoading ?? this.isLoading,
      failure: failure ?? this.failure,
    );
  }

  @override
  List<Object?> get props => [
        wasSuccessful,
        isLoading,
        failure,
      ];
}
