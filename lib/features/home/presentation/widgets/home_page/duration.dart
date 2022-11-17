part of '../../pages/home_page.dart';

class _Duration extends StatelessWidget {
  const _Duration();

  @override
  Widget build(
    BuildContext context,
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
              child: DropdownButtonFormField(
                elevation: 0,
                hint: const Text(
                  'Unit',
                ),
                items: const <DropdownMenuItem<String>>[
                  DropdownMenuItem<String>(
                    value: 'day',
                    child: Text(
                      'Days',
                    ),
                  ),
                  DropdownMenuItem<String>(
                    value: 'month',
                    child: Text(
                      'Months',
                    ),
                  ),
                  DropdownMenuItem<String>(
                    value: 'year',
                    child: Text(
                      'Year',
                    ),
                  ),
                ],
                onChanged: print,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
