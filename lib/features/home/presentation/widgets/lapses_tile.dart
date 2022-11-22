import 'package:automated_payments_on_eth_blockchain_frontend/core/theme/theme.dart';
import 'package:automated_payments_on_eth_blockchain_frontend/features/home/presentation/bloc/contract_settings_bloc/contract_settings_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// {@template lapses_tile}
/// A tile to set/view the lapses of the main contract.
/// {@endtemplate}
class LapsesTile extends StatelessWidget {
  /// {@macro lapses_tile}
  const LapsesTile({
    super.key,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    return BlocBuilder<ContractSettingsBloc, ContractSettingsState>(
      builder: (
        BuildContext context,
        ContractSettingsState state,
      ) {
        return Row(
          children: <Widget>[
            const Text(
              'Lapse',
            ),
            if (state.members.isEmpty) ...[
              const SizedBox(
                width: 15,
              ),
              Chip(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    ApplicationTheme.borderRadius,
                  ),
                ),
                label: const Text(
                  'Set members first',
                ),
                labelStyle: Theme.of(
                  context,
                ).textTheme.caption!.copyWith(
                      color: Theme.of(
                        context,
                      ).colorScheme.onError,
                    ),
                backgroundColor: Theme.of(
                  context,
                ).colorScheme.error,
              ),
            ],
          ],
        );
      },
    );
  }
}
