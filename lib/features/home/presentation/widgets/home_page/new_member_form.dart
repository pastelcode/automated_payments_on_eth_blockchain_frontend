part of '../../pages/home_page.dart';

class _NewMemberForm extends StatefulWidget {
  const _NewMemberForm({
    this.onCancel,
  });

  final void Function()? onCancel;

  @override
  State<_NewMemberForm> createState() => _NewMemberFormState();
}

class _NewMemberFormState extends State<_NewMemberForm> {
  final _newMemberFormKey = GlobalKey<FormState>();
  late TextEditingController _newMemberAddressController;
  late TextEditingController _newMemberPercentController;

  @override
  void initState() {
    super.initState();
    _newMemberAddressController = TextEditingController();
    _newMemberPercentController = TextEditingController();
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

  void _clearForm() {
    _newMemberAddressController.clear();
    _newMemberPercentController.clear();
    context.read<ContractSettingsBloc>().add(
          const ResetFailure(),
        );
    widget.onCancel?.call();
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
        // Only when a new member is added the form will be cleared.
        return currentContractSettingsState.members.length >
            previousContractSettingsState.members.length;
      },
      listener: (
        BuildContext context,
        ContractSettingsState state,
      ) {
        _clearForm();
      },
      builder: (
        BuildContext context,
        ContractSettingsState contractSettingsState,
      ) {
        return Form(
          key: _newMemberFormKey,
          child: Column(
            children: <Widget>[
              _MemberEntry(
                addressController: _newMemberAddressController,
                percentController: _newMemberPercentController,
                onSubmitted: _saveMember,
              ),
              if (contractSettingsState.failure != null) ...[
                const SizedBox(
                  height: 15,
                ),
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
                    padding: const EdgeInsets.all(
                      15,
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
              ],
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Button(
                    onPressed: _clearForm,
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
    _newMemberAddressController.dispose();
    _newMemberPercentController.dispose();
    super.dispose();
  }
}
