import 'package:automated_payments_on_eth_blockchain_frontend/core/presentation/widgets/widgets.dart';
import 'package:automated_payments_on_eth_blockchain_frontend/features/home/presentation/bloc/contract_settings_bloc/contract_settings_bloc.dart';
import 'package:automated_payments_on_eth_blockchain_frontend/features/home/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_remix/flutter_remix.dart';

/// {@template members_bottom_sheet}
/// The content of a bottom sheet that shows the list of members of the main
/// contract and a option to add one more.
/// {@endtemplate}
class AddMembersBottomSheet extends StatefulWidget {
  /// {@macro members_bottom_sheet}
  const AddMembersBottomSheet({
    super.key,
  });

  /// Shows a modal bottom sheet with this widget as content.
  static Future<void> show({
    required BuildContext context,
  }) async {
    await showCustomModalBottomSheet<void>(
      context: context,
      title: const Text(
        'Members',
      ),
      child: const AddMembersBottomSheet(),
    );
  }

  @override
  State<AddMembersBottomSheet> createState() => _AddMembersBottomSheetState();
}

class _AddMembersBottomSheetState extends State<AddMembersBottomSheet> {
  final _isNewMemberFormVisible = ValueNotifier<bool>(
    false,
  );

  void _showNewMemberForm() {
    _isNewMemberFormVisible.value = true;
  }

  void _hideNewMemberForm() {
    _isNewMemberFormVisible.value = false;
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
        return Column(
          children: <Widget>[
            const SumOfMembersPercentMustBe100Banner(),
            const SizedBox(
              height: 40,
            ),
            const MembersList(),
            ValueListenableBuilder(
              valueListenable: _isNewMemberFormVisible,
              builder: (
                BuildContext context,
                bool isNewMemberFormVisible,
                _,
              ) {
                if (!isNewMemberFormVisible) {
                  return Column(
                    children: <Widget>[
                      if (contractSettingsState.members.isEmpty)
                        const NoMembersBanner(),
                      Button(
                        onPressed: _showNewMemberForm,
                        icon: const Icon(
                          FlutterRemix.add_line,
                        ),
                        title: const Text(
                          'Add new',
                        ),
                      ),
                    ],
                  );
                }
                return Column(
                  children: <Widget>[
                    if (contractSettingsState.members.isNotEmpty) ...[
                      const SizedBox(
                        height: 16,
                      ),
                      const Divider(
                        thickness: 1,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                    ],
                    NewMemberForm(
                      onCancel: _hideNewMemberForm,
                    ),
                  ],
                );
              },
            ),
            const SizedBox(
              height: 5,
            ),
            SizedBox(
              width: double.infinity,
              child: Button(
                onPressed: () {
                  Navigator.of(
                    context,
                  ).pop();
                },
                title: const Text(
                  'Done',
                ),
                isPrimary: true,
              ),
            ),
          ],
        );
      },
    );
  }
}
