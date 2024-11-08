import 'package:flex_ui/tokens/sizes.dart';
import 'package:flex_ui/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

enum ButtonState { normal, loading, disabled, selected }

class FlexButton extends StatelessWidget {
  const FlexButton({
    super.key,
    this.title = 'Add to Cart',
    this.style,
    this.child,
    this.state = ButtonState.normal,
    this.isSelected = false,
    this.onPressed,
  });

  final String title;
  final ButtonState state;
  final ButtonStyle? style;
  final Widget? child;
  final VoidCallback? onPressed;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: _getButtonStyle(context),
      onPressed: _getOnPressed(),
      child: child ??
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (state == ButtonState.loading) ...[
                SizedBox(
                  height: FlexSizes.iconXs,
                  width: FlexSizes.iconXs,
                  child: Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: context.colors.onSecondary,
                    ),
                  ),
                ),
                const SizedBox(width: FlexSizes.xs),
              ],
              Text(title, style: _getTextStyle(context)),
            ],
          ),
    );
  }

  ButtonStyle? _getButtonStyle(BuildContext context) => switch (state) {
        ButtonState.selected => ButtonStyle(
            backgroundColor: isSelected
                ? WidgetStatePropertyAll(context.colors.primary)
                : WidgetStatePropertyAll(context.colors.onPrimary),
            side: WidgetStatePropertyAll(
              BorderSide(
                color: context.colors.disabled,
              ),
            ),
          ),
        _ => null
      };

  TextStyle? _getTextStyle(BuildContext context) => switch (state) {
        ButtonState.selected => TextStyle(
            color:
                isSelected ? context.colors.onPrimary : context.colors.primary,
          ),
        _ => null
      };

  VoidCallback? _getOnPressed() => switch (state) {
        ButtonState.normal => onPressed,
        ButtonState.selected => onPressed,
        _ => null
      };
}

@widgetbook.UseCase(
  name: 'Default',
  type: FlexButton,
  path: '[Components]',
)
Widget defaultButton(BuildContext context) {
  return Center(
    child: FlexButton(
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
      onPressed: () {},
      state: ButtonState.disabled,
    ),
  );
}

@widgetbook.UseCase(
  name: 'Small',
  type: FlexButton,
  path: '[Components]',
)
Widget smallButton(BuildContext context) {
  return Center(
    child: FlexButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(FlexSizes.md),
      ),
      onPressed: () {},
    ),
  );
}

@widgetbook.UseCase(
  name: 'Selected',
  type: FlexButton,
  path: '[Components]',
)
Widget selectedButton(BuildContext context) {
  final bool isSelected =
      context.knobs.boolean(label: 'isSelected', initialValue: true);
  return Center(
    child: FlexButton(
      isSelected: isSelected,
      state: ButtonState.selected,
    ),
  );
}
