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
    this.leadingIcon,
    this.onLeadingIconPressed,
    this.title,
    this.trailingIcon,
    this.onTrailingIconPressed,
    this.centerTitle = true,
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
  final VoidCallback? onLeadingIconPressed;
  final IconData? trailingIcon;
  final VoidCallback? onTrailingIconPressed;
  final bool centerTitle;

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    final iconButtonStyle = Theme.of(context).iconButtonTheme.style?.copyWith(
          backgroundColor: const WidgetStatePropertyAll(Colors.transparent),
          iconColor: WidgetStatePropertyAll(
            brightness == Brightness.dark ? Colors.white : Colors.black,
          ),
          padding: const WidgetStatePropertyAll(EdgeInsets.zero),
        );

    return AppBar(
      automaticallyImplyLeading: false,
      centerTitle: centerTitle,
      leading: leadingIcon != null
          ? IconButton(
              style: iconButtonStyle,
              onPressed: onLeadingIconPressed,
              icon: Icon(leadingIcon),
            )
          : null,
      title: title,
      actions: [
        if (trailingIcon != null)
          IconButton(
            style: iconButtonStyle,
            onPressed: onTrailingIconPressed,
            icon: Icon(trailingIcon),
          ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(FlexSizes.appBarHeight);
}

@widgetbook.UseCase(
  name: 'Default',
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
  name: 'With trailing widget',
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
  name: 'With both',
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
