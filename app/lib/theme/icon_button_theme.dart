import 'package:flex_ui/tokens/colors.dart';
import 'package:flex_ui/tokens/sizes.dart';
import 'package:flutter/material.dart';

class FlexIconButtonTheme {
  FlexIconButtonTheme._();

  static IconButtonThemeData lightIconButtonTheme = IconButtonThemeData(
    style: IconButton.styleFrom(
      elevation: 0,
      foregroundColor: FlexColors.onPrimary,
      backgroundColor: FlexColors.primary,
      disabledForegroundColor: FlexColors.disabled,
      disabledBackgroundColor: Colors.grey[300],
      padding: const EdgeInsets.all(FlexSizes.lg),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(FlexSizes.borderRadiusSm),
      ),
      fixedSize: const Size.square(FlexSizes.buttonHeight),
    ),
  );

  static IconButtonThemeData darkIconButtonTheme = IconButtonThemeData(
    style: IconButton.styleFrom(
      elevation: 0,
      foregroundColor: FlexColorsDark.onPrimary,
      backgroundColor: FlexColorsDark.primary,
      disabledForegroundColor: FlexColors.disabled,
      disabledBackgroundColor: Colors.grey[300],
      padding: const EdgeInsets.all(FlexSizes.lg),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(FlexSizes.borderRadiusSm),
      ),
      fixedSize: const Size.square(FlexSizes.buttonHeight),
    ),
  );
}
