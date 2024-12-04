import 'package:flex_ui/tokens/colors.dart';
import 'package:flex_ui/tokens/sizes.dart';
import 'package:flutter/material.dart';

class FlexIconButtonTheme {
  FlexIconButtonTheme._();

  static IconButtonThemeData lightIconButtonTheme = IconButtonThemeData(
    style: IconButton.styleFrom(
      backgroundColor: Colors.transparent,
      foregroundColor: FlexAppColorScheme.lightScheme.primary,
      disabledBackgroundColor: Colors.transparent,
      disabledForegroundColor: FlexAppColorScheme.lightScheme.disabled,
      padding: const EdgeInsets.all(FlexSizes.sm),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(FlexSizes.borderRadiusSm),
      ),
    ),
  );

  static IconButtonThemeData darkIconButtonTheme = IconButtonThemeData(
    style: IconButton.styleFrom(
      backgroundColor: Colors.transparent,
      foregroundColor: FlexAppColorScheme.darkScheme.primary,
      disabledBackgroundColor: Colors.transparent,
      disabledForegroundColor: FlexAppColorScheme.darkScheme.disabled,
      padding: const EdgeInsets.all(FlexSizes.sm),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(FlexSizes.borderRadiusSm),
      ),
    ),
  );
}
