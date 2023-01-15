import 'package:automated_payments_on_eth_blockchain_frontend/core/presentation/widgets/widgets.dart';
import 'package:automated_payments_on_eth_blockchain_frontend/features/home/domain/entities/entities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';

/// {@template duration_form_content}
/// A form content to set the duration of the main contract.
/// {@endtemplate}
class DurationFormContent extends StatefulWidget {
  /// {@macro duration_form_content}
  const DurationFormContent({
    super.key,
    required this.labelForDurationTextField,
    required this.errorMessageForDurationTextField,
    required this.onFieldsChange,
    required this.initialDurationUnitValue,
    required this.initialDurationValue,
  });

  /// The label for duration text field.
  final String labelForDurationTextField;

  /// The error message for duration text field if its value can't be parsed
  /// to [int].
  final String errorMessageForDurationTextField;

  /// The initial value for duration field.
  final int initialDurationValue;

  /// The initial value for duration unit value.
  final DurationUnit initialDurationUnitValue;

  /// The function to execute when any text field changes.
  final void Function({
    String? duration,
    DurationUnit? unit,
  }) onFieldsChange;

  @override
  State<DurationFormContent> createState() => _DurationFormContentState();
}

class _DurationFormContentState extends State<DurationFormContent> {
  late final TextEditingController durationController;

  int _parseNumberToDecreaseOrIncrease() {
    final number = int.tryParse(
      durationController.text,
    );
    if (number != null) {
      return number;
    }
    durationController.text = '1';
    widget.onFieldsChange(
      duration: '1',
    );
    return 0;
  }

  void _decreaseDuration() {
    final number = _parseNumberToDecreaseOrIncrease();
    if (number <= 1) {
      return;
    }
    final decrease = number - 1;
    durationController.text = '$decrease';
    widget.onFieldsChange(
      duration: '$decrease',
    );
  }

  void _increaseDuration() {
    final number = _parseNumberToDecreaseOrIncrease();
    final increase = number + 1;
    durationController.text = '$increase';
    widget.onFieldsChange(
      duration: '$increase',
    );
  }

  @override
  void initState() {
    super.initState();
    durationController = TextEditingController(
      text: '${widget.initialDurationValue}',
    );
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          flex: 2,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Button(
                onPressed: _decreaseDuration,
                title: const Icon(
                  FlutterRemix.subtract_line,
                ),
              ),
              Expanded(
                child: TextFormField(
                  controller: durationController,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    label: Text(
                      widget.labelForDurationTextField,
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
                            null ||
                        int.parse(
                              value,
                            ) <
                            1) {
                      return widget.errorMessageForDurationTextField;
                    }
                    return null;
                  },
                  onChanged: (
                    String value,
                  ) {
                    widget.onFieldsChange(
                      duration: value,
                    );
                  },
                ),
              ),
              Button(
                onPressed: _increaseDuration,
                title: const Icon(
                  FlutterRemix.add_line,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          width: 15,
        ),
        Expanded(
          child: DropdownButtonFormField<DurationUnit>(
            elevation: 0,
            isExpanded: true,
            value: widget.initialDurationUnitValue,
            onChanged: (
              DurationUnit? unit,
            ) {
              widget.onFieldsChange(
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
    );
  }
}
