import 'package:flex_ui/tokens/colors.dart';
import 'package:flutter/material.dart';

class FlexTextTheme {
  FlexTextTheme._();

  static TextStyle textStyle = const TextStyle().copyWith(fontFamily: "Roboto");

  static TextTheme lightTextTheme = TextTheme(
    headlineLarge: textStyle.copyWith(
      fontSize: 32.0,
      fontWeight: FontWeight.bold,
      color: FlexAppColorScheme.lightScheme.onSurface,
    ),
    headlineMedium: textStyle.copyWith(
      fontSize: 24.0,
      fontWeight: FontWeight.w600,
      color: FlexAppColorScheme.lightScheme.onSurface,
    ),
    headlineSmall: textStyle.copyWith(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: FlexAppColorScheme.lightScheme.onSurface,
    ),
    titleLarge: textStyle.copyWith(
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: FlexAppColorScheme.lightScheme.onSurface,
    ),
    titleMedium: textStyle.copyWith(
      fontSize: 16.0,
      fontWeight: FontWeight.w500,
      color: FlexAppColorScheme.lightScheme.onSurface,
    ),
    titleSmall: textStyle.copyWith(
      fontSize: 16.0,
      fontWeight: FontWeight.w400,
      color: FlexAppColorScheme.lightScheme.onSurface,
    ),
    bodyLarge: textStyle.copyWith(
      fontSize: 14.0,
      fontWeight: FontWeight.normal,
      color: FlexAppColorScheme.lightScheme.onSurface,
    ),
    bodyMedium: textStyle.copyWith(
      fontSize: 14.0,
      fontWeight: FontWeight.normal,
      color: FlexAppColorScheme.lightScheme.onSurface,
    ),
    bodySmall: textStyle.copyWith(
      fontSize: 14.0,
      fontWeight: FontWeight.normal,
      color: FlexAppColorScheme.lightScheme.onSurface.withOpacity(0.5),
    ),
    labelLarge: textStyle.copyWith(
      fontSize: 12.0,
      fontWeight: FontWeight.normal,
      color: FlexAppColorScheme.lightScheme.onSurface,
    ),
    labelSmall: textStyle.copyWith(
      fontSize: 12.0,
      fontWeight: FontWeight.normal,
      color: FlexAppColorScheme.lightScheme.onSurface.withOpacity(0.5),
    ),
  );

  static TextTheme darkTextTheme = TextTheme(
    headlineLarge: textStyle.copyWith(
      fontSize: 32.0,
      fontWeight: FontWeight.bold,
      color: FlexAppColorScheme.darkScheme.onSurface,
    ),
    headlineMedium: textStyle.copyWith(
      fontSize: 24.0,
      fontWeight: FontWeight.w600,
      color: FlexAppColorScheme.darkScheme.onSurface,
    ),
    headlineSmall: textStyle.copyWith(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: FlexAppColorScheme.darkScheme.onSurface,
    ),
    titleLarge: textStyle.copyWith(
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: FlexAppColorScheme.darkScheme.onSurface,
    ),
    titleMedium: textStyle.copyWith(
      fontSize: 16.0,
      fontWeight: FontWeight.w500,
      color: FlexAppColorScheme.darkScheme.onSurface,
    ),
    titleSmall: textStyle.copyWith(
      fontSize: 16.0,
      fontWeight: FontWeight.w400,
      color: FlexAppColorScheme.darkScheme.onSurface,
    ),
    bodyLarge: textStyle.copyWith(
      fontSize: 14.0,
      fontWeight: FontWeight.normal,
      color: FlexAppColorScheme.darkScheme.onSurface,
    ),
    bodyMedium: textStyle.copyWith(
      fontSize: 14.0,
      fontWeight: FontWeight.normal,
      color: FlexAppColorScheme.darkScheme.onSurface,
    ),
    bodySmall: textStyle.copyWith(
      fontSize: 14.0,
      fontWeight: FontWeight.normal,
      color: FlexAppColorScheme.darkScheme.onSurface.withOpacity(0.5),
    ),
    labelLarge: textStyle.copyWith(
      fontSize: 12.0,
      fontWeight: FontWeight.normal,
      color: FlexAppColorScheme.darkScheme.onSurface,
    ),
    labelSmall: textStyle.copyWith(
      fontSize: 12.0,
      fontWeight: FontWeight.normal,
      color: FlexAppColorScheme.darkScheme.onSurface.withOpacity(0.5),
    ),
  );
}
