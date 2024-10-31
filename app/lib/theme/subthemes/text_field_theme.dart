import 'package:flex_ui/tokens/colors.dart';
import 'package:flutter/material.dart';

class FlexTextFormFieldTheme {
  FlexTextFormFieldTheme._();

  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: FlexAppColorScheme.light.disabled,
    suffixIconColor: FlexAppColorScheme.light.disabled,
    labelStyle: const TextStyle()
        .copyWith(fontSize: 14, color: FlexAppColorScheme.light.primary),
    hintStyle: const TextStyle()
        .copyWith(fontSize: 14, color: FlexAppColorScheme.light.primary),
    errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),
    floatingLabelStyle: const TextStyle()
        .copyWith(color: FlexAppColorScheme.light.primary.withOpacity(0.8)),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: BorderSide(width: 1, color: FlexAppColorScheme.light.disabled),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: BorderSide(width: 1, color: FlexAppColorScheme.light.disabled),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: BorderSide(width: 1, color: FlexAppColorScheme.light.primary),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: BorderSide(width: 1, color: FlexAppColorScheme.light.error),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: BorderSide(width: 2, color: FlexAppColorScheme.light.warning),
    ),
  );

  static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: FlexAppColorScheme.dark.disabled,
    suffixIconColor: FlexAppColorScheme.dark.disabled,
    labelStyle: const TextStyle()
        .copyWith(fontSize: 14, color: FlexAppColorScheme.dark.primary),
    hintStyle: const TextStyle()
        .copyWith(fontSize: 14, color: FlexAppColorScheme.dark.primary),
    errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),
    floatingLabelStyle: const TextStyle()
        .copyWith(color: FlexAppColorScheme.dark.primary.withOpacity(0.8)),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: BorderSide(width: 1, color: FlexAppColorScheme.dark.disabled),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: BorderSide(width: 1, color: FlexAppColorScheme.dark.disabled),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: BorderSide(width: 1, color: FlexAppColorScheme.dark.primary),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: BorderSide(width: 1, color: FlexAppColorScheme.dark.error),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: BorderSide(width: 2, color: FlexAppColorScheme.dark.warning),
    ),
  );
}
