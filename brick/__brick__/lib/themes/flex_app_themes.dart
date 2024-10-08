import 'package:{{project_name.snakeCase()}}/themes/card_themes.dart';
import 'package:{{project_name.snakeCase()}}/themes/elevated_button_theme.dart';
import 'package:{{project_name.snakeCase()}}/tokens/colors.dart';
import 'package:{{project_name.snakeCase()}}/tokens/sizes.dart';
import 'package:flutter/material.dart';

class {{project_name.titleCase()}}AppThemes {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      scrolledUnderElevation: 0,
      centerTitle: false,
      iconTheme: IconThemeData(color: Colors.black, size: {{project_name.titleCase()}}Sizes.iconMd),
      actionsIconTheme:
          IconThemeData(color: {{project_name.titleCase()}}Colors.primary, size: {{project_name.titleCase()}}Sizes.iconMd),
      titleTextStyle: TextStyle(
        fontSize: {{project_name.titleCase()}}Sizes.fontSizeXl,
        fontWeight: FontWeight.w600,
        color: {{project_name.titleCase()}}Colors.primary,
      ),
    ),
    brightness: Brightness.light,
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: {{project_name.titleCase()}}Colors.primary.withOpacity(0.15),
      indicatorColor: {{project_name.titleCase()}}Colors.secondary.withOpacity(0.1),
    ),
    primaryColor: {{project_name.titleCase()}}Colors.primary,
    scaffoldBackgroundColor: {{project_name.titleCase()}}Colors.scaffold,
    fontFamily: 'Roboto',
    textTheme: Typography.whiteHelsinki,
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: {{project_name.titleCase()}}Colors.primary,
    ),
    cardTheme: {{project_name.titleCase()}}CardTheme.lightCardTheme,
    elevatedButtonTheme: {{project_name.titleCase()}}ElevatedButtonTheme.lightElevatedButtonTheme,
    // outlinedButtonTheme: {{project_name.titleCase()}}OutlinedButtonTheme.lightOutlinedButtonTheme,
    // inputDecorationTheme: RonaTextFormFieldTheme.lightInputDecorationTheme,
    searchBarTheme: SearchBarThemeData(
      backgroundColor: WidgetStateColor.resolveWith((states) => Colors.white),
      elevation: const WidgetStatePropertyAll(0),
      side: const WidgetStatePropertyAll(
        BorderSide(color: {{project_name.titleCase()}}Colors.primary),
      ),
      shape: WidgetStateProperty.resolveWith(
        (states) => RoundedRectangleBorder(
          borderRadius: BorderRadius.circular({{project_name.titleCase()}}Sizes.inputFieldRadius),
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
      iconTheme: IconThemeData(color: Colors.black, size: {{project_name.titleCase()}}Sizes.iconMd),
      actionsIconTheme:
          IconThemeData(color: Colors.black, size: {{project_name.titleCase()}}Sizes.iconMd),
      titleTextStyle: TextStyle(
        fontSize: {{project_name.titleCase()}}Sizes.fontSizeXl,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
    ),
    brightness: Brightness.dark,
    primaryColor: {{project_name.titleCase()}}Colors.primary,
    scaffoldBackgroundColor: {{project_name.titleCase()}}ColorsDark.scaffold,
    textTheme: Typography.blackHelsinki,
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: {{project_name.titleCase()}}Colors.tertiary,
    ),
    cardTheme: {{project_name.titleCase()}}CardTheme.darkCardTheme,
    elevatedButtonTheme: {{project_name.titleCase()}}ElevatedButtonTheme.darkElevatedButtonTheme,
    // outlinedButtonTheme: {{project_name.titleCase()}}OutlinedButtonTheme.darkOutlinedButtonTheme,
    // inputDecorationTheme: RonaTextFormFieldTheme.darkInputDecorationTheme,
    searchBarTheme: SearchBarThemeData(
      elevation: const WidgetStatePropertyAll(0),
      side: const WidgetStatePropertyAll(
        BorderSide(color: {{project_name.titleCase()}}Colors.primary),
      ),
      shape: WidgetStateProperty.resolveWith(
        (states) => RoundedRectangleBorder(
          borderRadius: BorderRadius.circular({{project_name.titleCase()}}Sizes.inputFieldRadius),
        ),
      ),
    ),
  );
}
