import 'package:flex_ui/tokens/colors.dart';
import 'package:flex_ui/tokens/sizes.dart';
import 'package:flutter/material.dart';

class FlexElevatedButtonTheme {
  FlexElevatedButtonTheme._();

  static ElevatedButtonThemeData lightElevatedButtonTheme =
      ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: FlexAppColorScheme.light.onPrimary,
      backgroundColor: FlexAppColorScheme.light.primary,
      disabledForegroundColor: FlexAppColorScheme.light.disabled,
      disabledBackgroundColor: FlexAppColorScheme.light.background,
      padding: const EdgeInsets.all(FlexSizes.lg),
      textStyle:  TextStyle(
        fontSize: FlexSizes.fontSizeSm,
        color: FlexAppColorScheme.light.onPrimary,
        fontWeight: FontWeight.w600,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(FlexSizes.borderRadiusSm),
      ),
    ),
  );

  static ElevatedButtonThemeData darkElevatedButtonTheme =
      ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: FlexAppColorScheme.dark.onPrimary,
      backgroundColor: FlexAppColorScheme.dark.primary,
      disabledForegroundColor: FlexAppColorScheme.dark.disabled,
      disabledBackgroundColor: FlexAppColorScheme.dark.onBackground,
      padding: const EdgeInsets.all(FlexSizes.lg),
      textStyle:  TextStyle(
        fontSize: FlexSizes.fontSizeSm,
        color: FlexAppColorScheme.dark.onPrimary,
        fontWeight: FontWeight.w600,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(FlexSizes.borderRadiusSm),
      ),
    ),
  );
}
