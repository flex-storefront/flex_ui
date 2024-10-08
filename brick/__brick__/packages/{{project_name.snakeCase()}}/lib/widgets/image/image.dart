import 'package:cached_network_image/cached_network_image.dart';
import 'package:{{project_name.snakeCase()}}/widgets/image/image_error.dart';
import 'package:{{project_name.snakeCase()}}/widgets/image/image_loader.dart';
import 'package:flutter/material.dart';

class FlexImage extends StatelessWidget {
  const FlexImage(
    this.src, {
    super.key,
    this.fit = BoxFit.contain,
    this.placeholderAspectRatio,
    this.height,
    this.width,
    this.placeholder,
    this.error,
  });

  final String src;
  final BoxFit? fit;
  final double? height;
  final double? width;

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
  bool get isRemote => Uri.tryParse(src)?.host.isNotEmpty ?? false;

  @override
  Widget build(BuildContext context) {
    // src could come as empty or 'null' depending on how it is declared
    if (src.isEmpty || src == 'null') {
      return error ??
          ImageError(
            aspectRatio: placeholderAspectRatio,
          );
    }

    if (!isRemote) {
      return Image.asset(
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

    return CachedNetworkImage(
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
  }
}
