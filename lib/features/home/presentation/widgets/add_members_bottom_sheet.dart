import 'package:automated_payments_on_eth_blockchain_frontend/core/presentation/widgets/widgets.dart';
import 'package:automated_payments_on_eth_blockchain_frontend/features/home/presentation/bloc/contract_settings_bloc/contract_settings_bloc.dart';
import 'package:automated_payments_on_eth_blockchain_frontend/features/home/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_remix/flutter_remix.dart';

class AddMembersBottomSheet extends StatefulWidget {
  const AddMembersBottomSheet();

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
