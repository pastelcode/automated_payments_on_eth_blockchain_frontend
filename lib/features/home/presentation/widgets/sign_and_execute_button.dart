import 'package:automated_payments_on_eth_blockchain_frontend/core/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class SignAndExecuteButton extends StatelessWidget {
  const SignAndExecuteButton({
    required this.formKeyToValidate,
  });

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
