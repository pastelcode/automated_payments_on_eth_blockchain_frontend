import 'package:automated_payments_on_eth_blockchain_frontend/gen/fonts.gen.dart';
import 'package:flutter/material.dart';

/// An interface for application themes.
mixin ApplicationTheme {
  /// The border radius for common elements in application.
  static double get borderRadius => 10;

  /// The primary color of the application.
  static Color get primaryColor => Colors.blueAccent;

  /// The height for global app bars.
  static double get appBarHeight => 85;

  static InputDecorationTheme get _inputDecorationTheme => InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(
              borderRadius,
            ),
          ),
        ),
      );

  static ColorScheme get _lightColorScheme => ColorScheme.fromSeed(
        seedColor: primaryColor,
      );

  static ColorScheme get _darkColorScheme => ColorScheme.fromSeed(
        brightness: Brightness.dark,
        seedColor: primaryColor,
      );

  static ThemeData _getThemeBasedOnColorScheme({
    required ColorScheme colorScheme,
  }) {
    final buttonStyle = TextButton.styleFrom(
      foregroundColor: colorScheme.onSurface,
      elevation: 0,
      padding: const EdgeInsets.all(
        20,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          borderRadius,
        ),
      ),
    );

    return ThemeData(
      colorScheme: colorScheme.copyWith(
        surfaceTint: colorScheme.surface,
      ),
      useMaterial3: true,
      fontFamily: FontFamily.inter,
      appBarTheme: AppBarTheme(
        centerTitle: false,
        toolbarHeight: appBarHeight,
        backgroundColor: colorScheme.surface,
      ),
      canvasColor: colorScheme.surfaceVariant,
      scaffoldBackgroundColor: colorScheme.surface,
      bottomSheetTheme: BottomSheetThemeData(
        modalBackgroundColor: colorScheme.surface,
        clipBehavior: Clip.hardEdge,
      ),
      dialogTheme: DialogTheme(
        backgroundColor: colorScheme.surface,
        elevation: 0,
        actionsPadding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(
              ApplicationTheme.borderRadius,
            ),
          ),
        ),
        // actionsPadding: EdgeInsets.zero,
      ),
      inputDecorationTheme: _inputDecorationTheme,
      textButtonTheme: TextButtonThemeData(
        style: buttonStyle,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: buttonStyle,
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: buttonStyle,
      ),
    );
  }

  /// The light [ThemeData] to pass to a [MaterialApp].
  static ThemeData get lightTheme => _getThemeBasedOnColorScheme(
        colorScheme: _lightColorScheme,
      );

  /// The dark [ThemeData] to pass to a [MaterialApp].
  static ThemeData get darkTheme => _getThemeBasedOnColorScheme(
        colorScheme: _darkColorScheme,
      );
}
