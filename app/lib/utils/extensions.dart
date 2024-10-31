import 'package:flutter/material.dart';

extension StringExtension on String? {
  bool isNotBlank() => this?.trim().isNotEmpty ?? false;
}

extension BuildContextExtensions on BuildContext {
  ThemeData get _theme => Theme.of(this);
  TextTheme get textTheme => _theme.textTheme;
  ColorScheme get colorScheme => _theme.colorScheme;
  Size get deviceSize => MediaQuery.sizeOf(this);

  // additional helpful getters
  double get screenWidth => deviceSize.width;
  double get screenHeight => deviceSize.height;
  EdgeInsets get padding => MediaQuery.paddingOf(this);
  bool get isDarkMode =>
      MediaQuery.platformBrightnessOf(this) == Brightness.dark;
  bool get isKeyboardVisible => MediaQuery.viewInsetsOf(this).bottom > 0;
}
