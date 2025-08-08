import 'shimmer_theme.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

/// A container that applies a shimmer loading effect with consistent styling.
///
/// The [FlexShimmerBox] combines shimmer animation with layout and styling from a [ShimmerTheme].
/// It can either take up the full screen dimensions or be constrained to specific dimensions
/// via [width] and [height] parameters.
///
/// Example usage:
/// ```dart
/// FlexShimmerBox(
///   theme: ShimmerTheme.defaults(context),
///   width: 200,  // Optional: specify width
///   height: 100, // Optional: specify height
/// )
/// ```
///
/// If [width] or [height] are not provided, the box will default to the screen's dimensions.
/// All styling (colors, padding, margin, border radius) are controlled by [theme].
///
class FlexShimmerBox extends StatelessWidget {
  final ShimmerTheme theme;
  final double? width;
  final double? height;

  const FlexShimmerBox({
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
  type: FlexShimmerBox,
  path: '[Components]',
)
Widget defaultFlexShimmerBox(BuildContext context) {
  return const FlexShimmerBox(theme: ShimmerTheme());
}

@UseCase(
  name: '1. Fixed Dimensions',
  type: FlexShimmerBox,
  path: '[Components]',
)
Widget fixedSizeFlexShimmerBox(BuildContext context) {
  return const Center(
    child: FlexShimmerBox(
      theme: ShimmerTheme(),
      width: 200,
      height: 100,
    ),
  );
}

@UseCase(
  name: '2. Large Card Style',
  type: FlexShimmerBox,
  path: '[Components]',
)
Widget largeCardFlexShimmerBox(BuildContext context) {
  return Center(
    child: FlexShimmerBox(
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
  type: FlexShimmerBox,
  path: '[Components]',
)
Widget pillFlexShimmerBox(BuildContext context) {
  return Center(
    child: FlexShimmerBox(
      theme: const ShimmerTheme().copyWith(
        borderRadius: 50,
      ),
      width: 120,
      height: 36,
    ),
  );
}
