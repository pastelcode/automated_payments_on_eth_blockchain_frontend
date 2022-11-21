part of 'custom_app_bar.dart';

/// {@template application_menu_button}
/// An icon button that shows the application menu.
/// {@endtemplate}
class ApplicationMenuButton extends StatelessWidget {
  /// {@macro application_menu_button}
  const ApplicationMenuButton({
    super.key,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    return IconButton(
      tooltip: 'Settings',
      icon: const Icon(
        FlutterRemix.settings_5_line,
      ),
      onPressed: () {
        _ApplicationMenuBottomSheet.show(
          context: context,
        );
      },
    );
  }
}

class _ApplicationMenuBottomSheet extends StatelessWidget {
  const _ApplicationMenuBottomSheet();

  static Future<void> show({
    required BuildContext context,
  }) async {
    await showCustomModalBottomSheet<void>(
      context: context,
      title: const Text(
        'Settings',
      ),
      child: const _ApplicationMenuBottomSheet(),
    );
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    return ListView(
      shrinkWrap: true,
      children: const <Widget>[
        _AppearanceOptions(),
      ],
    );
  }
}
