import 'package:flex_ui/flex_ui.dart';
import 'package:flutter/material.dart';

class ShimmerTheme {
  final Color baseColor;
  final Color highlightColor;
  final BorderRadius borderRadius;
  final EdgeInsets padding;
  final EdgeInsets margin;

  const ShimmerTheme({
    required this.baseColor,
    required this.highlightColor,
    required this.borderRadius,
    required this.padding,
    required this.margin,
  });

  factory ShimmerTheme.defaults(BuildContext context) {
    return ShimmerTheme(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      borderRadius: BorderRadius.circular(FlexSizes.borderRadiusMd),
      padding: EdgeInsets.zero,
      margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
    );
  }

  ShimmerTheme copyWith({
    Color? baseColor,
    Color? highlightColor,
    BorderRadius? borderRadius,
    EdgeInsets? padding,
    EdgeInsets? margin,
  }) {
    return ShimmerTheme(
      baseColor: baseColor ?? this.baseColor,
      highlightColor: highlightColor ?? this.highlightColor,
      borderRadius: borderRadius ?? this.borderRadius,
      padding: padding ?? this.padding,
      margin: margin ?? this.margin,
    );
  }
}
