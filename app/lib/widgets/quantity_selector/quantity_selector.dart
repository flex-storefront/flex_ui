import 'package:flex_ui/tokens/sizes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

class FlexQuantitySelector extends StatelessWidget {
  const FlexQuantitySelector({
    super.key,
    required this.quantity,
    this.increment = 1,
    this.minQuantity = 1,
    this.maxQuantity,
    this.disabled = false,
    this.onDecrement,
    this.onIncrement,
    this.onChange,
  });

  final int quantity;
  final int increment;
  final int minQuantity;
  final int? maxQuantity;
  final bool disabled;
  final ValueChanged<int>? onDecrement;
  final ValueChanged<int>? onIncrement;
  final ValueChanged<int>? onChange;

  @override
  Widget build(BuildContext context) {
    // No `int.infinity`, see https://stackoverflow.com/questions/32338554/is-there-an-int-infinity-for-dart
    final maxQuantity = this.maxQuantity ?? double.maxFinite.toInt();

    final canDecrement = quantity - increment >= minQuantity;
    final canIncrement = quantity + increment <= maxQuantity;

    final theme = Theme.of(context);
    // Fallback theme styling if IconButtonTheme.style is not set by library user
    final themeStyle =
        Theme.of(context).iconButtonTheme.style ?? const ButtonStyle();

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        IconButton(
          padding: EdgeInsets.zero,
          style: themeStyle.copyWith(
            padding: const WidgetStatePropertyAll(EdgeInsets.zero),
            shape: const WidgetStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(FlexSizes.borderRadiusSm),
                  bottomLeft: Radius.circular(FlexSizes.borderRadiusSm),
                ),
              ),
            ),
          ),
          icon: const Icon(
            Icons.remove,
          ),
          onPressed: canDecrement && !disabled
              ? () {
                  final newQuantity = quantity - increment;
                  if (onDecrement != null) {
                    onDecrement!(newQuantity);
                  }
                  if (onChange != null) {
                    onChange!(newQuantity);
                  }
                }
              : null,
        ),
        Container(
          width: 52.0,
          height: FlexSizes.buttonHeight,
          decoration: BoxDecoration(
            border: Border.symmetric(
              horizontal: BorderSide(
                color: themeStyle.backgroundColor
                        ?.resolve({if (disabled) WidgetState.disabled}) ??
                    (disabled
                        ? theme.colorScheme.surfaceContainer
                        : theme.colorScheme.surfaceContainerHigh),
              ),
            ),
          ),
          child: Center(
            child: Text(
              quantity.toString(),
            ),
          ),
        ),
        IconButton(
          icon: const Icon(
            Icons.add,
          ),
          style: themeStyle.copyWith(
            padding: const WidgetStatePropertyAll(EdgeInsets.zero),
            shape: const WidgetStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(FlexSizes.borderRadiusSm),
                  bottomRight: Radius.circular(FlexSizes.borderRadiusSm),
                ),
              ),
            ),
          ),
          onPressed: canIncrement && !disabled
              ? () {
                  final newQuantity = quantity + increment;
                  if (onIncrement != null) {
                    onIncrement!(newQuantity);
                  }
                  if (onChange != null) {
                    onChange!(newQuantity);
                  }
                }
              : null,
        ),
      ],
    );
  }
}

final quantityState = ValueNotifier(5);

@UseCase(
  name: 'Default',
  type: FlexQuantitySelector,
  path: '[Components]',
)
Widget defaultQuantitySelector(BuildContext context) {
  return Center(
    child: ValueListenableProvider<int>.value(
      value: quantityState,
      child: Consumer<int>(
        builder: (_, value, __) {
          return FlexQuantitySelector(
            quantity: quantityState.value,
            increment: context.knobs.int.slider(
              label: 'Increment',
              initialValue: 1,
              min: 1,
              max: 10,
            ),
            minQuantity: context.knobs.int.input(
              label: 'Min quantity',
              initialValue: 1,
            ),
            maxQuantity: context.knobs.intOrNull.input(
              label: 'Max quantity',
            ),
            disabled: context.knobs.boolean(label: 'Disabled'),
            onChange: (value) {
              quantityState.value = value;
            },
          );
        },
      ),
    ),
  );
}
