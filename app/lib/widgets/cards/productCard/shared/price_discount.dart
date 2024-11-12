import 'package:flex_ui/widgets/cards/productCard/shared/price.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:flex_ui/flex_ui.dart';
import 'package:intl/intl.dart';

/// This widget leverages the ``FlexPrice`` Widget for Price Formatting and display, but provides additional convenience for the conditional rendering of Sale Prices
///
/// Widget
/// - custom price formatting
/// - Theme customization for Price, Discount Price & Old Price values
/// - Price & Old Price Semantic Label Optional Parameters
/// - single line or line Wrap parameter for Price Value overflows
/// - When no 'oldPrice' is present, fallback to standard ``FlexPrice``
///
/// Example usage:
/// ```dart
/// FlexPriceDiscount(
///   price: 99.99,
///   oldPrice: 200.00,
///   discountPriceStyle: TextStyle(color: Colors.green), // Example optional style override
///   priceFormatter: (price) => NumberFormat.currency(locale: 'en_US').format(price),
///   priceLabel: "Sale Price {price}" // {price} token position indicates where the post formatter price should be placed in label
/// )
///

class FlexPriceDiscount extends StatelessWidget {
  const FlexPriceDiscount({
    super.key,
    required this.price,
    this.oldPrice,
    this.priceFormatter,
    this.enableLineWrap = false,
    this.priceLabel,
    this.priceStyle,
    this.discountPriceStyle,
    this.oldPriceLabel,
    this.oldPriceStyle,
  });
  final double price;
  final double? oldPrice;
  final String Function(double)? priceFormatter;
  final bool enableLineWrap;
  final String? priceLabel;
  final String? oldPriceLabel;
  final TextStyle? priceStyle;
  final TextStyle? oldPriceStyle;
  final TextStyle? discountPriceStyle;

  @override
  Widget build(BuildContext context) {
    final bool displayDiscount =
        oldPrice != null && oldPrice! > 0 ? true : false;

    final List<Widget> priceWidgets = [
      if (displayDiscount)
        FlexPrice(
          price: oldPrice!,
          priceFormatter: priceFormatter,
          priceVariant: PriceVariant.strikethrough,
          textStyle: const TextStyle(
            overflow: TextOverflow.ellipsis,
          ).merge(oldPriceStyle),
          priceLabel: oldPriceLabel,
        ),

      // If isLandscape wrap spacing will handle gap between prices, otherwise sized box between row items
      if (!enableLineWrap) const SizedBox(width: 4),

      FlexPrice(
        price: price,
        priceFormatter: priceFormatter,
        textStyle: TextStyle(
          color: context.colors.success,
          overflow: TextOverflow.ellipsis,
        ).merge(discountPriceStyle),
        priceLabel: priceLabel,
      ),
    ];

    final discountPriceLayout = enableLineWrap
        ? Wrap(spacing: 4, children: priceWidgets)
        : IntrinsicWidth(
            child: Row(
              children: priceWidgets.map((widget) {
                if (widget is SizedBox) {
                  return widget;
                }
                return Flexible(child: widget);
              }).toList(),
            ),
          );

    return displayDiscount
        ? discountPriceLayout
        : FlexPrice(
            price: price,
            priceFormatter: priceFormatter,
            textStyle: const TextStyle(
              overflow: TextOverflow.ellipsis,
            ).merge(priceStyle),
            priceLabel: priceLabel,
          );
  }
}

@widgetbook.UseCase(
  name: 'Default',
  type: FlexPriceDiscount,
  path: '[Components]',
)
Widget defaultPriceDiscount(BuildContext context) {
  final theme = Theme.of(context);
  exampleFormatter(
    double price,
  ) {
    final formatter = NumberFormat.simpleCurrency(
      locale: context.knobs.list(
        label: 'Locale Examples',
        options: ['en-US', 'fr-CA', 'ja-JP'],
      ),
      decimalDigits: 2,
    );
    return formatter.format(price);
  }

  return Center(
    child: FlexPriceDiscount(
      price: context.knobs.double.input(label: 'Price', initialValue: 200),
      oldPrice:
          context.knobs.double.input(label: 'oldPrice', initialValue: 300),
      priceFormatter: exampleFormatter,
      oldPriceLabel: 'originally {price}',
      discountPriceStyle: context.knobs.boolean(
        label: 'Example Discount Price Style Override',
        initialValue: false,
      )
          ? theme.textTheme.headlineMedium!
              .merge(const TextStyle(color: Colors.blue))
          : null,
      enableLineWrap: context.knobs.boolean(
        label: 'Enable Line Wrap when price values overflow',
        initialValue: false,
      ),
    ),
  );
}
