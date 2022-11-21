import 'package:automated_payments_on_eth_blockchain_frontend/core/presentation/widgets/widgets.dart';
import 'package:automated_payments_on_eth_blockchain_frontend/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';

/// {@template about_bottom_sheet}
/// A bottom sheet to show information about this application.
/// {@endtemplate}
class AboutBottomSheet extends StatelessWidget {
  /// {@macro about_bottom_sheet}
  const AboutBottomSheet({
    super.key,
  });

  /// Show this bottom sheet.
  static Future<void> show({
    required BuildContext context,
  }) async {
    return showCustomModalBottomSheet(
      context: context,
      title: const Text(
        'About',
      ),
      child: const AboutBottomSheet(),
    );
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    return ListView(
      shrinkWrap: true,
      children: <Widget>[
        Assets.illustrations.ethereumEthLogo.svg(
          color: Theme.of(
            context,
          ).colorScheme.onSurface,
          height: 50,
        ),
        const SizedBox(
          height: 25,
        ),
        Text(
          'Automated payments on Ethereum blockchain',
          textAlign: TextAlign.center,
          style: Theme.of(
            context,
          ).textTheme.headline6!.copyWith(
                height: 1.5,
              ),
        ),
        const SizedBox(
          height: 50,
        ),
        Align(
          child: Button(
            onPressed: () {},
            icon: const Icon(
              FlutterRemix.github_line,
            ),
            title: const Text(
              'Github',
            ),
          ),
        ),
      ],
    );
  }
}
