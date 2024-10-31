import 'package:flex_ui/theme/subthemes/checkbox_theme.dart';
import 'package:flex_ui/theme/subthemes/chip_theme.dart';
import 'package:flex_ui/theme/subthemes/elevated_button_theme.dart';
import 'package:flex_ui/theme/subthemes/icon_button_theme.dart';
import 'package:flex_ui/theme/subthemes/outlined_button_theme.dart';
import 'package:flex_ui/theme/subthemes/text_field_theme.dart';
import 'package:flex_ui/theme/subthemes/text_theme.dart';
import 'package:flex_ui/tokens/colors.dart';
import 'package:flex_ui/tokens/sizes.dart';
import 'package:flutter/material.dart';

class FlexAppThemes {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    extensions: const [FlexAppColorScheme.light],
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      scrolledUnderElevation: 0,
      centerTitle: false,
      iconTheme: IconThemeData(
        color: FlexAppColorScheme.light.primary,
        size: FlexSizes.iconMd,
      ),
      actionsIconTheme: IconThemeData(
        color: FlexAppColorScheme.light.primary,
        size: FlexSizes.iconMd,
      ),
      titleTextStyle: TextStyle(
        fontSize: FlexSizes.fontSizeXl,
        fontWeight: FontWeight.w600,
        color: FlexAppColorScheme.light.primary,
      ),
    ),
    brightness: Brightness.light,
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: FlexAppColorScheme.light.primary.withOpacity(0.15),
      indicatorColor: FlexAppColorScheme.light.secondary.withOpacity(0.1),
    ),
    primaryColor: FlexAppColorScheme.light.primary,
    disabledColor: FlexAppColorScheme.light.disabled,
    scaffoldBackgroundColor: FlexAppColorScheme.light.scaffold,
    fontFamily: 'Roboto',
    textTheme: FlexTextTheme.lightTextTheme,
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: FlexAppColorScheme.light.primary,
    ),
    elevatedButtonTheme: FlexElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: FlexOutlinedButtonTheme.lightOutlinedButtonTheme,
    iconButtonTheme: FlexIconButtonTheme.lightIconButtonTheme,
    checkboxTheme: FlexCheckboxTheme.lightCheckboxTheme,
    chipTheme: FlexChipTheme.lightChipTheme,
    inputDecorationTheme: FlexTextFormFieldTheme.lightInputDecorationTheme,
    searchBarTheme: SearchBarThemeData(
      backgroundColor: WidgetStateColor.resolveWith(
        (states) => FlexAppColorScheme.light.background,
      ),
      elevation: const WidgetStatePropertyAll(0),
      side: WidgetStatePropertyAll(
        BorderSide(color: FlexAppColorScheme.light.primary),
      ),
      shape: WidgetStateProperty.resolveWith(
        (states) => RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(FlexSizes.inputFieldRadius),
        ),
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    extensions: const [FlexAppColorScheme.dark],
    appBarTheme: AppBarTheme(
      backgroundColor: FlexAppColorScheme.dark.transparent,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      scrolledUnderElevation: 0,
      centerTitle: false,
      iconTheme: IconThemeData(
        color: FlexAppColorScheme.dark.onPrimary,
        size: FlexSizes.iconMd,
      ),
      actionsIconTheme: IconThemeData(
        color: FlexAppColorScheme.dark.onPrimary,
        size: FlexSizes.iconMd,
      ),
      titleTextStyle: TextStyle(
        fontSize: FlexSizes.fontSizeXl,
        fontWeight: FontWeight.w600,
        color: FlexAppColorScheme.dark.onPrimary,
      ),
    ),
    brightness: Brightness.dark,
    primaryColor: FlexAppColorScheme.dark.primary,
    disabledColor: FlexAppColorScheme.dark.disabled,
    scaffoldBackgroundColor: FlexAppColorScheme.dark.scaffold,
    textTheme: FlexTextTheme.darkTextTheme,
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: FlexAppColorScheme.dark.tertiary,
    ),
    elevatedButtonTheme: FlexElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: FlexOutlinedButtonTheme.darkOutlinedButtonTheme,
    iconButtonTheme: FlexIconButtonTheme.darkIconButtonTheme,
    checkboxTheme: FlexCheckboxTheme.darkCheckboxTheme,
    chipTheme: FlexChipTheme.darkChipTheme,
    inputDecorationTheme: FlexTextFormFieldTheme.darkInputDecorationTheme,
    searchBarTheme: SearchBarThemeData(
      elevation: const WidgetStatePropertyAll(0),
      side: WidgetStatePropertyAll(
        BorderSide(color: FlexAppColorScheme.dark.onPrimary),
      ),
      shape: WidgetStateProperty.resolveWith(
        (states) => RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(FlexSizes.inputFieldRadius),
        ),
      ),
    ),
  );
}
