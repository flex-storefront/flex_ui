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
      disabledForegroundColor: FlexAppColorScheme.lightScheme.disabled,
      disabledBackgroundColor: FlexAppColorScheme.lightScheme.onBackground,
      padding: const EdgeInsets.all(FlexSizes.sm),
      shape: BeveledRectangleBorder(
        borderRadius: BorderRadius.circular(FlexSizes.borderRadiusSm),
      ),
    ),
  );

  static IconButtonThemeData darkIconButtonTheme = IconButtonThemeData(
    style: IconButton.styleFrom(
      elevation: 0,
      backgroundColor: FlexAppColorScheme.darkScheme.onPrimary,
      foregroundColor: FlexAppColorScheme.darkScheme.primary,
      disabledForegroundColor: FlexAppColorScheme.darkScheme.disabled,
      disabledBackgroundColor: FlexAppColorScheme.darkScheme.onBackground,
      padding: const EdgeInsets.all(FlexSizes.sm),
      shape: BeveledRectangleBorder(
        borderRadius: BorderRadius.circular(FlexSizes.borderRadiusSm),
      ),
    ),
  );
}
