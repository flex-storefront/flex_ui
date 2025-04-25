import 'package:flex_ui/widgets/shimmer/internal/shimmer_theme.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

/// A container that applies a shimmer loading effect with consistent styling.
///
/// The [ShimmerBox] combines shimmer animation with layout and styling from a [ShimmerTheme].
/// It can either take up the full screen dimensions or be constrained to specific dimensions
/// via [width] and [height] parameters.
///
/// Example usage:
/// ```dart
/// ShimmerBox(
///   theme: ShimmerTheme.defaults(context),
///   width: 200,  // Optional: specify width
///   height: 100, // Optional: specify height
/// )
/// ```
///
/// If [width] or [height] are not provided, the box will default to the screen's dimensions.
/// All styling (colors, padding, margin, border radius) are controlled by [theme].
///
class ShimmerBox extends StatelessWidget {
  final ShimmerTheme theme;
  final double? width;
  final double? height;

  const ShimmerBox({
    super.key,
    this.theme = const ShimmerTheme(),
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Shimmer.fromColors(
      baseColor: theme.baseColor,
      highlightColor: theme.highlightColor,
      child: Padding(
        padding: theme.padding,
        child: Container(
          margin: theme.margin,
          width: width ?? size.width,
          height: height ?? size.height,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(theme.borderRadius),
          ),
        ),
      ),
    );
  }
}
