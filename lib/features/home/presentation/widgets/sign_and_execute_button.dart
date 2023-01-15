import 'package:automated_payments_on_eth_blockchain_frontend/core/presentation/widgets/widgets.dart';
import 'package:automated_payments_on_eth_blockchain_frontend/features/home/presentation/bloc/contract_settings_bloc/contract_settings_bloc.dart';
import 'package:automated_payments_on_eth_blockchain_frontend/features/home/presentation/bloc/sign_and_execute_contract_bloc/sign_and_execute_contract_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// {@template sign_and_execute_button}
/// A button to sign members for the contract and execute it.
///
/// This must be a child of a `Form` since it extracts a `FormState` to validate
/// the fields.
/// {@endtemplate}
class SignAndExecuteButton extends StatelessWidget {
  /// {@macro sign_and_execute_button}
  const SignAndExecuteButton({
    super.key,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    final formState = Form.of(
      context,
    );

    return BlocListener<ContractSettingsBloc, ContractSettingsState>(
      listener: (
        BuildContext context,
        ContractSettingsState contractSettingsState,
      ) {
        if (contractSettingsState.failure != null) {
          CustomSnackBar.showSnackBar(
            message: contractSettingsState.failure!.message,
            type: SnackBarType.error,
          );
        }
        if (contractSettingsState.isValidated) {
          context.read<SignAndExecuteContractBloc>().add(
                const SignAndExecuteContract(),
              );
        }
      },
      child: Button(
        onPressed: () {
          if (formState!.validate()) {
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
