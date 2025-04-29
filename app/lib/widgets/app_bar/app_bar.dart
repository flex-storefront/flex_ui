import 'package:flex_ui/flex_ui.dart';
import 'package:flex_ui/tokens/sizes.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

/// [FlexAppBar] is a flex implementation of [AppBar].
///
/// [LeadingIcon] and [TrailingIcon] are IconData with their owns onPressed function.
///
/// If you provide an Icon, you must provide his onPressed function.
class FlexAppBar extends StatelessWidget implements PreferredSizeWidget {
  const FlexAppBar({
    super.key,
    this.title,
    this.leadingIcon,
    this.trailingIcon,
    this.onLeadingIconPressed,
    this.onTrailingIconPressed,
    this.backgroundColor,
    this.iconTheme,
    this.trailingWidgets,
    this.automaticallyImplyLeading = true,
  })  : assert(
          (leadingIcon == null) == (onLeadingIconPressed == null),
          'If leadingIcon is not null, onLeadingIconPressed must not be null, and vice versa.',
        ),
        assert(
          (trailingIcon == null) == (onTrailingIconPressed == null),
          'If trailingIcon is not null, onTrailingIconPressed must not be null, and vice versa.',
        );

  final Widget? title;
  final IconData? leadingIcon;
  final IconData? trailingIcon;
  final VoidCallback? onLeadingIconPressed;
  final VoidCallback? onTrailingIconPressed;

  /// Optional customization
  final Color? backgroundColor;
  final IconThemeData? iconTheme;
  final List<Widget>? trailingWidgets;
  final bool automaticallyImplyLeading;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title,
      centerTitle: false,
      leading: leadingIcon != null
          ? IconButton(
              onPressed: onLeadingIconPressed,
              icon: Icon(leadingIcon),
            )
          : null,
      actions: [
        ...trailingWidgets ?? [],
        if (trailingIcon != null)
          IconButton(
            onPressed: onTrailingIconPressed,
            icon: Icon(trailingIcon),
          ),
        const SizedBox(width: FlexSizes.xxs),
      ],
      iconTheme: iconTheme,
      backgroundColor: backgroundColor,
      automaticallyImplyLeading: automaticallyImplyLeading,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(FlexSizes.appBarHeight);
}

@widgetbook.UseCase(
  name: '1. Default',
  type: FlexAppBar,
  path: '[Components]',
)
Widget defaultFlexAppBar(BuildContext context) {
  return FlexAppBar(
    title: Text(
      context.knobs.string(
        label: 'Title',
        initialValue: 'Product List',
      ),
      style: Theme.of(context).textTheme.titleMedium,
      textAlign: TextAlign.center,
    ),
    leadingIcon: Icons.arrow_back,
    onLeadingIconPressed: () {},
  );
}

@widgetbook.UseCase(
  name: '2. With trailing widget',
  type: FlexAppBar,
  path: '[Components]',
)
Widget trailingWidgetFlexAppBar(BuildContext context) {
  return FlexAppBar(
    title: Text(
      context.knobs.string(
        label: 'Title',
        initialValue: 'Product List',
      ),
      style: Theme.of(context).textTheme.titleMedium,
      textAlign: TextAlign.center,
    ),
    trailingIcon: Icons.close,
    onTrailingIconPressed: () {},
  );
}

@widgetbook.UseCase(
  name: '3. With both',
  type: FlexAppBar,
  path: '[Components]',
)
Widget leadingAndTrailingWidgetFlexAppBar(BuildContext context) {
  return FlexAppBar(
    title: Text(
      context.knobs.string(
        label: 'Title',
        initialValue: 'Product List',
      ),
      style: Theme.of(context).textTheme.titleMedium,
      textAlign: TextAlign.center,
    ),
    leadingIcon: Icons.arrow_back,
    onLeadingIconPressed: () {},
    trailingIcon: Icons.close,
    onTrailingIconPressed: () {},
  );
}

@widgetbook.UseCase(
  name: '4. With trailingWidgets list',
  type: FlexAppBar,
  path: '[Components]',
)
Widget trailingWidgetsListFlexAppBar(BuildContext context) {
  return FlexAppBar(
    title: const Text('Product List'),
    trailingWidgets: const [
      Icon(Icons.filter_list),
      SizedBox(width: 8),
      Icon(Icons.favorite_border),
    ],
  );
}

@widgetbook.UseCase(
  name: '5. Custom backgroundColor',
  type: FlexAppBar,
  path: '[Components]',
)
Widget backgroundColorFlexAppBar(BuildContext context) {
  return FlexAppBar(
    title: const Text('Dark Theme'),
    backgroundColor: Colors.black87,
    iconTheme: const IconThemeData(color: Colors.white),
    leadingIcon: Icons.menu,
    onLeadingIconPressed: () {},
  );
}
