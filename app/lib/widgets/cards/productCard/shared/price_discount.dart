import 'package:flex_ui/flex_ui.dart';
import 'package:flex_ui/utils/typedefs.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

/// This widget leverages the ``FlexPrice`` Widget for Price Formatting and display, but provides additional convenience for the conditional rendering of Sale Prices
///
/// FlexPriceDiscount implemented with same interface as FlexPrice with additional functionality
/// - When [salePrice] is provided, provides default styling indicating product price is discounted
/// - When no 'salePrice' is present, Widget fallbacks to standard ``FlexPrice`` Widget based on [price] value
/// - Theme customization for [price], and [salePrice] values
/// - [price], and [salePrice] Semantic Label Optional Parameters
///
///
/// Parameters
/// - [price]: Required Standard Product Price
/// - [salePrice]: optional Sale Price if product is being offered at lower rate than [price]
/// - [priceFormatter]: Price Formatter Callback provided to underlying FlexPrice Widget
/// - [priceStyle]: Override Price TextStyle for Price. When [salePrice] provided, defaults to Text Styling linethrough
/// - [salePriceStyle]: Override [salePrice] TextStyle (Default colors.success) FlexPrice widget
/// - [priceLabel]: Text semantic label for [price]. string token:'{price}' can be added to label text to be replaced with formatted price value in position
/// - [salePriceLabel]: Text semantic label for [salePrice]. string token:'{price}' can be added to label text to be replaced with formatted price value in position
///
///
/// Example usage:
/// ```dart
/// FlexPriceDiscount(
///   price: 299.99,
///   salePrice: 200.00,
///   priceStyle: TextStyle(color: Colors.blue), // Example optional style override
///   priceFormatter: (price) => NumberFormat.currency(locale: 'en_US').format(price),
///   salePriceLabel: "Item on sale for {price}" // {price} token position indicates where the post formatter price should be placed in label
/// )
/// ```
///

class FlexPriceDiscount extends StatelessWidget {
  const FlexPriceDiscount({
    super.key,
    required this.price,
    this.salePrice,
    this.priceFormatter,
    this.priceLabel,
    this.priceStyle,
    this.salePriceLabel,
    this.salePriceStyle,
  });
  final double price;
  final double? salePrice;
  final PriceFormatter? priceFormatter;
  final String? priceLabel;
  final String? salePriceLabel;
  final TextStyle? priceStyle;
  final TextStyle? salePriceStyle;

  bool get _showDiscount => (salePrice ?? 0) > 0;

  List<Widget> _buildDiscountPrice(BuildContext context) {
    return [
      FlexPrice(
        price: price,
        priceFormatter: priceFormatter,
        priceVariant: PriceVariant.strikethrough,
        textStyle: priceStyle?.copyWith(overflow: TextOverflow.ellipsis),
        priceLabel: priceLabel,
      ),
      FlexPrice(
        price: salePrice!,
        priceFormatter: priceFormatter,
        textStyle: salePriceStyle?.copyWith(
          color: context.colors.success,
          overflow: TextOverflow.ellipsis,
        ),
        priceLabel: salePriceLabel,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    if (!_showDiscount) {
      return FlexPrice(
        price: price,
        priceFormatter: priceFormatter,
        textStyle: priceStyle?.copyWith(overflow: TextOverflow.ellipsis),
        priceLabel: priceLabel,
      );
    }
    return Wrap(
      spacing: FlexSizes.xs,
      children: _buildDiscountPrice(context),
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
  final salePrice =
      context.knobs.double.input(label: 'salePrice', initialValue: 150);
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
      salePrice: salePrice,
      priceFormatter: exampleFormatter,
      salePriceLabel: 'originally {price}',
      priceStyle: context.knobs.boolean(
        label: 'Example Price Style Override',
        description: 'Overrides Standard Price Textstyle',
        initialValue: false,
      )
          ? theme.textTheme.headlineMedium!.merge(
              TextStyle(
                color: salePrice > 0 ? Colors.blue : Colors.red,
              ),
            )
          : null,
      salePriceStyle: context.knobs.boolean(
        label: 'Example Sale Price Style Override',
        description: 'Overrides Styling of Sale Price',
        initialValue: false,
      )
          ? theme.textTheme.headlineMedium!
              .merge(const TextStyle(color: Colors.blue))
          : null,
    ),
  );
}

@widgetbook.UseCase(
  name: 'Default - No Sale Price',
  type: FlexPriceDiscount,
  path: '[Components]',
)
Widget fallbackPriceDiscount(BuildContext context) {
  final theme = Theme.of(context);

  final price = context.knobs.double.input(label: 'Price', initialValue: 200);
  final salePrice =
      context.knobs.double.input(label: 'salePrice', initialValue: 0);

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
      salePrice: salePrice,
      priceFormatter: exampleFormatter,
      salePriceLabel: 'originally {price}',
      priceStyle: context.knobs.boolean(
        label: 'Example Price Style Override',
        description:
            'Overrides Styling of Current Price, Both When salePrice is provided and when not',
        initialValue: false,
      )
          ? theme.textTheme.headlineMedium!.merge(
              TextStyle(
                color: salePrice > 0 ? Colors.blue : Colors.red,
              ),
            )
          : null,
    ),
  );
}
