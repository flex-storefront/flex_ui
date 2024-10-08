import 'package:{{project_name.snakeCase()}}/tokens/colors.dart';
import 'package:flutter/material.dart';

class FlexCardTheme {
  static CardTheme lightCardTheme = const CardTheme(
    color: FlexColors.primary,
    clipBehavior: Clip.hardEdge,
  );
  static CardTheme darkCardTheme = const CardTheme(
    color: FlexColorsDark.primary,
    clipBehavior: Clip.hardEdge,
  );
}
