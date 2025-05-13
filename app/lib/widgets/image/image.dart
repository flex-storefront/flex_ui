import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flex_ui/widgets/image/image_error.dart';
import 'package:flex_ui/widgets/image/image_loader.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class FlexImage extends StatelessWidget {
  const FlexImage(
    this.src, {
    super.key,
    this.fit = BoxFit.contain,
    this.placeholderAspectRatio,
    this.height,
    this.width,
    this.borderRadius,
    this.semantics = 'Image',
    this.placeholder,
    this.error,
  });

  final String src;
  final BoxFit? fit;
  final double? height;
  final double? width;
  final BorderRadius? borderRadius;
  final String semantics;

  final Widget? placeholder;
  final Widget? error;

  /// If the widget size is not constrained by the parent, this param is
  /// necessary to provide a minimum size otherwise the loading/error widget
  /// will be ugly (or invisible if it's just a Container)
  ///
  /// It is not apply to the image itself because when the widget size is not
  /// constrained, we want the image to use its natural aspect ratio.
  ///
  /// If you want the image itself to be constrained, wrap this whole widget by
  /// AspectRatio (or SizedBox, Expanded, etc.) and use the fit param to
  /// specifiy how the image should layout.
  ///
  /// This property has not effect on the placeholder widget if [placeholder] is
  /// provided and/or the error widget if [error] is provided.
  final double? placeholderAspectRatio;

  /// Returns `true` if the image source is a remote URL.
  bool get isRemote {
    final uri = Uri.tryParse(src);
    return uri != null && (uri.scheme == 'http' || uri.scheme == 'https');
  }

  @override
  Widget build(BuildContext context) {
    // Handling for web and tests
    if (kIsWeb || Platform.environment.containsKey('FLUTTER_TEST')) {
      return const Placeholder();
    }

    // src could come as empty or 'null' depending on how it is declared
    if (src.isEmpty || src == 'null') {
      return ClipRRect(
        borderRadius: borderRadius ?? BorderRadius.zero,
        child: Semantics(
          label: semantics,
          child: error ??
              ImageError(
                aspectRatio: placeholderAspectRatio,
              ),
        ),
      );
    }

    Widget content;

    if (isRemote) {
      content = CachedNetworkImage(
        imageUrl: src,
        placeholder: (context, url) =>
            placeholder ??
            ImageLoader(
              aspectRatio: placeholderAspectRatio,
            ),
        errorWidget: (context, url, err) =>
            error ??
            ImageError(
              aspectRatio: placeholderAspectRatio,
            ),
        fit: fit,
        height: height,
        width: width,
      );
    } else {
      content = Image.asset(
        src,
        width: width,
        height: height,
        fit: fit,
        errorBuilder: (context, err, stacktrace) =>
            error ??
            ImageError(
              aspectRatio: placeholderAspectRatio,
            ),
      );
    }

    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.zero,
      child: Semantics(label: semantics, child: content),
    );
  }
}
