import 'package:flex_ui/theme/sizes.dart';
import 'package:flex_ui/utils/context_extensions.dart';
import 'package:flutter/material.dart';

class ImageError extends StatelessWidget {
  const ImageError({
    super.key,
    this.aspectRatio,
    this.iconSize = FlexSizes.lg,
  });

  final double? aspectRatio;
  final double? iconSize;

  @override
  Widget build(BuildContext context) {
    Widget widget = Container(
      color: context.brandColors.disabled,
      alignment: Alignment.center,
      child: Icon(
        Icons.image_not_supported,
        size: iconSize,
      ),
    );

    if (aspectRatio != null) {
      widget = AspectRatio(
        aspectRatio: aspectRatio!,
        child: widget,
      );
    }

    return widget;
  }
}
