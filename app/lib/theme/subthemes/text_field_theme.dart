import 'package:flex_ui/tokens/colors.dart';
import 'package:flutter/material.dart';

class FlexTextFormFieldTheme {
  FlexTextFormFieldTheme._();

  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: FlexAppColorScheme.lightScheme.disabled,
    suffixIconColor: FlexAppColorScheme.lightScheme.disabled,
    labelStyle: const TextStyle()
        .copyWith(fontSize: 14, color: FlexAppColorScheme.lightScheme.primary),
    hintStyle: const TextStyle()
        .copyWith(fontSize: 14, color: FlexAppColorScheme.lightScheme.primary),
    errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),
    floatingLabelStyle: const TextStyle()
        .copyWith(color: FlexAppColorScheme.lightScheme.primary.withOpacity(0.8)),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: BorderSide(width: 1, color: FlexAppColorScheme.lightScheme.disabled),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: BorderSide(width: 1, color: FlexAppColorScheme.lightScheme.disabled),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: BorderSide(width: 1, color: FlexAppColorScheme.lightScheme.primary),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: BorderSide(width: 1, color: FlexAppColorScheme.lightScheme.error),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: BorderSide(width: 2, color: FlexAppColorScheme.lightScheme.warning),
    ),
  );

  static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: FlexAppColorScheme.darkScheme.disabled,
    suffixIconColor: FlexAppColorScheme.darkScheme.disabled,
    labelStyle: const TextStyle()
        .copyWith(fontSize: 14, color: FlexAppColorScheme.darkScheme.primary),
    hintStyle: const TextStyle()
        .copyWith(fontSize: 14, color: FlexAppColorScheme.darkScheme.primary),
    errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),
    floatingLabelStyle: const TextStyle()
        .copyWith(color: FlexAppColorScheme.darkScheme.primary.withOpacity(0.8)),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: BorderSide(width: 1, color: FlexAppColorScheme.darkScheme.disabled),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: BorderSide(width: 1, color: FlexAppColorScheme.darkScheme.disabled),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: BorderSide(width: 1, color: FlexAppColorScheme.darkScheme.primary),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: BorderSide(width: 1, color: FlexAppColorScheme.darkScheme.error),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: BorderSide(width: 2, color: FlexAppColorScheme.darkScheme.warning),
    ),
  );
}
