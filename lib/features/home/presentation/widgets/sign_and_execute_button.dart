import 'package:automated_payments_on_eth_blockchain_frontend/core/presentation/widgets/widgets.dart';
import 'package:automated_payments_on_eth_blockchain_frontend/features/home/presentation/bloc/contract_settings_bloc/contract_settings_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// {@template sign_and_execute_button}
/// A button to sign members for the contract and execute it.
/// {@endtemplate}
class SignAndExecuteButton extends StatelessWidget {
  /// {@macro sign_and_execute_button}
  const SignAndExecuteButton({
    super.key,
    required this.formKeyToValidate,
  });

  /// The duration form key to validate before signing and executing the
  /// contract.
  final GlobalKey<FormState> formKeyToValidate;

  @override
  Widget build(
    BuildContext context,
  ) {
    return BlocListener<ContractSettingsBloc, ContractSettingsState>(
      listener: (
        BuildContext context,
        ContractSettingsState contractSettingsState,
      ) {
        if (contractSettingsState.failure != null) {
          CustomSnackBar.showErrorSnackBar(
            message: contractSettingsState.failure!.message,
          );
        }
      },
      child: Button(
        onPressed: () {
          if (formKeyToValidate.currentState!.validate()) {
            context.read<ContractSettingsBloc>().add(
                  const ValidateMembersPercent(),
                );
          }
        },
        title: const Text(
          'Sign members and execute',
        ),
        isPrimary: true,
      ),
    );
  }
}
