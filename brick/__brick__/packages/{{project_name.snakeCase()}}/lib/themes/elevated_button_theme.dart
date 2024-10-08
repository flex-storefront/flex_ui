import 'package:{{project_name.snakeCase()}}/tokens/colors.dart';
import 'package:{{project_name.snakeCase()}}/tokens/sizes.dart';
import 'package:flutter/material.dart';

class {{project_name.titleCase()}}ElevatedButtonTheme {
  {{project_name.titleCase()}}ElevatedButtonTheme._();

  static ElevatedButtonThemeData lightElevatedButtonTheme =
      ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: {{project_name.titleCase()}}Colors.onPrimary,
      backgroundColor: {{project_name.titleCase()}}Colors.primary,
      disabledForegroundColor: {{project_name.titleCase()}}Colors.disabled,
      disabledBackgroundColor: Colors.grey[300],
      padding: const EdgeInsets.all({{project_name.titleCase()}}Sizes.lg),
      textStyle: const TextStyle(
        fontSize: {{project_name.titleCase()}}Sizes.fontSizeSm,
        color: {{project_name.titleCase()}}Colors.onPrimary,
        fontWeight: FontWeight.w600,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular({{project_name.titleCase()}}Sizes.borderRadiusSm),
      ),
    ),
  );

  static ElevatedButtonThemeData darkElevatedButtonTheme =
      ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: {{project_name.titleCase()}}ColorsDark.onPrimary,
      backgroundColor: {{project_name.titleCase()}}ColorsDark.primary,
      disabledForegroundColor: {{project_name.titleCase()}}Colors.disabled,
      disabledBackgroundColor: Colors.grey[300],
      padding: const EdgeInsets.all({{project_name.titleCase()}}Sizes.lg),
      textStyle: const TextStyle(
        fontSize: {{project_name.titleCase()}}Sizes.fontSizeSm,
        color: {{project_name.titleCase()}}ColorsDark.onPrimary,
        fontWeight: FontWeight.w600,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular({{project_name.titleCase()}}Sizes.borderRadiusSm),
      ),
    ),
  );
}
