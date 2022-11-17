import 'package:automated_payments_on_eth_blockchain_frontend/core/presentation/widgets/widgets.dart';
import 'package:automated_payments_on_eth_blockchain_frontend/core/theme/theme.dart';
import 'package:flutter/material.dart';

part '../widgets/home_page/duration.dart';
part '../widgets/home_page/lapseds.dart';
part '../widgets/home_page/members.dart';
part '../widgets/home_page/sign_and_execute_button.dart';

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
              const _Members(),
              const _Gap(),
              const _Lapseds(),
              const _Gap(),
              const _Duration(),
              const _Gap(),
              const _Gap(),
              const _SignAndExecuteButton(),
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
      height: 20,
    );
  }
}
