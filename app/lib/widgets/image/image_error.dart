import 'package:flex_ui/utils/extensions.dart';
import 'package:flutter/material.dart';

final double kBrokenImageIconSize = 75.0;

class ImageError extends StatelessWidget {
  const ImageError({super.key, this.aspectRatio});

  final double? aspectRatio;

  @override
  Widget build(BuildContext context) {
    Widget widget = Container(
      color: context.colors.disabled,
      alignment: Alignment.center,
      child: Icon(
        Icons.broken_image,
        size: kBrokenImageIconSize,
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
