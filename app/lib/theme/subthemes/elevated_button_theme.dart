import 'package:flex_ui/tokens/colors.dart';
import 'package:flex_ui/tokens/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flex_ui/theme/subthemes/text_theme.dart';

class FlexElevatedButtonTheme {
  FlexElevatedButtonTheme._();

  static ElevatedButtonThemeData lightElevatedButtonTheme =
      ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 1,
      foregroundColor: FlexAppColorScheme.lightScheme.onPrimary,
      backgroundColor: FlexAppColorScheme.lightScheme.primary,
      disabledForegroundColor: FlexAppColorScheme.lightScheme.onPrimary,
      disabledBackgroundColor: FlexAppColorScheme.lightScheme.disabled,
      padding: const EdgeInsets.all(FlexSizes.md),
      textStyle:  FlexTextTheme.lightTextTheme.titleMedium?.copyWith(
          fontSize: FlexSizes.fontSizeSm,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(FlexSizes.circleRadius),
      ),
    ),
  );

  static ElevatedButtonThemeData darkElevatedButtonTheme =
      ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 1,
      foregroundColor: FlexAppColorScheme.darkScheme.onPrimary,
      backgroundColor: FlexAppColorScheme.darkScheme.primary,
      disabledForegroundColor: FlexAppColorScheme.darkScheme.onPrimary,
      disabledBackgroundColor: FlexAppColorScheme.darkScheme.disabled,
      padding: const EdgeInsets.all(FlexSizes.md),
      textStyle:  FlexTextTheme.lightTextTheme.titleMedium?.copyWith(
        fontSize: FlexSizes.fontSizeSm,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(FlexSizes.circleRadius),
      ),
    ),
  );
}
