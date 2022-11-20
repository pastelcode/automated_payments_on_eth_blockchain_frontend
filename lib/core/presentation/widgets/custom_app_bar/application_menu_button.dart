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
    return Button(
      tooltip: 'Settings',
      title: const Icon(
        FlutterRemix.settings_5_line,
      ),
      onPressed: () {
        _showApplicationMenu(
          context: context,
        );
      },
    );
  }

  Future<void> _showApplicationMenu({
    required BuildContext context,
  }) async {
    await showCustomModalBottomSheet<void>(
      context: context,
      title: const Text(
        'Settings',
      ),
      child: const _ApplicationMenuButtonContent(),
    );
  }
}

class _ApplicationMenuButtonContent extends StatelessWidget {
  const _ApplicationMenuButtonContent();

  @override
  Widget build(
    BuildContext context,
  ) {
    return SliverList(
      delegate: SliverChildListDelegate(
        <Widget>[
          const _AppearanceOptions(),
        ],
      ),
    );
  }
}
