import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';

/// A mixin with functions to show different types of custom snack bars.
mixin CustomSnackBar {
  /// The [ScaffoldMessengerState] to pass to root [MaterialApp].
  static final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

  /// Shows a snack bar with blue background and an information prefix icon.
  static void showInformationSnackBar({
    required String message,
  }) {
    scaffoldMessengerKey.currentState!.hideCurrentSnackBar();
    scaffoldMessengerKey.currentState!.showSnackBar(
      SnackBar(
        backgroundColor: Colors.blue.shade800,
        content: Row(
          children: <Widget>[
            const Icon(
              FlutterRemix.information_line,
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Text(
                message,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Shows a snack bar with amber background and a warning prefix icon.
  static void showWarningSnackBar({
    required String message,
  }) {
    scaffoldMessengerKey.currentState!.hideCurrentSnackBar();
    scaffoldMessengerKey.currentState!.showSnackBar(
      SnackBar(
        backgroundColor: Colors.orange.shade900,
        content: Row(
          children: <Widget>[
            const Icon(
              FlutterRemix.error_warning_line,
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Text(
                message,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Shows a snack bar with red background and a error prefix icon.
  static void showErrorSnackBar({
    required String message,
  }) {
    scaffoldMessengerKey.currentState!.hideCurrentSnackBar();
    scaffoldMessengerKey.currentState!.showSnackBar(
      SnackBar(
        backgroundColor: Colors.red.shade800,
        content: Row(
          children: <Widget>[
            const Icon(
              FlutterRemix.close_circle_line,
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Text(
                message,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Shows a snack bar with green background and a check prefix icon.
  static void showSuccessSnackBar({
    required String message,
  }) {
    scaffoldMessengerKey.currentState!.hideCurrentSnackBar();
    scaffoldMessengerKey.currentState!.showSnackBar(
      SnackBar(
        backgroundColor: Colors.green.shade800,
        content: Row(
          children: <Widget>[
            const Icon(
              FlutterRemix.checkbox_circle_line,
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Text(
                message,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
