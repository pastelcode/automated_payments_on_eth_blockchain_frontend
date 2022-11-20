import 'package:flutter/material.dart';

/// {@template member_entry}
/// A row that shows the address of a member and the percent they are going to
/// pay on the contract.
///
/// If [address] and [percent] are null the text fields are editable, so a user
/// can be added using those text fields.
/// {@endtemplate}
class MemberEntry extends StatelessWidget {
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
