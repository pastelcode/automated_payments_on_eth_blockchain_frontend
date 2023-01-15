import 'package:automated_payments_on_eth_blockchain_frontend/core/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';

/// {@template home.presentation.widgets.blockchainAddressInput}
/// An input for a blockchain addresses.
/// {@endtemplate}
class BlockchainAddressInput extends StatefulWidget {
  /// {@macro home.presentation.widgets.blockchainAddressInput}
  const BlockchainAddressInput({
    super.key,
    this.onChanged,
  });

  final void Function(
    String value,
  )? onChanged;

  @override
  State<BlockchainAddressInput> createState() => _BlockchainAddressInputState();
}

class _BlockchainAddressInputState extends State<BlockchainAddressInput> {
  final isValidAddressNotifier = ValueNotifier<bool?>(
    null,
  );

  @override
  Widget build(
    BuildContext context,
  ) {
    return TextFormField(
      onChanged: (
        String value,
      ) {
        widget.onChanged?.call(
          value,
        );
        isValidAddressNotifier.value = value.isValidBlockchainAddress;
      },
      validator: (
        String? value,
      ) {
        if (value == null || value.isEmpty) {
          return 'Enter an address';
        }
        if (!value.isValidBlockchainAddress) {
          return 'Invalid address';
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        suffixIcon: ValueListenableBuilder(
          valueListenable: isValidAddressNotifier,
          builder: (
            BuildContext context,
            bool? isValidAddress,
            Widget? _,
          ) {
            if (isValidAddress == null) {
              return const SizedBox();
            }
            if (!isValidAddress) {
              return Icon(
                FlutterRemix.close_circle_line,
                color: Theme.of(
                  context,
                ).errorColor,
              );
            }
            return const Icon(
              FlutterRemix.checkbox_circle_line,
            );
          },
        ),
      ),
    );
  }
}
