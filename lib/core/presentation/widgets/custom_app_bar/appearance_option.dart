part of 'custom_app_bar.dart';

class _AppearanceOptions extends StatelessWidget {
  const _AppearanceOptions();

  @override
  Widget build(
    BuildContext context,
  ) {
    return ListTile(
      title: const Text(
        'Appearance',
      ),
      onTap: () {
        _AppearanceOptionsBottomSheet.show(
          context: context,
        );
      },
    );
  }
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
    return ListView(
      shrinkWrap: true,
      children: <Widget>[
        BlocBuilder<ThemeBloc, ThemeMode>(
          builder: (
            BuildContext context,
            ThemeMode themeMode,
          ) {
            return GridView.count(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              crossAxisCount: 3,
              crossAxisSpacing: 5,
              children: <Widget>[
                _ChangeAppearanceButton(
                  themeMode: ThemeMode.light,
                  currentThemeMode: themeMode,
                  name: 'Light',
                  icon: const Icon(
                    FlutterRemix.sun_line,
                    size: 32,
                  ),
                  selectedIcon: const Icon(
                    FlutterRemix.sun_fill,
                    size: 32,
                  ),
                ),
                _ChangeAppearanceButton(
                  themeMode: ThemeMode.dark,
                  currentThemeMode: themeMode,
                  name: 'Dark',
                  icon: const Icon(
                    FlutterRemix.moon_line,
                    size: 32,
                  ),
                  selectedIcon: const Icon(
                    FlutterRemix.moon_fill,
                    size: 32,
                  ),
                ),
                _ChangeAppearanceButton(
                  themeMode: ThemeMode.system,
                  currentThemeMode: themeMode,
                  name: 'System',
                  icon: const Icon(
                    FlutterRemix.macbook_line,
                    size: 32,
                  ),
                  selectedIcon: const Icon(
                    FlutterRemix.macbook_fill,
                    size: 32,
                  ),
                ),
              ],
            );
          },
        ),
      ],
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: isSelected ? selectedIcon : icon,
            ),
            const SizedBox(
              height: 10,
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
