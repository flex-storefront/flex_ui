import 'package:flex_ui/widgets/shimmer/internal/shimmer_theme.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

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
    return Shimmer.fromColors(
      baseColor: theme.baseColor,
      highlightColor: theme.highlightColor,
      child: Padding(
        padding: theme.padding,
        child: Container(
          margin: theme.margin,
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(theme.borderRadius),
          ),
        ),
      ),
    );
  }
}

@UseCase(
  name: '0. Default Fullscreen',
  type: ShimmerBox,
  path: '[Components]',
)
Widget defaultShimmerBox(BuildContext context) {
  return const ShimmerBox(theme: ShimmerTheme());
}

@UseCase(
  name: '1. Fixed Dimensions',
  type: ShimmerBox,
  path: '[Components]',
)
Widget fixedSizeShimmerBox(BuildContext context) {
  return const Center(
    child: ShimmerBox(
      theme: ShimmerTheme(),
      width: 200,
      height: 100,
    ),
  );
}

@UseCase(
  name: '2. Large Card Style',
  type: ShimmerBox,
  path: '[Components]',
)
Widget largeCardShimmerBox(BuildContext context) {
  return Center(
    child: ShimmerBox(
      theme: const ShimmerTheme().copyWith(
        padding: const EdgeInsets.all(12),
        borderRadius: 16,
      ),
      width: 300,
      height: 200,
    ),
  );
}

@UseCase(
  name: '3. Small Pill Style',
  type: ShimmerBox,
  path: '[Components]',
)
Widget pillShimmerBox(BuildContext context) {
  return Center(
    child: ShimmerBox(
      theme: const ShimmerTheme().copyWith(
        borderRadius: 50,
      ),
      width: 120,
      height: 36,
    ),
  );
}
