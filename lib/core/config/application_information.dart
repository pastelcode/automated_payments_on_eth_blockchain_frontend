import 'package:automated_payments_on_eth_blockchain_frontend/gen/assets.gen.dart';

/// A mixin that contains basic information about this application, like
/// repositories links, version number, etc.
mixin ApplicationInformation {
  /// The logo of this application.
  static SvgGenImage get logo => Assets.illustrations.ethereumEthLogo;

  /// The version of this application.
  static String get version => '0.1.0';

  /// The GitHub repository uri of this application.
  static Uri get gitHubRepository => Uri.https(
        'github.com',
        'pastelcode/automated_payments_on_eth_blockchain_frontend',
      );

  /// The GitHub repository uri of the smart contract.
  static Uri get contractGitHubRepository => Uri.https(
        'github.com',
        'pastelcode/automated-payments-on-eth-blockchain',
      );

  /// The GitHub profile uri of @pastelcode.
  static Uri get pastelcodeGitHubProfile => Uri.https(
        'github.com',
        'pastelcode',
      );

  /// The GitHub profile uri of @xellDart.
  static Uri get xellDartGitHubProfile => Uri.https(
        'github.com',
        'xellDart',
      );

  /// The Github profile uri of @Distbit.
  static Uri get distbitGitHubProfile => Uri.https(
        'github.com',
        'dist-bit',
      );
}
