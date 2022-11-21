import 'package:flutter/material.dart';

/// {@template member_entry}
/// A row that shows the address of a member and the percent they are going to
/// pay on the contract.
///
/// If [address] and [percent] are null the text fields are editable, so a user
/// can be added using those text fields.
/// {@endtemplate}
class MemberEntry extends StatefulWidget {
  /// {@macro member_entry}
  const MemberEntry({
    super.key,
    this.address,
    this.percent,
    this.addressController,
    this.percentController,
    this.onSubmitted,
  }) : assert(
          (address == null &&
                  percent == null &&
                  addressController != null &&
                  percentController != null &&
                  onSubmitted != null) ||
              (address != null &&
                  percent != null &&
                  addressController == null &&
                  percentController == null &&
                  onSubmitted == null),
          '''
If entry is for read-only purposes, the address and percent must not be null while remaining fields must.''',
        );

  /// The address to show by default.
  final String? address;

  /// The percent to show by default.
  final String? percent;

  /// The [TextEditingController] to get the address that is currently being
  /// typed if a member is being added.
  final TextEditingController? addressController;

  /// The [TextEditingController] to get the percent that is currently being
  /// typed if a member is being added.
  final TextEditingController? percentController;

  /// The function to execute the text fields are submitted.
  final void Function()? onSubmitted;

  @override
  State<MemberEntry> createState() => _MemberEntryState();
}

class _MemberEntryState extends State<MemberEntry> {
  late FocusNode _addressFocusNode;

  @override
  void initState() {
    super.initState();
    _addressFocusNode = FocusNode();
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    final areTextFieldsReadOnly =
        widget.address != null && widget.percent != null;
    // When the user wants to add a new member, the address text field will
    // automatically be focused for the keyboard to appear.
    if (!areTextFieldsReadOnly) {
      _addressFocusNode.requestFocus();
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          flex: 2,
          child: TextFormField(
            key: Key(
              widget.address ?? '',
            ),
            autofocus: true,
            readOnly: areTextFieldsReadOnly,
            initialValue: widget.address,
            controller: widget.addressController,
            focusNode: _addressFocusNode,
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
              widget.percent ?? '',
            ),
            readOnly: areTextFieldsReadOnly,
            initialValue: widget.percent,
            controller: widget.percentController,
            keyboardType: const TextInputType.numberWithOptions(
              decimal: true,
            ),
            onFieldSubmitted: (
              _,
            ) {
              widget.onSubmitted?.call();
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

  @override
  void dispose() {
    _addressFocusNode.dispose();
    super.dispose();
  }
}
