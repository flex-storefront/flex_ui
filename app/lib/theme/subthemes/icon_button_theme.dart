import 'package:flex_ui/tokens/colors.dart';
import 'package:flex_ui/tokens/sizes.dart';
import 'package:flutter/material.dart';

class FlexIconButtonTheme {
  FlexIconButtonTheme._();

  static IconButtonThemeData lightIconButtonTheme = IconButtonThemeData(
    style: IconButton.styleFrom(
      elevation: 0,
      backgroundColor: FlexAppColorScheme.lightScheme.onPrimary,
      foregroundColor: FlexAppColorScheme.lightScheme.primary,
      disabledBackgroundColor: FlexAppColorScheme.lightScheme.background,
      disabledForegroundColor: FlexAppColorScheme.lightScheme.disabled,
      padding: const EdgeInsets.all(FlexSizes.sm),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(FlexSizes.borderRadiusSm),
      ),
    ),
  );

  static IconButtonThemeData darkIconButtonTheme = IconButtonThemeData(
    style: IconButton.styleFrom(
      elevation: 0,
      backgroundColor: FlexAppColorScheme.darkScheme.onPrimary,
      foregroundColor: FlexAppColorScheme.darkScheme.primary,
      disabledBackgroundColor: FlexAppColorScheme.darkScheme.background,
      disabledForegroundColor: FlexAppColorScheme.darkScheme.disabled,
      padding: const EdgeInsets.all(FlexSizes.sm),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(FlexSizes.borderRadiusSm),
      ),
    ),
  );
}
