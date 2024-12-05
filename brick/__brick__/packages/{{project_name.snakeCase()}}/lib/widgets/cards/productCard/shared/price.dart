import 'package:{{project_name.snakeCase()}}/utils/extensions.dart';
import 'package:{{project_name.snakeCase()}}/utils/typedefs.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:intl/intl.dart';

/// A flexible price display widget that handles various e-commerce pricing scenarios.
///
/// This widget can display prices in different formats and styles, supporting:
/// - Custom price formatting
/// - Multiple display variants (standard, savings)
/// - Theme customization
/// - Accessibility features
///
/// Example usage:
/// ```dart
/// FlexPrice(
///   price: 99.99,
///   priceVariant: PriceVariant.standard,
///   priceFormatter: (price) => NumberFormat.currency(locale: 'en_US').format(price),
///   priceLabel: "Sale Price {price}" // {price} token position indicates where the post formatter price should be placed in label
/// )
///

enum PriceVariant {
  standard,

  /// Default Styling:
  /// TextTheme.headerSmall
  /// priceLabel: 'Price $formattedPrice'

  strikethrough,

  /// Default Styling:
  /// Color: Theme Disabled Color,
  /// Text Decoration: Linethrough
  /// Text Semantic Label: 'Strikethrough Price $formattedPrice'
}

class FlexPrice extends StatelessWidget {
  const FlexPrice({
    super.key,
    required this.price,
    this.priceFormatter,
    this.priceVariant = PriceVariant.standard,
    this.textStyle,
    this.priceLabel,
  });

  final double price;
  final PriceFormatter? priceFormatter;
  final PriceVariant priceVariant;
  final TextStyle? textStyle;
  final String? priceLabel;

  @override
  Widget build(BuildContext context) {
    final defaultTheme = Theme.of(context);

    final formattedPrice =
        priceFormatter != null ? priceFormatter!(price) : price.toString();

    final Map<PriceVariant, TextStyle> variantTextStyle = {
      PriceVariant.standard: const TextStyle(),
      PriceVariant.strikethrough: TextStyle(
        color: defaultTheme.disabledColor,
        decoration: TextDecoration.lineThrough,
      ),
    };

    final Map<PriceVariant, String> defaultLabel = {
      PriceVariant.standard: formattedPrice,
      PriceVariant.strikethrough: 'Strikethrough Price $formattedPrice',
    };

    /// Allows for user determined formattedPrice positioning in label text, '{price}' string token is replaced with formatted price when present
    final String resolvedPriceLabel = priceLabel?.contains('{price}') == true
        ? priceLabel!.replaceAll('{price}', formattedPrice)
        : (priceLabel ?? defaultLabel[priceVariant]!);

    return Text(
      formattedPrice,
      style: defaultTheme.textTheme.headlineSmall
          ?.merge(variantTextStyle[priceVariant])
          .merge(textStyle),
      semanticsLabel: resolvedPriceLabel,
    );
  }
}

@widgetbook.UseCase(
  name: 'Default',
  type: FlexPrice,
  path: '[Components]',
)
Widget flexPrice(BuildContext context) {
  exampleFormatter(double price, String locale, {int? decimalDigits}) {
    final formatter = NumberFormat.simpleCurrency(
      locale: locale,
      decimalDigits: decimalDigits,
    );
    return formatter.format(price);
  }

  return Center(
    child: FlexPrice(
      price: context.knobs.double.input(label: 'Price', initialValue: 150.99),
      priceFormatter: (price) => exampleFormatter(
        price,
        context.knobs.list(
          label: 'Locale Examples',
          description:
              'Example Formats: \n   en-US: Standard USD Format \n   fr-CA:\$ right of value \n   ja-JP: No decimals, rounded to nearst whole',
          options: ['en-US', 'fr-CA', 'ja-JP'],
        ),
        decimalDigits: context.knobs.boolean(
          label: 'Example 3 Decimal Place override',
          initialValue: false,
        )
            ? 3
            : null,
      ),
    ),
  );
}

@widgetbook.UseCase(
  name: 'Strikethrough',
  type: FlexPrice,
  path: '[Components]',
)
Widget flexPriceSale(BuildContext context) {
  exampleFormatter(double price, String locale, {int? decimalDigits}) {
    final formatter = NumberFormat.simpleCurrency(
      locale: locale,
      decimalDigits: decimalDigits,
    );
    return formatter.format(price);
  }

  return Center(
    child: FlexPrice(
      price: context.knobs.double.input(label: 'Price', initialValue: 150.99),
      priceFormatter: (price) => exampleFormatter(
        price,
        context.knobs.list(
          label: 'Locale Examples',
          options: ['en-US', 'fr-CA', 'ja-JP'],
        ),
      ),
      priceVariant: PriceVariant.strikethrough,
      priceLabel: '{price} Before Discount',
    ),
  );
}

@widgetbook.UseCase(
  name: 'Style Override (No formatter)',
  type: FlexPrice,
  path: '[Components]',
)
Widget priceStyleOverride(BuildContext context) {
  return Center(
    child: FlexPrice(
      price: context.knobs.double.input(label: 'Price', initialValue: 150.99),
      priceVariant: PriceVariant.strikethrough,
      textStyle:
          context.theme.textTheme.headlineLarge?.copyWith(color: Colors.green),
      priceLabel: 'Example {price} Label Positioning',
    ),
  );
}
