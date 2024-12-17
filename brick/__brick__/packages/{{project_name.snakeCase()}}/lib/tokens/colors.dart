import 'package:flutter/material.dart';

/// [FlexAppColorScheme] contains all colors used in the application
/// It's a theme extension so it can be used in [ThemeData], extensions attribut
/// [lightScheme] and [darkScheme] are getter to get access to custom colors
/// More info on this article : https://medium.com/@alexandersnotes/flutter-custom-theme-with-themeextension-792034106abc
class FlexAppColorScheme extends ThemeExtension<FlexAppColorScheme> {
  final Color primary;
  final Color onPrimary;
  final Color secondary;
  final Color onSecondary;
  final Color tertiary;
  final Color onTertiary;
  final Color error;
  final Color onError;
  final Color background;
  final Color onBackground;
  final Color surface;
  final Color onSurface;
  final Color divider;
  final Color scaffold;
  final Color info;
  final Color onInfo;
  final Color success;
  final Color onSuccess;
  final Color warning;
  final Color onWarning;
  final Color disabled;
  final Color onDisabled;
  final Color transparent;

  const FlexAppColorScheme({
    required this.primary,
    required this.onPrimary,
    required this.secondary,
    required this.onSecondary,
    required this.tertiary,
    required this.onTertiary,
    required this.error,
    required this.onError,
    required this.background,
    required this.onBackground,
    required this.surface,
    required this.onSurface,
    required this.divider,
    required this.scaffold,
    required this.info,
    required this.onInfo,
    required this.success,
    required this.onSuccess,
    required this.warning,
    required this.onWarning,
    required this.disabled,
    required this.onDisabled,
    required this.transparent,
  });

  @override
  FlexAppColorScheme copyWith({
    Color? primary,
    Color? onPrimary,
    Color? secondary,
    Color? onSecondary,
    Color? tertiary,
    Color? onTertiary,
    Color? error,
    Color? onError,
    Color? background,
    Color? onBackground,
    Color? surface,
    Color? onSurface,
    Color? divider,
    Color? scaffold,
    Color? info,
    Color? onInfo,
    Color? success,
    Color? onSuccess,
    Color? warning,
    Color? onWarning,
    Color? disabled,
    Color? onDisabled,
    Color? transparent,
  }) {
    return FlexAppColorScheme(
      primary: primary ?? this.primary,
      onPrimary: onPrimary ?? this.onPrimary,
      secondary: secondary ?? this.secondary,
      onSecondary: onSecondary ?? this.onSecondary,
      tertiary: tertiary ?? this.tertiary,
      onTertiary: onTertiary ?? this.onTertiary,
      error: error ?? this.error,
      onError: onError ?? this.onError,
      background: background ?? this.background,
      onBackground: onBackground ?? this.onBackground,
      surface: surface ?? this.surface,
      onSurface: onSurface ?? this.onSurface,
      divider: divider ?? this.divider,
      scaffold: scaffold ?? this.scaffold,
      info: info ?? this.info,
      onInfo: onInfo ?? this.onInfo,
      success: success ?? this.success,
      onSuccess: onSuccess ?? this.onSuccess,
      warning: warning ?? this.warning,
      onWarning: onWarning ?? this.onWarning,
      disabled: disabled ?? this.disabled,
      onDisabled: onDisabled ?? this.onDisabled,
      transparent: transparent ?? this.transparent,
    );
  }

