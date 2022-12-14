import 'package:automated_payments_on_eth_blockchain_frontend/core/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

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
    return Button(
      onPressed: () {
        formKeyToValidate.currentState?.validate();
      },
      title: const Text(
        'Sign members and execute',
      ),
      isPrimary: true,
    );
  }
}
