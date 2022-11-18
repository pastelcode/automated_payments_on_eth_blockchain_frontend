import 'package:automated_payments_on_eth_blockchain_frontend/core/presentation/widgets/widgets.dart';
import 'package:automated_payments_on_eth_blockchain_frontend/core/theme/theme.dart';
import 'package:automated_payments_on_eth_blockchain_frontend/features/home/domain/entities/entities.dart';
import 'package:automated_payments_on_eth_blockchain_frontend/features/home/presentation/bloc/contract_settings_bloc/contract_settings_bloc.dart';
import 'package:automated_payments_on_eth_blockchain_frontend/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_remix/flutter_remix.dart';

part '../widgets/home_page/duration.dart';
part '../widgets/home_page/lapseds.dart';
part '../widgets/home_page/members.dart';
part '../widgets/home_page/members_list.dart';
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
      appBar: CustomAppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Automated Payments on',
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
