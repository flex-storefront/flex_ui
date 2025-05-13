import 'package:flex_ui/widgets/shimmer/internal/shimmer_theme.dart';
import 'package:flex_ui/widgets/shimmer/shimmer_box.dart';
import 'package:flutter/material.dart';

class ImageShimmer extends StatelessWidget {
  final double aspectRatio;
  final EdgeInsets? padding;
  const ImageShimmer({
    super.key,
    required this.aspectRatio,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return AspectRatio(
          aspectRatio: aspectRatio,
          child: const ShimmerBox(
            theme: ShimmerTheme(),
          ),
        );
      },
    );
  }
}
