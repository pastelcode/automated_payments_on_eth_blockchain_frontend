part of '../../pages/home_page.dart';

class _MembersList extends StatefulWidget {
  const _MembersList();

  @override
  State<_MembersList> createState() => _MembersListState();
}

class _MembersListState extends State<_MembersList> {
  final _isNewMemberFormVisible = ValueNotifier<bool>(
    false,
  );
  final _newMemberFormKey = GlobalKey<FormState>();
  late TextEditingController _newMemberAddressController;
  late TextEditingController _newMemberPercentController;

  @override
  void initState() {
    super.initState();
    _newMemberAddressController = TextEditingController();
    _newMemberPercentController = TextEditingController();
  }

  void _showNewMemberForm() {
    _isNewMemberFormVisible.value = true;
  }

  void _saveMember() {
    if (!_newMemberFormKey.currentState!.validate()) {
      return;
    }
    context.read<ContractSettingsBloc>().add(
          AddMember(
            member: Member(
              address: _newMemberAddressController.text,
              percent: _newMemberPercentController.text,
            ),
          ),
        );
  }

  void _clearAndHideNewMemberForm() {
    _newMemberAddressController.clear();
    _newMemberPercentController.clear();
    _isNewMemberFormVisible.value = false;
    context.read<ContractSettingsBloc>().add(
          const ResetFailure(),
        );
  }

  void _removeMember({
    required Member member,
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
    return BlocConsumer<ContractSettingsBloc, ContractSettingsState>(
      listenWhen: (
        ContractSettingsState previousContractSettingsState,
        ContractSettingsState currentContractSettingsState,
      ) {
        return currentContractSettingsState.members.length >
            previousContractSettingsState.members.length;
      },
      listener: (
        BuildContext context,
        ContractSettingsState state,
      ) {
        _clearAndHideNewMemberForm();
      },
      builder: (
        BuildContext context,
        ContractSettingsState contractSettingsState,
      ) {
        return SliverList(
          delegate: SliverChildListDelegate(
            <Widget>[
              ListView.separated(
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
                        child: _MemberEntry(
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
              ),
              ValueListenableBuilder(
                valueListenable: _isNewMemberFormVisible,
                builder: (
                  BuildContext context,
                  bool isNewMemberFormVisible,
                  _,
                ) {
                  void _hideNewMemberForm() {}
                  if (!isNewMemberFormVisible) {
                    return Column(
                      children: <Widget>[
                        if (contractSettingsState.members.isEmpty)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              const Icon(
                                FlutterRemix.user_add_line,
                                size: 72,
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'There are no members',
                                    style: Theme.of(
                                      context,
                                    ).textTheme.headline6,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    'Add a new one in the + button',
                                  ),
                                ],
                              ),
                            ],
                          ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Button(
                            onPressed: _showNewMemberForm,
                            icon: const Icon(
                              FlutterRemix.add_line,
                            ),
                            title: const Text(
                              'Add new',
                            ),
                          ),
                        ),
                      ],
                    );
                  }
                  return Form(
                    key: _newMemberFormKey,
                    child: Column(
                      children: <Widget>[
                        const Divider(
                          thickness: 1,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        _MemberEntry(
                          addressController: _newMemberAddressController,
                          percentController: _newMemberPercentController,
                          onSubmitted: _saveMember,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        if (contractSettingsState.failure != null) ...[
                          DecoratedBox(
                            decoration: BoxDecoration(
                              color: Colors.red.withOpacity(
                                .1,
                              ),
                              borderRadius: BorderRadius.circular(
                                ApplicationTheme.borderRadius,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 15,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  const Icon(
                                    FlutterRemix.error_warning_line,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    '${contractSettingsState.failure?.message}',
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Button(
                              onPressed: _clearAndHideNewMemberForm,
                              title: const Text(
                                'Cancel',
                              ),
                            ),
                            Button(
                              onPressed: _saveMember,
                              icon: const Icon(
                                FlutterRemix.check_line,
                              ),
                              title: const Text(
                                'Save',
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
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

  @override
  void deactivate() {
    context.read<ContractSettingsBloc>().add(
          const ResetFailure(),
        );
    super.deactivate();
  }

  @override
  void dispose() {
    _isNewMemberFormVisible.dispose();
    super.dispose();
  }
}

class _MemberEntry extends StatelessWidget {
  const _MemberEntry({
    this.address,
    this.percent,
    this.addressController,
    this.percentController,
    this.onSubmitted,
  });

  final String? address;
  final String? percent;
  final TextEditingController? addressController;
  final TextEditingController? percentController;
  final void Function()? onSubmitted;

  @override
  Widget build(
    BuildContext context,
  ) {
    final areTextFieldsReadOnly = address != null && percent != null;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          flex: 2,
          child: TextFormField(
            key: Key(
              address ?? '',
            ),
            autofocus: true,
            readOnly: areTextFieldsReadOnly,
            initialValue: address,
            controller: addressController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (
              String? value,
            ) {
              if (value == null ||
                  !RegExp(
                    r'^0x[a-fA-F0-9]{40}$',
                  ).hasMatch(
                    value,
                  )) {
                return 'Enter a valid Ethereum address';
              }
              return null;
            },
            decoration: const InputDecoration(
              label: Text(
                'Address',
              ),
              hintText: '0x52908400098527886E0F7030069857D2E4169EE7',
            ),
          ),
        ),
        const SizedBox(
          width: 15,
        ),
        Expanded(
          child: TextFormField(
            key: Key(
              percent ?? '',
            ),
            readOnly: areTextFieldsReadOnly,
            initialValue: percent,
            controller: percentController,
            keyboardType: const TextInputType.numberWithOptions(
              decimal: true,
            ),
            onFieldSubmitted: (
              _,
            ) {
              onSubmitted?.call();
            },
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (
              String? value,
            ) {
              if (value == null ||
                  double.tryParse(
                        value,
                      ) ==
                      null) {
                return 'Enter a valid number';
              }
              return null;
            },
            decoration: const InputDecoration(
              label: Text(
                'Percent',
              ),
              hintText: '57',
              suffixText: '%',
            ),
          ),
        ),
      ],
    );
  }
}
