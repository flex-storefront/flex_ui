import '../../flex_ui.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

enum ButtonState { normal, loading, disabled }

/// A flexible button widget that extends [ElevatedButton] with support for loading and disabled states.
///
/// The [FlexButton] can be in one of three states defined by [ButtonState]:
/// * [ButtonState.normal] - The default state where the button displays the title and is interactive
/// * [ButtonState.loading] - Shows a circular progress indicator instead of the title
/// * [ButtonState.disabled] - Greys out the button and makes it non-interactive
///
/// The button will also be disabled if [onPressed] is null, regardless of the [state].
///
/// Example usage:
/// ```dart
/// FlexButton(
///   onPressed: () => print('Button pressed'),
///   title: 'Click Me',
///   state: ButtonState.normal,
///   style: ElevatedButton.styleFrom(
///     backgroundColor: Colors.blue,
///     padding: EdgeInsets.symmetric(horizontal: 24),
///   ),
/// )
/// ```
class FlexButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String title;
  final ButtonState state;
  final double? width;
  final double? height;
  final ButtonStyle? style;
  final TextStyle? textStyle;

  const FlexButton({
    super.key,
    required this.onPressed,
    required this.title,
    this.state = ButtonState.normal,
    this.width,
    this.height,
    this.style,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    final bool isDisabled = state == ButtonState.disabled || onPressed == null;

    final ButtonStyle baseStyle = style ?? ElevatedButton.styleFrom();

    final effectiveStyle = isDisabled
        ? baseStyle.copyWith(
            backgroundColor:
                WidgetStatePropertyAll(context.brandColors.disabled),
            foregroundColor:
                WidgetStatePropertyAll(context.brandColors.onDisabled),
          )
        : baseStyle;

    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        style: effectiveStyle,
        onPressed: isDisabled ? null : onPressed,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(title, style: textStyle),
            if (state == ButtonState.loading) ...[
              const SizedBox(width: FlexSizes.xs),
              SizedBox(
                height: FlexSizes.iconXs,
                width: FlexSizes.iconXs,
                child: Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: context.colorScheme.onPrimary,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

@widgetbook.UseCase(
  name: 'Default',
  type: FlexButton,
  path: '[Components]',
)
Widget defaultButton(BuildContext context) {
  return Center(
    child: FlexButton(
      title: 'Add to Cart',
      onPressed: () {},
    ),
  );
}

@widgetbook.UseCase(
  name: 'Loading',
  type: FlexButton,
  path: '[Components]',
)
Widget loadingButton(BuildContext context) {
  return Center(
    child: FlexButton(
      title: 'Add to Cart',
      onPressed: () {},
      state: ButtonState.loading,
    ),
  );
}

@widgetbook.UseCase(
  name: 'Disabled',
  type: FlexButton,
  path: '[Components]',
)
Widget disabledButton(BuildContext context) {
  return Center(
    child: FlexButton(
      title: 'Add to Cart',
      onPressed: () {},
      state: ButtonState.disabled,
    ),
  );
}

@widgetbook.UseCase(
  name: 'Small & Styled',
  type: FlexButton,
  path: '[Components]',
)
Widget smallButton(BuildContext context) {
  return Center(
    child: FlexButton(
      title: 'Add to Cart',
      style: ElevatedButton.styleFrom(
        backgroundColor: context.colorScheme.tertiary,
        foregroundColor: context.colorScheme.onTertiary,
        padding: const EdgeInsets.all(FlexSizes.md),
      ),
      onPressed: () {},
    ),
  );
}
