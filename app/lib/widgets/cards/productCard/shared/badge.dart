import 'package:flex_ui/tokens/sizes.dart';
import 'package:flex_ui/utils/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

///A simple Badge Widget providing override properties for
///
/// - textColor
/// - iconBackgroundColor
/// - padding
/// - border radius
///
class FlexBadge extends StatelessWidget {
  const FlexBadge({
    super.key,
    required this.label,
    this.iconBackgroundColor,
    this.textColor,
    this.padding,
    this.borderRadius,
  });

  final String label;
  final Color? iconBackgroundColor;
  final Color? textColor;
  final EdgeInsets? padding;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius:
            borderRadius ?? BorderRadius.circular(FlexSizes.circleRadius),
        color: iconBackgroundColor ?? context.brandColors.info,
      ),
      padding: padding ??
          const EdgeInsets.symmetric(
            horizontal: FlexSizes.md,
            vertical: FlexSizes.xxs,
          ),
      child: Text(
        label,
        style: Theme.of(context)
            .textTheme
            .labelSmall
            ?.copyWith(color: context.brandColors.onInfo)
            .copyWith(color: textColor),
      ),
    );
  }
}

@widgetbook.UseCase(
  name: 'Default',
  type: FlexBadge,
  path: '[Components]',
)
Widget defaultBadge(BuildContext context) {
  return const Center(
    child: FlexBadge(
      label: 'New',
    ),
  );
}

@widgetbook.UseCase(
  name: 'Example Parameter Overrides',
  type: FlexBadge,
  path: '[Components]',
)
Widget saleBadge(BuildContext context) {
  return Center(
    child: FlexBadge(
      label: 'sale',
      textColor: context.brandColors.onSuccess,
      iconBackgroundColor: context.brandColors.success,
      borderRadius: BorderRadius.circular(4),
      padding: const EdgeInsets.all(10),
    ),
  );
}
