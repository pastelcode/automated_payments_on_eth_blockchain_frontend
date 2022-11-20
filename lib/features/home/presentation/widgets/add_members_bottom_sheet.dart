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
class MembersBottomSheet extends StatefulWidget {
  /// {@macro members_bottom_sheet}
  const MembersBottomSheet({
    super.key,
  });

  @override
  State<MembersBottomSheet> createState() => _MembersBottomSheetState();
}

class _MembersBottomSheetState extends State<MembersBottomSheet> {
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
        return SliverList(
          delegate: SliverChildListDelegate(
            <Widget>[
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
                        const SizedBox(
                          height: 10,
                        ),
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
                height: 15,
              ),
              Button(
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
            ],
          ),
        );
      },
    );
  }
}
