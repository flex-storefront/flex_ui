import 'package:flex_ui/tokens/sizes.dart';
import 'package:flex_ui/utils/extensions.dart';
import 'package:flutter/material.dart';

class LeftTopIcon extends StatelessWidget {
  const LeftTopIcon({
    super.key,
    required this.label,
    this.iconBackgroundColor,
    this.textColor,
  });

  final String label;
  final Color? iconBackgroundColor;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(FlexSizes.circleRadius),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: FlexSizes.md,
          vertical: FlexSizes.xxs,
        ),
        color: iconBackgroundColor ?? context.colors.info,
        child: Text(
          label,
          style: Theme.of(context)
              .textTheme
              .labelSmall!
              .copyWith(color: textColor),
        ),
      ),
    );
  }
}
