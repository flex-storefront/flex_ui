import 'package:flex_ui/widgets/cards/productCard/shared/price.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:flex_ui/flex_ui.dart';
import 'package:intl/intl.dart';

/// This widget leverages the ``FlexPrice`` Widget for Price Formatting and display, but provides additional convenience for the conditional rendering of Sale Prices
///
/// FlexPriceDiscount implemented with same interface as FlexPrice with additional functionality
/// - Conditional rendering of Current Price as a 'sale' price when an oldPrice is provided
/// - When no 'oldPrice' is present, fallback to standard ``FlexPrice``
/// - Theme customization for Price, Discount Price & Old Price values
/// - Price & Old Price Semantic Label Optional Parameters
/// - single line or line Wrap parameter for Price Value overflows
///
/// Parameters
/// - [price]: Current Product Price, when [oldPrice] provided, will be styled as a 'sale price'
/// - [oldPrice]: Previous Product Price. Default Text Styling linethrough
/// - [priceFormatter]: Price Formatter Callback provided to underlying FlexPrice Widget
/// - [priceStyle]: Override Price TextStyle for Current Price, Either when oldPrice is provided or not.
/// - [oldPriceStyle]: Override [oldPrice] TextStyle (Default Strikethrough) FlexPrice widget
/// - [priceLabel]: Text semantic label for [price]
/// - [oldPriceLabel]: Text semantic label for [oldPrice]
/// - [enableLineWrap]: Default false: single line display -TextOverflow.ellipsis, True: Enables Line wrap on overlfow
///
///
/// Example usage:
/// ```dart
/// FlexPriceDiscount(
///   price: 99.99,
///   oldPrice: 200.00,
///   priceStyle: TextStyle(color: Colors.blue), // Example optional style override
///   priceFormatter: (price) => NumberFormat.currency(locale: 'en_US').format(price),
///   priceLabel: "Sale Price {price}" // {price} token position indicates where the post formatter price should be placed in label
/// )
/// ```
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
      // If single line, spacer between prices elements, otherwise Wrap spacer provided
      if (!enableLineWrap) const SizedBox(width: 4),
      FlexPrice(
        price: price,
        priceFormatter: priceFormatter,
        textStyle: TextStyle(
          color: context.colors.success,
          overflow: TextOverflow.ellipsis,
        ).merge(priceStyle),
        priceLabel: priceLabel,
      ),
    ];

// Row or Wrap Price Widgets to dependent on enableLineWrap toggle
    final Widget discountPriceLayout = enableLineWrap
        ? Wrap(spacing: 4, children: priceWidgets)
        : IntrinsicWidth(
            child: Row(
              // Row Price Widgets to be wrapped in flexible as overflow Guardrail for Product Card
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
  final price = context.knobs.double.input(label: 'Price', initialValue: 200);
  final oldPrice =
      context.knobs.double.input(label: 'oldPrice', initialValue: 300);
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
      price: price,
      oldPrice: oldPrice,
      priceFormatter: exampleFormatter,
      oldPriceLabel: 'originally {price}',
      priceStyle: context.knobs.boolean(
        label: 'Example Price Style Override',
        description:
            'Overrides Styling of Current Price, Both When oldPrice is provided, and when not',
        initialValue: false,
      )
          ? theme.textTheme.headlineMedium!.merge(
              TextStyle(
                color: oldPrice > 0 ? Colors.blue : Colors.red,
              ),
            )
          : null,
      oldPriceStyle: context.knobs.boolean(
        label: 'Example Old Price Style Override',
        description: 'Overrides Styling of Old Price',
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

@widgetbook.UseCase(
  name: 'Default - No Old Price Provided',
  type: FlexPriceDiscount,
  path: '[Components]',
)
Widget fallbackPriceDiscount(BuildContext context) {
  final theme = Theme.of(context);

  final price = context.knobs.double.input(label: 'Price', initialValue: 200);
  final oldPrice =
      context.knobs.double.input(label: 'oldPrice', initialValue: 0);

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
      price: price,
      oldPrice: oldPrice,
      priceFormatter: exampleFormatter,
      oldPriceLabel: 'originally {price}',
      priceStyle: context.knobs.boolean(
        label: 'Example Price Style Override',
        description:
            'Overrides Styling of Current Price, Both When oldPrice is provided and when not',
        initialValue: false,
      )
          ? theme.textTheme.headlineMedium!.merge(
              TextStyle(
                color: oldPrice > 0 ? Colors.blue : Colors.red,
              ),
            )
          : null,
      enableLineWrap: context.knobs.boolean(
        label: 'Enable Line Wrap',
        description:
            'Enables price values line wrap on container overflow. False: TextOverflow Ellipsis ',
        initialValue: false,
      ),
    ),
  );
}
