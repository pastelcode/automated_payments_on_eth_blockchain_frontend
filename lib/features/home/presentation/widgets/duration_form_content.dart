import 'package:automated_payments_on_eth_blockchain_frontend/features/home/domain/entities/entities.dart';
import 'package:automated_payments_on_eth_blockchain_frontend/features/home/presentation/bloc/contract_settings_bloc/contract_settings_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// {@template duration_form_content}
/// A form content to set the duration of the main contract.
/// {@endtemplate}
class DurationFormContent extends StatelessWidget {
  /// {@macro duration_form_content}
  const DurationFormContent({
    super.key,
    required this.title,
    required this.labelForDurationTextField,
    required this.errorMessageForDurationTextField,
    required this.onFieldsChange,
  });

  /// The title for this duration form.
  final String title;

  /// The label for duration text field.
  final String labelForDurationTextField;

  /// The error message for duration text field if its value can't be parsed
  /// to [int].
  final String errorMessageForDurationTextField;

  final void Function({
    String? duration,
    DurationUnit? unit,
  }) onFieldsChange;

  @override
  Widget build(
    BuildContext context,
  ) {
    return BlocBuilder<ContractSettingsBloc, ContractSettingsState>(
      builder: (
        BuildContext context,
        ContractSettingsState state,
      ) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      label: Text(
                        labelForDurationTextField,
                      ),
                      hintText: '4',
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (
                      String? value,
                    ) {
                      if (value == null ||
                          int.tryParse(
                                value,
                              ) ==
                              null) {
                        return errorMessageForDurationTextField;
                      }
                      return null;
                    },
                    onChanged: (
                      String value,
                    ) {
                      onFieldsChange(
                        duration: value,
                      );
                    },
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: DropdownButtonFormField<DurationUnit>(
                    elevation: 0,
                    isExpanded: true,
                    value: state.duration.unit,
                    onChanged: (
                      DurationUnit? unit,
                    ) {
                      onFieldsChange(
                        unit: unit,
                      );
                    },
                    hint: const Text(
                      'Time unit',
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (
                      DurationUnit? value,
                    ) {
                      if (value == null) {
                        return 'Select a time unit';
                      }
                      return null;
                    },
                    items: List<DropdownMenuItem<DurationUnit>>.generate(
                      DurationUnit.values.length,
                      (
                        int index,
                      ) {
                        return DropdownMenuItem<DurationUnit>(
                          value: DurationUnit.values[index],
                          child: Text(
                            DurationUnit.values[index].humanReadableName,
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
