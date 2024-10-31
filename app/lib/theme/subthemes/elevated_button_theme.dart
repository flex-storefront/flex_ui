import 'package:flex_ui/tokens/colors.dart';
import 'package:flex_ui/tokens/sizes.dart';
import 'package:flutter/material.dart';

class FlexElevatedButtonTheme {
  FlexElevatedButtonTheme._();

  static ElevatedButtonThemeData lightElevatedButtonTheme =
      ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: FlexColors.onPrimary,
      backgroundColor: FlexColors.primary,
      disabledForegroundColor: FlexColors.disabled,
      disabledBackgroundColor: Colors.grey[300],
      padding: const EdgeInsets.all(FlexSizes.lg),
      textStyle: const TextStyle(
        fontSize: FlexSizes.fontSizeSm,
        color: FlexColors.onPrimary,
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
      foregroundColor: FlexColorsDark.onPrimary,
      backgroundColor: FlexColorsDark.primary,
      disabledForegroundColor: FlexColors.disabled,
      disabledBackgroundColor: Colors.grey[300],
      padding: const EdgeInsets.all(FlexSizes.lg),
      textStyle: const TextStyle(
        fontSize: FlexSizes.fontSizeSm,
        color: FlexColorsDark.onPrimary,
        fontWeight: FontWeight.w600,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(FlexSizes.borderRadiusSm),
      ),
    ),
  );
}
