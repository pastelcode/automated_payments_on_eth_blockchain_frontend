part of '../../pages/home_page.dart';

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
