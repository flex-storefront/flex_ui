import 'package:flex_ui/utils/extensions.dart';
import 'package:flutter/material.dart';

class ImageError extends StatelessWidget {
  static const double kDefaultIconSize = 24.0;

  const ImageError({
    super.key,
    this.aspectRatio,
    this.iconSize = kDefaultIconSize,
  });

  final double? aspectRatio;
  final double? iconSize;

  @override
  Widget build(BuildContext context) {
    Widget widget = Container(
      color: context.colors.disabled,
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
