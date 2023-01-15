import 'package:automated_payments_on_eth_blockchain_frontend/core/presentation/widgets/widgets.dart';
import 'package:automated_payments_on_eth_blockchain_frontend/core/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';

/// {@template core.presentation.widgets.customSnackBar.snackBarType}
/// The available types for [CustomSnackBar].
///
/// It contains the icon and the color to use.
/// {@endtemplate}
enum SnackBarType {
  /// The information type.
  ///
  /// It uses a blue color with an information icon.
  information(
    color: Color(
      0xFF1565C0,
    ),
    icon: Icon(
      FlutterRemix.information_line,
    ),
  ),

  /// The warning type.
  ///
  /// It uses a orange color with an error warning icon.
  warning(
    color: Color(
      0xFFE65100,
    ),
    icon: Icon(
      FlutterRemix.error_warning_line,
    ),
  ),

  /// The error type.
  ///
  /// It uses a red color with a close circle icon.
  error(
    color: Color(
      0xFFC62828,
    ),
    icon: Icon(
      FlutterRemix.close_circle_line,
    ),
  ),

  /// The success type.
  ///
  /// It uses a green color with a checkbox circle icon.
  success(
    color: Color(
      0xFF2E7D32,
    ),
    icon: Icon(
      FlutterRemix.checkbox_circle_line,
    ),
  ),

  /// The loading type.
  ///
  ///
  /// It uses a purple color with circular progress indicator as icon.
  ///
  /// This option is intended to remain on the screen until another snackbar is
  /// shown.
  loading(
    icon: CustomCircularProgressIndicator(
      color: Colors.white,
      size: 24,
    ),
  );

  /// {@macro core.presentation.widgets.customSnackBar.snackBarType}
  const SnackBarType({
    this.color,
    required this.icon,
  });

  /// The color for the snack bar.
  final Color? color;

  /// The icon for the snack bar.
  final Widget icon;
}

/// A mixin with functions to show different types of custom snack bars.
mixin CustomSnackBar {
  /// The [ScaffoldMessengerState] to pass to root [MaterialApp].
  static final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

  /// Shows a custom snack bar with a [message], an icon and an optional
  /// [title].
  ///
  /// To display different types of snack bars (information, success, etc.), use
  /// [type].
  static void showSnackBar({
    String? title,
    required String message,
    SnackBarType type = SnackBarType.information,
  }) {
    scaffoldMessengerKey.currentState!.hideCurrentSnackBar();
    scaffoldMessengerKey.currentState!.showSnackBar(
      SnackBar(
        dismissDirection: type == SnackBarType.loading
            ? DismissDirection.none
            : DismissDirection.down,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(
              ApplicationTheme.borderRadius,
            ),
          ),
        ),
        backgroundColor: type.color ?? ApplicationTheme.primaryColor,
        duration: type == SnackBarType.loading
            ? const Duration(
                days: 1,
              )
            : const Duration(
                milliseconds: 5000,
              ),
        content: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 7,
            horizontal: 12,
          ),
          child: Row(
            children: <Widget>[
              IconTheme(
                data: const IconThemeData(
                  color: Colors.white,
                ),
                child: type.icon,
              ),
              const SizedBox(
                width: 15,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    if (title != null) ...<Widget>[
                      Text(
                        title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                    ],
                    Text(
                      message,
                      maxLines: 3,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
