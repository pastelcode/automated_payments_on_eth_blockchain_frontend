import 'package:automated_payments_on_eth_blockchain_frontend/core/presentation/widgets/widgets.dart';
import 'package:automated_payments_on_eth_blockchain_frontend/features/home/presentation/bloc/contract_settings_bloc/contract_settings_bloc.dart';
import 'package:automated_payments_on_eth_blockchain_frontend/features/home/presentation/widgets/add_members_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Members extends StatelessWidget {
  const Members();

  Future<void> _showMembersList({
    required BuildContext context,
  }) async {
    await showCustomModalBottomSheet<void>(
      context: context,
      padding: const EdgeInsets.only(
        top: 15,
        right: 50,
        left: 50,
      ),
      title: const Text(
        'Members for contract',
      ),
      child: const AddMembersBottomSheet(),
    );
  }

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
                _showMembersList(
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
