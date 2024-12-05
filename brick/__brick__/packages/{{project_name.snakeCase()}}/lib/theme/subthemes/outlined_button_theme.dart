import 'package:{{project_name.snakeCase()}}/tokens/colors.dart';
import 'package:flutter/material.dart';

class FlexOutlinedButtonTheme {
  FlexOutlinedButtonTheme._();

  static OutlinedButtonThemeData lightOutlinedButtonTheme =
      OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: FlexAppColorScheme.lightScheme.primary,
      side: BorderSide(color: FlexAppColorScheme.lightScheme.info),
      textStyle: TextStyle(
        fontSize: 16,
        color: FlexAppColorScheme.lightScheme.primary,
        fontWeight: FontWeight.w600,
      ),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
    ),
  );

  static OutlinedButtonThemeData darkOutlinedButtonTheme =
      OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: FlexAppColorScheme.darkScheme.primary,
      side: BorderSide(color: FlexAppColorScheme.darkScheme.info),
      textStyle: TextStyle(
        fontSize: 16,
        color: FlexAppColorScheme.darkScheme.primary,
        fontWeight: FontWeight.w600,
      ),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
    ),
  );
}
