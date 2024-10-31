import 'package:flex_ui/flex_ui.dart';
import 'package:flutter/material.dart';

class FlexChipTheme {
  FlexChipTheme._();

  static ChipThemeData lightChipTheme = ChipThemeData(
    disabledColor: FlexAppColorScheme.light.disabled.withOpacity(0.4),
    labelStyle: const TextStyle(color: Colors.black),
    selectedColor: FlexAppColorScheme.light.info,
    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
    checkmarkColor: FlexAppColorScheme.light.onPrimary,
  );

  static ChipThemeData darkChipTheme = ChipThemeData(
    disabledColor: FlexAppColorScheme.dark.disabled,
    labelStyle: const TextStyle(color: Colors.white),
    selectedColor: FlexAppColorScheme.dark.info,
    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
    checkmarkColor: FlexAppColorScheme.dark.primary,
  );
}
