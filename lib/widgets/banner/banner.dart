import 'package:flex_ui/flex_ui.dart';
import 'package:flex_ui/tokens/sizes.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

enum FlexBannerImageLayout {
  /// Image is firstly visible, the rest of the element are shown after the
  /// image (i.e. on the right if the orientation is horizontal, at the bottom
  /// if orientation is vertical)
  start,

  /// Image is lastly visible, the rest of the element are shown before the
  /// image (i.e. on the left if the orientation is horizontal, at the top
  /// if orientation is vertical)
  end,
}

class FlexBanner extends StatelessWidget {
  const FlexBanner({
    super.key,
    required this.title,
    required this.image,
    this.orientation = Axis.horizontal,
    this.imageLayout = FlexBannerImageLayout.end,
    this.theme,
    this.heading,
    this.description,
    this.button,
  });

  final Widget title;

  final FlexImage image;

  final Axis orientation;

  final FlexBannerImageLayout imageLayout;

  final CardTheme? theme;

  // TODO Implement this, I'm thinking a heading line above the title to emphasise the title
  final Widget? heading;

  // TODO Implement this
  final Widget? description;

  /// TODO Make a standard button. Also: should be a list of buttons for more flexibility
  final AddToCartButton? button;

  @override
  Widget build(BuildContext context) {
    // ignore: non_constant_identifier_names
    final MainLayout = orientation == Axis.horizontal ? Row.new : Column.new;

    final cardChildren = [
      Padding(
        padding: const EdgeInsets.all(FlexSizes.spacerDefault),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (heading != null) ...[
              heading!,
              const SizedBox(height: FlexSizes.spacerDefault),
            ],
            title,
            if (description != null) ...[
              const SizedBox(height: FlexSizes.spacerDefault),
              description!,
            ],
          ],
        ),
      ),
      Flexible(child: image),
    ];

    Widget widget = Card(
      color: theme?.color,
      child: MainLayout(
        mainAxisSize: MainAxisSize.min,
        children: imageLayout == FlexBannerImageLayout.end
            ? cardChildren
            : cardChildren.reversed.toList(),
      ),
    );

    if (theme != null) {
      final appCardTheme = Theme.of(context).cardTheme;

      widget = Theme(
        data: Theme.of(context).copyWith(
          cardTheme: appCardTheme.copyWith(
            clipBehavior: appCardTheme.clipBehavior,
            color: appCardTheme.color,
            shadowColor: appCardTheme.shadowColor,
            surfaceTintColor: appCardTheme.surfaceTintColor,
            elevation: appCardTheme.elevation,
            margin: appCardTheme.margin,
            shape: appCardTheme.shape,
          ),
        ),
        child: widget,
      );
    }

    return widget;
  }
}

@widgetbook.UseCase(
  name: 'Minimal',
  type: FlexBanner,
)
Widget minimalBanner(BuildContext context) {
  final color = context.knobs.colorOrNull(
    label: 'Background Color',
    initialValue: null,
  );

  final theme =
      color != null ? CardTheme.of(context).copyWith(color: color) : null;

  return Center(
    child: FlexBanner(
      title: Text(
        context.knobs.string(
          label: 'Title',
          initialValue: 'Halloween specials!',
        ),
      ),
      image: const FlexImage(
        'https://loremflickr.com/240/320?lock=666',
        placeholder: SizedBox.shrink(),
      ),
      orientation: context.knobs.boolean(
        label: 'Horizontal',
        initialValue: true,
      )
          ? Axis.horizontal
          : Axis.vertical,
      imageLayout: context.knobs.boolean(
        label: 'Image End',
        initialValue: true,
      )
          ? FlexBannerImageLayout.end
          : FlexBannerImageLayout.start,
      theme: theme,
    ),
  );
}
