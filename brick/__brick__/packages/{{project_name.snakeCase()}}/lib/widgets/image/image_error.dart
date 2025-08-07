import 'package:{{project_name.snakeCase()}}/utils/extensions.dart';
import 'package:flutter/material.dart';

class ImageError extends StatelessWidget {
  const ImageError({super.key, this.aspectRatio});

  final double? aspectRatio;

  @override
  Widget build(BuildContext context) {
    Widget widget = Container(
      color: context.colorScheme.disabled,
      alignment: Alignment.center,
      child: const Icon(Icons.error),
    );

    if (aspectRatio != null) {
      widget = AspectRatio(aspectRatio: aspectRatio!, child: widget);
    }

    return widget;
  }
}
