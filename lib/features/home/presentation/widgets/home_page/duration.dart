part of '../../pages/home_page.dart';

class _Duration extends StatelessWidget {
  const _Duration();

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
            const _Gap(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: TextFormField(
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
                        return 'Must be a valid number';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: DropdownButtonFormField<DurationUnit>(
                    elevation: 0,
                    value: state.duration?.unit,
                    hint: const Text(
                      'Unit',
                    ),
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
                    onChanged: print,
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
