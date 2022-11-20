import 'package:automated_payments_on_eth_blockchain_frontend/core/presentation/widgets/widgets.dart';
import 'package:automated_payments_on_eth_blockchain_frontend/core/theme/theme.dart';
import 'package:automated_payments_on_eth_blockchain_frontend/features/home/presentation/widgets/widgets.dart';
import 'package:automated_payments_on_eth_blockchain_frontend/gen/assets.gen.dart';
import 'package:flutter/material.dart';

/// {@template home_page}
/// A initial page to show as the home.
/// {@endtemplate}
class HomePage extends StatefulWidget {
  /// {@macro home_page}
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKeyToValidate = GlobalKey<FormState>();

  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Row(
          children: <Widget>[
            const Text(
              'Automated Payments',
            ),
            const SizedBox(
              width: 15,
            ),
            Tooltip(
              message: 'Ethereum',
              child: Assets.illustrations.ethereumEthLogo.svg(
                color: Theme.of(
                  context,
                ).colorScheme.onSurface,
                height: ApplicationTheme.appBarHeight - 45,
                semanticsLabel: 'Ethereum',
              ),
            ),
          ],
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
              const Members(),
              const _Gap(),
              const Lapseds(),
              const _Gap(),
              Form(
                key: _formKeyToValidate,
                child: const Duration(),
              ),
              const _Gap(),
              const _Gap(),
              SignAndExecuteButton(
                formKeyToValidate: _formKeyToValidate,
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
      height: 20,
    );
  }
}
