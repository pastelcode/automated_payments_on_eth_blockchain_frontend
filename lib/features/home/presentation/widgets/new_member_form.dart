import 'package:automated_payments_on_eth_blockchain_frontend/core/presentation/widgets/widgets.dart';
import 'package:automated_payments_on_eth_blockchain_frontend/features/home/presentation/bloc/contract_settings_bloc/contract_settings_bloc.dart';
import 'package:automated_payments_on_eth_blockchain_frontend/features/home/presentation/widgets/member_entry.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_remix/flutter_remix.dart';

/// {@template new_member_form}
/// A form to add a new member for the contract.
/// {@endtemplate}
class NewMemberForm extends StatefulWidget {
  /// {@macro new_member_form}
  const NewMemberForm({
    super.key,
    this.onCancel,
  });

  /// The function to execute when adding a new member is canceled.
  final void Function()? onCancel;

  @override
  State<NewMemberForm> createState() => _NewMemberFormState();
}

class _NewMemberFormState extends State<NewMemberForm> {
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
            address: _newMemberAddressController.text,
            percent: _newMemberPercentController.text,
          ),
        );
  }

  void _clearForm() {
    _newMemberAddressController.clear();
    _newMemberPercentController.clear();
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
              MemberEntry(
                addressController: _newMemberAddressController,
                percentController: _newMemberPercentController,
                onSubmitted: _saveMember,
              ),
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
  void dispose() {
    _newMemberAddressController.dispose();
    _newMemberPercentController.dispose();
    super.dispose();
  }
}
