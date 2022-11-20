import 'package:automated_payments_on_eth_blockchain_frontend/features/home/domain/entities/entities.dart';
import 'package:automated_payments_on_eth_blockchain_frontend/features/home/presentation/bloc/contract_settings_bloc/contract_settings_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Duration extends StatefulWidget {
  const Duration();

  @override
  State<Duration> createState() => _DurationState();
}

class _DurationState extends State<Duration> {
  late TextEditingController _endController;
  final _unit = ValueNotifier<DurationUnit?>(null);

  @override
  void initState() {
    super.initState();
    _endController = TextEditingController();
  }

  void _updateDuration({
    required BuildContext context,
  }) {}

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
            const Text(
              'Duration',
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: TextFormField(
                    controller: _endController,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    initialValue: state.duration?.end,
                    decoration: const InputDecoration(
                      label: Text(
                        'Duration',
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
                        return 'Enter a valid number';
                      }
                      return null;
                    },
                    onChanged: print,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: DropdownButtonFormField<DurationUnit>(
                    elevation: 0,
                    value: state.duration?.unit,
                    onChanged: (
                      DurationUnit? unit,
                    ) {
                      _updateDuration(
                        context: context,
                      );
                    },
                    hint: const Text(
                      'Unit',
                    ),
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

  @override
  void dispose() {
    _endController.dispose();
    super.dispose();
  }
}