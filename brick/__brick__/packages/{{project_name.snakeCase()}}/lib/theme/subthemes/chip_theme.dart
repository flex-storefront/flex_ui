import 'package:{{project_name.snakeCase()}}/{{project_name.snakeCase()}}.dart';
import 'package:flutter/material.dart';

class FlexChipTheme {
  FlexChipTheme._();

  static ChipThemeData lightChipTheme = ChipThemeData(
    disabledColor:
        FlexAppColorScheme.lightScheme.disabled.withValues(alpha: 0.4),
    labelStyle: const TextStyle(color: Colors.black),
    selectedColor: FlexAppColorScheme.lightScheme.info,
    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
    checkmarkColor: FlexAppColorScheme.lightScheme.onPrimary,
  );

  static ChipThemeData darkChipTheme = ChipThemeData(
    disabledColor: FlexAppColorScheme.darkScheme.disabled,
    labelStyle: const TextStyle(color: Colors.white),
    selectedColor: FlexAppColorScheme.darkScheme.info,
    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
    checkmarkColor: FlexAppColorScheme.darkScheme.primary,
  );
}
