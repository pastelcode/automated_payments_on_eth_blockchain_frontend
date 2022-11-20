import 'package:automated_payments_on_eth_blockchain_frontend/core/presentation/widgets/widgets.dart';
import 'package:automated_payments_on_eth_blockchain_frontend/core/theme/theme.dart';
import 'package:automated_payments_on_eth_blockchain_frontend/features/home/presentation/bloc/contract_settings_bloc/contract_settings_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_remix/flutter_remix.dart';

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
            Text(
              '''
Lapseds${state.lapseds.isEmpty ? '' : ' (${state.lapseds.length})'}''',
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
                avatar: Icon(
                  FlutterRemix.error_warning_line,
                  size: Theme.of(
                        context,
                      ).textTheme.caption!.fontSize! *
                      1.5,
                ),
                label: const Text(
                  'Set members first',
                ),
                labelStyle: Theme.of(
                  context,
                ).textTheme.caption,
                backgroundColor: Colors.blue.withOpacity(
                  .1,
                ),
              ),
            ],
            const Spacer(),
            Button(
              onPressed: state.members.isEmpty ? null : () {},
              title: Text(
                state.lapseds.isEmpty ? 'Set up' : 'View',
              ),
              tooltip: state.members.isEmpty ? 'Set members first' : '',
            ),
          ],
        );
      },
    );
  }
}
