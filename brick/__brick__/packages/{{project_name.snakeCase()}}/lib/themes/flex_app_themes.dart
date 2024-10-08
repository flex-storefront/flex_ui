import 'package:{{project_name.snakeCase()}}/themes/card_themes.dart';
import 'package:{{project_name.snakeCase()}}/themes/elevated_button_theme.dart';
import 'package:{{project_name.snakeCase()}}/tokens/colors.dart';
import 'package:{{project_name.snakeCase()}}/tokens/sizes.dart';
import 'package:flutter/material.dart';

class FlexAppThemes {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      scrolledUnderElevation: 0,
      centerTitle: false,
      iconTheme: IconThemeData(color: Colors.black, size: FlexSizes.iconMd),
      actionsIconTheme:
          IconThemeData(color: FlexColors.primary, size: FlexSizes.iconMd),
      titleTextStyle: TextStyle(
        fontSize: FlexSizes.fontSizeXl,
        fontWeight: FontWeight.w600,
        color: FlexColors.primary,
      ),
    ),
    brightness: Brightness.light,
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: FlexColors.primary.withOpacity(0.15),
      indicatorColor: FlexColors.secondary.withOpacity(0.1),
    ),
    primaryColor: FlexColors.primary,
    scaffoldBackgroundColor: FlexColors.scaffold,
    fontFamily: 'Roboto',
    textTheme: Typography.whiteHelsinki,
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: FlexColors.primary,
    ),
    cardTheme: FlexCardTheme.lightCardTheme,
    elevatedButtonTheme: FlexElevatedButtonTheme.lightElevatedButtonTheme,
    // outlinedButtonTheme: FlexOutlinedButtonTheme.lightOutlinedButtonTheme,
    // inputDecorationTheme: RonaTextFormFieldTheme.lightInputDecorationTheme,
    searchBarTheme: SearchBarThemeData(
      backgroundColor: WidgetStateColor.resolveWith((states) => Colors.white),
      elevation: const WidgetStatePropertyAll(0),
      side: const WidgetStatePropertyAll(
        BorderSide(color: FlexColors.primary),
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
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      scrolledUnderElevation: 0,
      centerTitle: false,
      iconTheme: IconThemeData(color: Colors.black, size: FlexSizes.iconMd),
      actionsIconTheme:
          IconThemeData(color: Colors.black, size: FlexSizes.iconMd),
      titleTextStyle: TextStyle(
        fontSize: FlexSizes.fontSizeXl,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
    ),
    brightness: Brightness.dark,
    primaryColor: FlexColors.primary,
    scaffoldBackgroundColor: FlexColorsDark.scaffold,
    textTheme: Typography.blackHelsinki,
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: FlexColors.tertiary,
    ),
    cardTheme: FlexCardTheme.darkCardTheme,
    elevatedButtonTheme: FlexElevatedButtonTheme.darkElevatedButtonTheme,
    // outlinedButtonTheme: FlexOutlinedButtonTheme.darkOutlinedButtonTheme,
    // inputDecorationTheme: RonaTextFormFieldTheme.darkInputDecorationTheme,
    searchBarTheme: SearchBarThemeData(
      elevation: const WidgetStatePropertyAll(0),
      side: const WidgetStatePropertyAll(
        BorderSide(color: FlexColors.primary),
      ),
      shape: WidgetStateProperty.resolveWith(
        (states) => RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(FlexSizes.inputFieldRadius),
        ),
      ),
    ),
  );
}
