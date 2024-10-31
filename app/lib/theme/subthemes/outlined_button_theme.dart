import 'package:flex_ui/tokens/colors.dart';
import 'package:flutter/material.dart';

class FlexOutlinedButtonTheme {
  FlexOutlinedButtonTheme._();

  static OutlinedButtonThemeData lightOutlinedButtonTheme =
      OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: FlexAppColorScheme.light.primary,
      side: BorderSide(color: FlexAppColorScheme.light.info),
      textStyle: TextStyle(
        fontSize: 16,
        color: FlexAppColorScheme.light.primary,
        fontWeight: FontWeight.w600,
      ),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
    ),
  );

  static OutlinedButtonThemeData darkOutlinedButtonTheme =
      OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: FlexAppColorScheme.dark.primary,
      side: BorderSide(color: FlexAppColorScheme.dark.info),
      textStyle: TextStyle(
        fontSize: 16,
        color: FlexAppColorScheme.dark.primary,
        fontWeight: FontWeight.w600,
      ),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
    ),
  );
}
