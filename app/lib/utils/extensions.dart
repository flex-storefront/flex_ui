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

extension ColorOpacity on Color {
  Color adjustOpacity(double opacity) {
    return Color.fromRGBO(
      r.toInt(), // Cast red to int
      g.toInt(), // Cast green to int
      b.toInt(), // Cast blue to int
      opacity, // Opacity remains as a double
    );
  }
}
