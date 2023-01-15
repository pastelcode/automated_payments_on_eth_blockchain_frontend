import 'package:automated_payments_on_eth_blockchain_frontend/core/presentation/widgets/custom_snack_bar/custom_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

/// Launches [uri] in the default device browser.
///
/// If [uri] can't be launched, it shows a snackbar with an error message.
Future<void> launchUri({
  required BuildContext context,
  required Uri uri,
}) async {
  if (!await canLaunchUrl(uri)) {
    CustomSnackBar.showSnackBar(
      message: '$uri',
    );
  }
  await launchUrl(
    uri,
    mode: LaunchMode.externalApplication,
  );
}
