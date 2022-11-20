import 'package:automated_payments_on_eth_blockchain_frontend/core/presentation/widgets/widgets.dart';
import 'package:automated_payments_on_eth_blockchain_frontend/features/home/domain/entities/entities.dart';
import 'package:automated_payments_on_eth_blockchain_frontend/features/home/presentation/bloc/contract_settings_bloc/contract_settings_bloc.dart';
import 'package:automated_payments_on_eth_blockchain_frontend/features/home/presentation/widgets/member_entry.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_remix/flutter_remix.dart';

/// {@template members_list}
/// A list view to show all members with their addresses and percents they are
/// going to pay on the contract.
/// {@endtemplate}
class MembersList extends StatelessWidget {
  /// {@macro members_list}
  const MembersList({
    super.key,
  });

  void _removeMember({
    required BuildContext context,
    required ContractMember member,
  }) {
    context.read<ContractSettingsBloc>().add(
          RemoveMember(
            member: member,
          ),
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
        return ListView.separated(
          itemCount: contractSettingsState.members.length,
          shrinkWrap: true,
          separatorBuilder: (
            _,
            __,
          ) {
            return const SizedBox(
              height: 15,
            );
          },
          itemBuilder: (
            BuildContext context,
            int index,
          ) {
            final member = contractSettingsState.members[index];

            return Row(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(
                    10,
                  ),
                  decoration: BoxDecoration(
                    color: Theme.of(
                      context,
                    ).colorScheme.onSurface.withOpacity(
                          .1,
                        ),
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    '${index + 1}',
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: MemberEntry(
                    address: member.address,
                    percent: member.percent,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Button(
                  onPressed: () {
                    _removeMember(
                      context: context,
                      member: contractSettingsState.members[index],
                    );
                  },
                  title: const Icon(
                    FlutterRemix.delete_bin_line,
                  ),
                  tooltip: 'Delete member',
                ),
              ],
            );
          },
        );
      },
    );
  }
}
