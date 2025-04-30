import 'package:flex_ui/tokens/colors.dart';
import 'package:flutter/material.dart';

extension StringExtension on String? {
  bool isNotBlank() => this?.trim().isNotEmpty ?? false;
}

/// SugarSyntax to get access quickly to [ThemeData],[TextTheme] and [FlexAppColorScheme] from context
extension ThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => Theme.of(this).textTheme;
  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  /// Get the [FlexAppColorScheme] from the current theme.
  /// This is a custom extension that provides access to the FLEX color scheme
  /// Defaults to [FlexAppColorScheme.lightScheme] if not found.
  FlexAppColorScheme get colors =>
      Theme.of(this).extension<FlexAppColorScheme>() ??
      FlexAppColorScheme.lightScheme;

  Size get deviceSize => MediaQuery.sizeOf(this);
  double get screenWidth => deviceSize.width;
  double get screenHeight => deviceSize.height;
  EdgeInsets get padding => MediaQuery.paddingOf(this);
  bool get isDarkMode =>
      MediaQuery.platformBrightnessOf(this) == Brightness.dark;
  bool get isKeyboardVisible => MediaQuery.viewInsetsOf(this).bottom > 0;
}

extension SnackBarStateExtension<T extends StatefulWidget> on State<T> {
  void showAppSnackBar({
    required String message,
    bool isError = false,
    String? dismissLabel = '✕',
    bool isDismissable = true,
  }) {
    if (!mounted) return;
    context._showAppSnackBarInternal(
      message: message,
      isError: isError,
      dismissLabel: dismissLabel,
      isDismissable: isDismissable,
    );
  }
}

extension SnackBarContextExtension on BuildContext {
  void showAppSnackBar({
    required String message,
    bool isError = false,
    String? dismissLabel = '✕',
    bool isDismissable = true,
  }) {
    _showAppSnackBarInternal(
      message: message,
      isError: isError,
      dismissLabel: dismissLabel,
      isDismissable: isDismissable,
    );
  }

  void _showAppSnackBarInternal({
    required String message,
    required bool isError,
    required String? dismissLabel,
    required bool isDismissable,
  }) {
    ScaffoldMessenger.of(this).hideCurrentSnackBar();
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message, style: const TextStyle(color: Colors.white)),
        backgroundColor: isError ? Colors.deepOrange : Colors.green,
        behavior: SnackBarBehavior.floating,
        action: isDismissable && dismissLabel != null
            ? SnackBarAction(
                label: dismissLabel,
                textColor: Colors.white,
                onPressed: () {
                  ScaffoldMessenger.of(this).hideCurrentSnackBar();
                },
              )
            : null,
      ),
    );
  }
}
