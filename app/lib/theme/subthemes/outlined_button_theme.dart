import 'package:flex_ui/tokens/colors.dart';
import 'package:flex_ui/tokens/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flex_ui/theme/subthemes/text_theme.dart';

class FlexOutlinedButtonTheme {
  FlexOutlinedButtonTheme._();

  static OutlinedButtonThemeData lightOutlinedButtonTheme =
      OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: FlexAppColorScheme.lightScheme.primary,
      side: BorderSide(color: FlexAppColorScheme.lightScheme.primary),
      textStyle:  FlexTextTheme.lightTextTheme.titleLarge?.copyWith(
          color: FlexAppColorScheme.lightScheme.primary
      ),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(FlexSizes.circleRadius),
      ),
    ),
  );

  static OutlinedButtonThemeData darkOutlinedButtonTheme =
      OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: FlexAppColorScheme.darkScheme.primary,
      side: BorderSide(color: FlexAppColorScheme.darkScheme.primary),
      textStyle:  FlexTextTheme.darkTextTheme.titleLarge?.copyWith(
          color: FlexAppColorScheme.lightScheme.primary
      ),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(FlexSizes.circleRadius),
      ),
    ),
  );
}