  @override
  FlexAppColorScheme lerp(ThemeExtension<FlexAppColorScheme>? other, double t) {
    if (other is! FlexAppColorScheme) {
      return this;
    }
    return FlexAppColorScheme(
      primary: Color.lerp(primary, other.primary, t)!,
      onPrimary: Color.lerp(onPrimary, other.onPrimary, t)!,
      secondary: Color.lerp(secondary, other.secondary, t)!,
      onSecondary: Color.lerp(onSecondary, other.onSecondary, t)!,
      tertiary: Color.lerp(tertiary, other.tertiary, t)!,
      onTertiary: Color.lerp(onTertiary, other.onTertiary, t)!,
      error: Color.lerp(error, other.error, t)!,
      onError: Color.lerp(onError, other.onError, t)!,
      background: Color.lerp(background, other.background, t)!,
      onBackground: Color.lerp(onBackground, other.onBackground, t)!,
      surface: Color.lerp(surface, other.surface, t)!,
      onSurface: Color.lerp(onSurface, other.onSurface, t)!,
      divider: Color.lerp(divider, other.divider, t)!,
      scaffold: Color.lerp(scaffold, other.scaffold, t)!,
      info: Color.lerp(info, other.info, t)!,
      onInfo: Color.lerp(onInfo, other.onInfo, t)!,
      success: Color.lerp(success, other.success, t)!,
      onSuccess: Color.lerp(onSuccess, other.onSuccess, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
      onWarning: Color.lerp(onWarning, other.onWarning, t)!,
      disabled: Color.lerp(disabled, other.disabled, t)!,
      onDisabled: Color.lerp(onDisabled, other.onDisabled, t)!,
      transparent: Color.lerp(transparent, other.transparent, t)!,
    );
  }

  static const lightScheme = FlexAppColorScheme(
    primary: Color.fromRGBO(103, 58, 183, 1.0),
    onPrimary: Color.fromRGBO(250, 250, 250, 1),
    secondary: Color.fromRGBO(36, 55, 254, 1),
    onSecondary: Color.fromRGBO(250, 250, 250, 1),
    tertiary: Color.fromRGBO(241, 255, 97, 1),
    onTertiary: Color.fromRGBO(34, 34, 34, 1),
    error: Color.fromRGBO(255, 59, 48, 1.0),
    onError: Color.fromRGBO(250, 250, 250, 1),
    background: Color.fromRGBO(252, 252, 252, 1),
    onBackground: Color.fromRGBO(34, 34, 34, 1),
    surface: Color.fromRGBO(242, 242, 242, 1),
    onSurface: Color.fromRGBO(34, 34, 34, 1),
    divider: Color.fromRGBO(230, 230, 230, 1),
    scaffold: Color.fromRGBO(252, 252, 252, 1),
    info: Color.fromRGBO(0, 122, 255, 1.0),
    onInfo: Color.fromRGBO(250, 250, 250, 1),
    success: Color.fromRGBO(34, 174, 69, 1),
    onSuccess: Color.fromRGBO(250, 250, 250, 1),
    warning: Color.fromRGBO(255, 149, 0, 1.0),
    onWarning: Color.fromRGBO(250, 250, 250, 1),
    disabled: Color.fromRGBO(142, 142, 147, 1.0),
    onDisabled: Color.fromRGBO(250, 250, 250, 1),
    transparent: Colors.transparent,
  );

  static const darkScheme = FlexAppColorScheme(
    primary: Color.fromRGBO(126, 87, 194, 1.0),
    onPrimary: Color.fromRGBO(250, 250, 250, 1),
    secondary: Color.fromRGBO(36, 55, 254, 1),
    onSecondary: Color.fromRGBO(250, 250, 250, 1),
    tertiary: Color.fromRGBO(241, 255, 97, 1),
    onTertiary: Color.fromRGBO(250, 250, 250, 1),
    error: Color.fromRGBO(255, 59, 48, 1.0),
    onError: Color.fromRGBO(250, 250, 250, 1),
    background: Color.fromRGBO(22, 22, 22, 1),
    onBackground: Color.fromRGBO(250, 250, 250, 1),
    surface: Color.fromRGBO(40, 40, 40, 1),
    onSurface: Color.fromRGBO(250, 250, 250, 1),
    divider: Color.fromRGBO(230, 230, 230, 1),
    scaffold: Color.fromRGBO(22, 22, 22, 1),
    info: Color.fromRGBO(0, 122, 255, 1.0),
    onInfo: Color.fromRGBO(250, 250, 250, 1),
    success: Color.fromRGBO(34, 174, 69, 1),
    onSuccess: Color.fromRGBO(250, 250, 250, 1),
    warning: Color.fromRGBO(255, 149, 0, 1.0),
    onWarning: Color.fromRGBO(250, 250, 250, 1),
    disabled: Color.fromRGBO(142, 142, 147, 1.0),
    onDisabled: Color.fromRGBO(250, 250, 250, 1),
    transparent: Colors.transparent,
  );
}
