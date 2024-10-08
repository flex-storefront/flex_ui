import 'package:{{project_name.snakeCase()}}/tokens/colors.dart';
import 'package:flutter/material.dart';

class {{project_name.titleCase()}}CardTheme {
  static CardTheme lightCardTheme = const CardTheme(
    color: {{project_name.titleCase()}}Colors.primary,
    clipBehavior: Clip.hardEdge,
  );
  static CardTheme darkCardTheme = const CardTheme(
    color: {{project_name.titleCase()}}ColorsDark.primary,
    clipBehavior: Clip.hardEdge,
  );
}
