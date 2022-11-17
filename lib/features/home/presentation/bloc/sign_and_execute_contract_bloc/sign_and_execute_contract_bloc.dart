import 'package:automated_payments_on_eth_blockchain_frontend/core/errors/errors.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sign_and_execute_contract_event.dart';
part 'sign_and_execute_contract_state.dart';

/// {@template sign_and_execute_contract_bloc}
/// A bloc to sign and execute the main contract.
///
/// Events:
/// - [SignAndExecuteContract]
///
/// States:
/// - [SignAndExecuteContractState]
/// {@endtemplate}
class SignAndExecuteContractBloc
    extends Bloc<SignAndExecuteContract, SignAndExecuteContractState> {
  /// {@macro sign_and_execute_contract_bloc}
  SignAndExecuteContractBloc()
      : super(
          const SignAndExecuteContractState(
            members: OptionStatus(
              failure: null,
              wasSuccessful: null,
              isLoading: false,
            ),
            duration: OptionStatus(
              failure: null,
              wasSuccessful: null,
              isLoading: false,
            ),
            lapseds: OptionStatus(
              failure: null,
              wasSuccessful: null,
              isLoading: false,
            ),
            membersSigning: OptionStatus(
              failure: null,
              wasSuccessful: null,
              isLoading: false,
            ),
          ),
        ) {
    on<SignAndExecuteContract>(
      _handleSignAndExecuteContract,
    );
  }

  void _handleSignAndExecuteContract(
    SignAndExecuteContract event,
    Emitter<SignAndExecuteContractState> emit,
  ) {}
}
