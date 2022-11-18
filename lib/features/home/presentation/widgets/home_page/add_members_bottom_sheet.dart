part of '../../pages/home_page.dart';

class _AddMembersBottomSheet extends StatefulWidget {
  const _AddMembersBottomSheet();

  @override
  State<_AddMembersBottomSheet> createState() => _AddMembersBottomSheetState();
}

class _AddMembersBottomSheetState extends State<_AddMembersBottomSheet> {
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
              const _MembersList(),
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
                          const _NoMembersBanner(),
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
                      _NewMemberForm(
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
