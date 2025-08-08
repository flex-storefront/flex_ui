import 'package:flex_ui/flex_ui.dart';
import 'package:flutter/material.dart';

class ShimmerTheme {
  final Color baseColor;
  final Color highlightColor;
  final double borderRadius;
  final EdgeInsets padding;
  final EdgeInsets margin;

  const ShimmerTheme({
    this.baseColor = DesignTokens.neutralGray300,
    this.highlightColor = DesignTokens.neutralGray100,
    this.borderRadius = FlexSizes.borderRadiusMd,
    this.padding = EdgeInsets.zero,
    this.margin = EdgeInsets.zero,
  });

  ShimmerTheme copyWith({
    Color? baseColor,
    Color? highlightColor,
    double? borderRadius,
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
