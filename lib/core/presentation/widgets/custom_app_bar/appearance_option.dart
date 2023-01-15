part of 'custom_app_bar.dart';

enum _ThemeModes {
  light(
    themeMode: ThemeMode.light,
    name: 'Light',
    icon: FlutterRemix.sun_line,
    selectedIcon: FlutterRemix.sun_fill,
  ),
  dark(
    themeMode: ThemeMode.dark,
    name: 'Dark',
    icon: FlutterRemix.moon_line,
    selectedIcon: FlutterRemix.moon_fill,
  ),
  system(
    themeMode: ThemeMode.system,
    name: 'System',
    icon: FlutterRemix.macbook_line,
    selectedIcon: FlutterRemix.macbook_fill,
  );

  const _ThemeModes({
    required this.themeMode,
    required this.name,
    required this.icon,
    required this.selectedIcon,
  });

  final ThemeMode themeMode;
  final String name;
  final IconData icon;
  final IconData selectedIcon;
}

class _AppearanceOptionsBottomSheet extends StatelessWidget {
  const _AppearanceOptionsBottomSheet();

  static Future<void> show({
    required BuildContext context,
  }) async {
    await showCustomModalBottomSheet<void>(
      context: context,
      title: const Text(
        'Appearance',
      ),
      child: const _AppearanceOptionsBottomSheet(),
    );
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    return BlocBuilder<ThemeBloc, ThemeMode>(
      builder: (
        BuildContext context,
        ThemeMode themeMode,
      ) {
        return Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                for (final mode in _ThemeModes.values)
                  Expanded(
                    child: _ChangeAppearanceButton(
                      themeMode: mode.themeMode,
                      currentThemeMode: themeMode,
                      name: mode.name,
                      icon: Icon(
                        mode.icon,
                        size: 36,
                      ),
                      selectedIcon: Icon(
                        mode.selectedIcon,
                        size: 36,
                      ),
                    ),
                  ),
              ],
            ),
          ],
        );
      },
    );
  }
}

class _ChangeAppearanceButton extends StatelessWidget {
  const _ChangeAppearanceButton({
    required this.currentThemeMode,
    required this.icon,
    required this.selectedIcon,
    required this.name,
    required this.themeMode,
  });

  final ThemeMode currentThemeMode;
  final Widget icon;
  final Widget selectedIcon;
  final String name;
  final ThemeMode themeMode;

  @override
  Widget build(
    BuildContext context,
  ) {
    final theme = Theme.of(
      context,
    );
    final isSelected = currentThemeMode == themeMode;

    return TextButton(
      onPressed: () async {
        context.read<ThemeBloc>().add(
              ChangeTheme(
                themeMode: themeMode,
              ),
            );

        await HapticFeedback.selectionClick();
      },
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            15,
          ),
        ),
        side: BorderSide(
          width: 3,
          color: isSelected ? theme.colorScheme.primary : Colors.transparent,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
        ),
        child: Column(
          children: <Widget>[
            if (isSelected) selectedIcon else icon,
            const SizedBox(
              height: 20,
            ),
            Text(
              name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
