import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';

/// {@template custom_close_button}
/// A custom close button.
///
/// Mostly used in bottom sheets and modals.
/// {@endtemplate}
class CustomCloseButton extends StatelessWidget {
  /// {@macro custom_close_button}
  const CustomCloseButton({
    super.key,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Theme.of(
          context,
        ).colorScheme.onSurface.withOpacity(
              0.05,
            ),
      ),
      child: IconButton(
        tooltip: 'Close',
        icon: const Icon(
          FlutterRemix.close_line,
          size: 20,
        ),
        onPressed: () {
          Navigator.maybePop(
            context,
          );
        },
      ),
    );
  }
}
