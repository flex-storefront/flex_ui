import 'package:flex_ui/tokens/colors.dart';
import 'package:flex_ui/tokens/sizes.dart';
import 'package:flutter/material.dart';

class FlexIconButtonTheme {
  FlexIconButtonTheme._();

  static IconButtonThemeData lightIconButtonTheme = IconButtonThemeData(
    style: IconButton.styleFrom(
      elevation: 1,
      shadowColor: FlexAppColorScheme.light.primary,
      foregroundColor: FlexAppColorScheme.light.primary,
      backgroundColor: FlexAppColorScheme.light.onPrimary,
      disabledForegroundColor: FlexAppColorScheme.light.disabled,
      disabledBackgroundColor: FlexAppColorScheme.light.background,
      padding: const EdgeInsets.all(FlexSizes.xs),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(FlexSizes.borderRadiusSm),
      ),
    ),
  );

  static IconButtonThemeData darkIconButtonTheme = IconButtonThemeData(
    style: IconButton.styleFrom(
      elevation: 1,
      shadowColor: FlexAppColorScheme.dark.primary,
      foregroundColor: FlexAppColorScheme.dark.onPrimary,
      backgroundColor: FlexAppColorScheme.dark.primary,
      disabledForegroundColor: FlexAppColorScheme.dark.disabled,
      disabledBackgroundColor: FlexAppColorScheme.dark.onBackground,
      padding: const EdgeInsets.all(FlexSizes.xs),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(FlexSizes.borderRadiusSm),
      ),
    ),
  );
}