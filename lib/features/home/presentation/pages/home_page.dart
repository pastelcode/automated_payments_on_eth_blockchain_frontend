import 'package:automated_payments_on_eth_blockchain_frontend/core/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

/// {@template home_page}
/// A initial page to show as the home.
/// {@endtemplate}
class HomePage extends StatelessWidget {
  /// {@macro home_page}
  const HomePage({
    super.key,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: Text(
          'Automated Payments on Ethereum Blockchain',
        ),
      ),
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(
                        context,
                      ).size.width *
                      .9 >
                  500
              ? 500
              : MediaQuery.of(
                    context,
                  ).size.width *
                  .9,
          child: ListView(
            padding: const EdgeInsets.only(
              top: 20,
            ),
            children: <Widget>[
              Text(
                'Contract settings',
                style: Theme.of(
                  context,
                ).textTheme.headline5,
              ),
              const _Gap(),
              const _Gap(),
              Row(
                children: <Widget>[
                  const Text(
                    'Members',
                  ),
                  const Spacer(),
                  Button(
                    onPressed: () {},
                    isPrimary: true,
                    title: const Text(
                      'Set up',
                    ),
                  ),
                ],
              ),
              const _Gap(),
              Column(
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
                            if (value == null || int.tryParse(value) == null) {
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Gap extends StatelessWidget {
  const _Gap();

  @override
  Widget build(
    BuildContext context,
  ) {
    return const SizedBox(
      height: 15,
    );
  }
}
