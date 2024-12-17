import 'package:{{project_name.snakeCase()}}/{{project_name.snakeCase()}}.dart';
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
    this.themeData,
    this.overline,
    this.description,
    this.button,
  });

  final Widget title;

  final Widget image;

  final Axis orientation;

  final FlexBannerImageLayout imageLayout;

  final CardThemeData? themeData;

  final Widget? overline;

  final Widget? description;

  /// TODO Implement this, also: make it a List< Widget >?
  final Widget? button;

  @override
  Widget build(BuildContext context) {
    // ignore: non_constant_identifier_names
    final MainLayout = orientation == Axis.horizontal ? Row.new : Column.new;

    final cardChildren = [
      Flexible(
        child: Padding(
          padding: const EdgeInsets.all(FlexSizes.spacerDefault),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (overline != null) ...[
                overline!,
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
      ),
      Flexible(child: image),
    ];

    Widget widget = Card(
      color: themeData?.color,
      child: MainLayout(
        mainAxisSize: MainAxisSize.min,
        children: imageLayout == FlexBannerImageLayout.end
            ? cardChildren
            : cardChildren.reversed.toList(),
      ),
    );

    if (themeData != null) {
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
  name: 'Standard',
  type: FlexBanner,
  path: '[Components]',
)
Widget standardBanner(BuildContext context) {
  final color = context.knobs.colorOrNull(
    label: 'Background Color',
    initialValue: null,
  );

  final themeData = color != null ? CardThemeData(color: color) : null;

  final overlineText = context.knobs.stringOrNull(
    label: 'Heading',
    initialValue: 'FEATURED',
  );

  final descriptionText = context.knobs.stringOrNull(
    label: 'Description',
    initialValue:
        'Feeling spooky? Get our best halloween deals now before it\'s too late!',
  );

  return Center(
    child: FlexBanner(
      overline: overlineText != null
          ? Text(
              overlineText,
              style: Theme.of(context).textTheme.labelSmall,
              textAlign: TextAlign.center,
            )
          : null,
      title: Text(
        context.knobs.string(
          label: 'Title',
          initialValue: 'Halloween specials!',
        ),
        style: Theme.of(context).textTheme.titleMedium,
        textAlign: TextAlign.center,
      ),
      description: descriptionText != null
          ? Text(
              descriptionText,
              style: Theme.of(context).textTheme.bodySmall,
              textAlign: TextAlign.center,
            )
          : null,
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
      themeData: themeData,
    ),
  );
}
