import 'package:flex_ui/tokens/colors.dart';
import 'package:flex_ui/tokens/sizes.dart';
import 'package:flutter/material.dart';

class FlexIconButtonTheme {
  FlexIconButtonTheme._();

  static IconButtonThemeData lightIconButtonTheme = IconButtonThemeData(
    style: IconButton.styleFrom(
      elevation: 1,
      shadowColor: FlexAppColorScheme.lightScheme.primary,
      foregroundColor: FlexAppColorScheme.lightScheme.primary,
      backgroundColor: FlexAppColorScheme.lightScheme.onPrimary,
      disabledForegroundColor: FlexAppColorScheme.lightScheme.disabled,
      disabledBackgroundColor: FlexAppColorScheme.lightScheme.background,
      padding: const EdgeInsets.all(FlexSizes.xs),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(FlexSizes.borderRadiusSm),
      ),
    ),
  );

  static IconButtonThemeData darkIconButtonTheme = IconButtonThemeData(
    style: IconButton.styleFrom(
      elevation: 1,
      shadowColor: FlexAppColorScheme.darkScheme.primary,
      foregroundColor: FlexAppColorScheme.darkScheme.onPrimary,
      backgroundColor: FlexAppColorScheme.darkScheme.primary,
      disabledForegroundColor: FlexAppColorScheme.darkScheme.disabled,
      disabledBackgroundColor: FlexAppColorScheme.darkScheme.onBackground,
      padding: const EdgeInsets.all(FlexSizes.xs),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(FlexSizes.borderRadiusSm),
      ),
    ),
  );
}