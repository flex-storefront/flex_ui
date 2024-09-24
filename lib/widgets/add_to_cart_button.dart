import 'package:flex_ui/tokens/colors.dart';
import 'package:flex_ui/tokens/sizes.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

enum ButtonState {
  normal,
  loading,
  disabled,
}

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({
    super.key,
    this.title = 'Add to Cart',
    this.state = ButtonState.normal,
    this.style,
    this.child,
    this.onPressed,
  });

  final String title;
  final ButtonState state;
  final ButtonStyle? style;
  final Widget? child;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: style,
      onPressed: state == ButtonState.normal ? onPressed : null,
      child: child ??
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (state == ButtonState.loading) ...[
                const SizedBox(
                  height: FlexSizes.iconXs,
                  width: FlexSizes.iconXs,
                  child:
                      Center(child: CircularProgressIndicator(strokeWidth: 2)),
                ),
                const SizedBox(width: FlexSizes.sm),
              ],
              Text(title),
            ],
          ),
    );
  }
}

@widgetbook.UseCase(
  name: 'Default',
  type: AddToCartButton,
)
Widget defaultButton(BuildContext context) {
  return Center(
    child: AddToCartButton(
      onPressed: () {},
    ),
  );
}

@widgetbook.UseCase(
  name: 'Loading',
  type: AddToCartButton,
)
Widget loadingButton(BuildContext context) {
  return Center(
    child: AddToCartButton(
      state: ButtonState.loading,
      onPressed: () {},
    ),
  );
}

@widgetbook.UseCase(
  name: 'Disabled',
  type: AddToCartButton,
)
Widget disabledButton(BuildContext context) {
  return Center(
    child: AddToCartButton(
      state: ButtonState.disabled,
      onPressed: () {},
    ),
  );
}

@widgetbook.UseCase(
  name: 'Small',
  type: AddToCartButton,
)
Widget smallButton(BuildContext context) {
  return Center(
    child: AddToCartButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(FlexSizes.md),
      ),
      onPressed: () {},
    ),
  );
}
