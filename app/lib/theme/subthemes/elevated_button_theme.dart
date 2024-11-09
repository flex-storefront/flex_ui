import 'package:flex_ui/tokens/colors.dart';
import 'package:flex_ui/tokens/sizes.dart';
import 'package:flutter/material.dart';

class FlexElevatedButtonTheme {
  FlexElevatedButtonTheme._();

  static ElevatedButtonThemeData lightElevatedButtonTheme =
      ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: FlexAppColorScheme.lightScheme.onPrimary,
      backgroundColor: FlexAppColorScheme.lightScheme.primary,
      disabledForegroundColor: FlexAppColorScheme.lightScheme.onPrimary,
      disabledBackgroundColor: FlexAppColorScheme.lightScheme.disabled,
      padding: const EdgeInsets.all(FlexSizes.lg),
      textStyle:  TextStyle(
        fontSize: FlexSizes.fontSizeSm,
        color: FlexAppColorScheme.lightScheme.onPrimary,
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
      foregroundColor: FlexAppColorScheme.darkScheme.onPrimary,
      backgroundColor: FlexAppColorScheme.darkScheme.primary,
      disabledForegroundColor: FlexAppColorScheme.darkScheme.onPrimary,
      disabledBackgroundColor: FlexAppColorScheme.darkScheme.disabled,
      padding: const EdgeInsets.all(FlexSizes.lg),
      textStyle:  TextStyle(
        fontSize: FlexSizes.fontSizeSm,
        color: FlexAppColorScheme.darkScheme.onPrimary,
        fontWeight: FontWeight.w600,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(FlexSizes.borderRadiusSm),
      ),
    ),
  );
}
