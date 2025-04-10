import 'package:flex_ui/tokens/colors.dart';
import 'package:flutter/material.dart';

extension StringExtension on String? {
  bool isNotBlank() => this?.trim().isNotEmpty ?? false;
}

/// SugarSyntax to get access quickly to [ThemeData],[TextTheme] and [FlexAppColorScheme] from context
extension ThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => Theme.of(this).textTheme;
  FlexAppColorScheme get colors =>
      Theme.of(this).extension<FlexAppColorScheme>()!;

  // additional helpful getters

  Size get deviceSize => MediaQuery.sizeOf(this);
  double get screenWidth => deviceSize.width;
  double get screenHeight => deviceSize.height;
  EdgeInsets get padding => MediaQuery.paddingOf(this);
  bool get isDarkMode =>
      MediaQuery.platformBrightnessOf(this) == Brightness.dark;
  bool get isKeyboardVisible => MediaQuery.viewInsetsOf(this).bottom > 0;
}

extension SnackBarExtension on BuildContext {
  void showAppSnackBar({
    required String message,
    bool isError = false,
    String? dismissLabel = '✕',
    bool isDismissable = true,
  }) {
    if (!mounted) return;
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
