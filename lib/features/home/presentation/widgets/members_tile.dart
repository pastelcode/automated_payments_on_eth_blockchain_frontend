import 'package:automated_payments_on_eth_blockchain_frontend/core/presentation/widgets/widgets.dart';
import 'package:automated_payments_on_eth_blockchain_frontend/features/home/presentation/bloc/contract_settings_bloc/contract_settings_bloc.dart';
import 'package:automated_payments_on_eth_blockchain_frontend/features/home/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// {@template members_tile}
/// A tile to set/view members for the contract.
/// {@endtemplate}
class MembersTile extends StatelessWidget {
  /// {@macro members_tile}
  const MembersTile({
    super.key,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    return BlocBuilder<ContractSettingsBloc, ContractSettingsState>(
      builder: (
        BuildContext context,
        ContractSettingsState contractSettingsState,
      ) {
        return Row(
          children: <Widget>[
            Text(
              'Members (${contractSettingsState.members.length})',
            ),
            const Spacer(),
            Button(
              onPressed: () {
                AddMembersBottomSheet.show(
                  context: context,
                );
              },
              title: Text(
                contractSettingsState.members.isEmpty ? 'Set up' : 'View',
              ),
            )
          ],
        );
      },
    );
  }
}
