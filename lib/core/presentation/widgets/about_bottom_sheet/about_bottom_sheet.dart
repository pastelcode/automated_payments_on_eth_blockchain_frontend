import 'package:automated_payments_on_eth_blockchain_frontend/core/config/config.dart';
import 'package:automated_payments_on_eth_blockchain_frontend/core/presentation/widgets/widgets.dart';
import 'package:automated_payments_on_eth_blockchain_frontend/core/utils/launch_uri.dart';
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
    return Column(
      children: <Widget>[
        ApplicationInformation.logo.svg(
          color: Theme.of(
            context,
          ).colorScheme.onSurface,
          height: 50,
          semanticsLabel: 'Ethereum logo',
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
          height: 25,
        ),
        Align(
          child: Button(
            onPressed: () async {
              await launchUri(
                context: context,
                uri: ApplicationInformation.gitHubRepository,
              );
            },
            icon: const Icon(
              FlutterRemix.github_line,
            ),
            title: const Text(
              'Github',
            ),
          ),
        ),
        Align(
          child: Button(
            onPressed: () async {
              await launchUri(
                context: context,
                uri: ApplicationInformation.contractGitHubRepository,
              );
            },
            icon: const Icon(
              FlutterRemix.github_line,
            ),
            title: const Text(
              'Contract repository',
            ),
          ),
        ),
        Align(
          child: Button(
            onPressed: () {
              showAboutDialog(
                context: context,
                applicationName: 'Automated payments on Ethereum',
                applicationVersion: ApplicationInformation.version,
                applicationIcon: ApplicationInformation.logo.svg(
                  height: 50,
                  color: Theme.of(
                    context,
                  ).colorScheme.onSurface,
                ),
              );
            },
            icon: const Icon(
              FlutterRemix.information_line,
            ),
            title: const Text(
              'More info',
            ),
          ),
        ),
        const SizedBox(
          height: 25,
        ),
        const Text(
          'Made with love by',
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            InkWell(
              onTap: () async {
                await launchUri(
                  context: context,
                  uri: ApplicationInformation.pastelcodeGitHubProfile,
                );
              },
              child: const Text(
                '@pastelcode',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            const Text(
              ' and ',
            ),
            InkWell(
              onTap: () async {
                await launchUri(
                  context: context,
                  uri: ApplicationInformation.xellDartGitHubProfile,
                );
              },
              child: const Text(
                '@xellDart',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'on ',
            ),
            InkWell(
              onTap: () async {
                await launchUri(
                  context: context,
                  uri: ApplicationInformation.distbitGitHubProfile,
                );
              },
              child: const Text(
                '@Distbit',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 25,
        ),
      ],
    );
  }
}
