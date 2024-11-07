import 'package:flex_ui/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:intl/intl.dart';

enum Variant {
  standard,
  savings, // Defaults to text decoration linethrough and color 'disabled'
}

class Price extends StatelessWidget {
  const Price({
    super.key,
    required this.price,
    this.oldPrice,
    this.formatterCallback,
    this.variant = Variant.standard,
    this.textStyle,
  });
  final double price;
  final double? oldPrice;
  final Function? formatterCallback;
  final Variant? variant;
  final TextStyle? textStyle;
  @override
  Widget build(BuildContext context) {
    final defaultTheme = context.theme;
// @TODO before merge - potentially add theme fallback?

    final formattedPrice = formatterCallback != null
        ? formatterCallback!(price)
        : price.toString();

    final Map<Variant, TextStyle> variantTextStyle = {
      Variant.standard: const TextStyle(),
      Variant.savings: TextStyle(
        color: defaultTheme.disabledColor,
        decoration: TextDecoration.lineThrough,
      ),
    };

    return Text(
      formattedPrice,
      style: defaultTheme.textTheme.headlineSmall
          ?.merge(variantTextStyle[variant])
          .merge(textStyle),
    );
  }
}

@widgetbook.UseCase(
  name: 'Default',
  type: Price,
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
    child: Price(
      price: context.knobs.double.input(label: 'Price', initialValue: 150.99),
      oldPrice: 200.52,
      formatterCallback: (price) => exampleFormatter(
        price,
        context.knobs.list(
          label: 'Locale Examples',
          description:
              'Example Formats: \n   en-US: Standard USD Format \n   fr-CA:\$ right of value \n   ja-JP: No decimals, rounded to nearst whole',
          options: ['en-US', 'fr-CA', 'ja-JP'],
        ),
        decimalDigits: context.knobs.boolean(
                label: 'Example 3 Decimal Place override', initialValue: false)
            ? 3
            : null,
      ),
    ),
  );
}

@widgetbook.UseCase(
  name: 'Sale',
  type: Price,
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
    child: Price(
      price: context.knobs.double.input(label: 'Price', initialValue: 150.99),
      formatterCallback: (price) => exampleFormatter(
        price,
        context.knobs.list(
          label: 'Locale Examples',
          options: ['en-US', 'fr-CA', 'ja-JP'],
        ),
      ),
      variant: Variant.savings,
    ),
  );
}

@widgetbook.UseCase(
  name: 'Style Override (No formatter)',
  type: Price,
  path: '[Components]',
)
Widget priceStyleOverride(BuildContext context) {
  return Center(
    child: Price(
      price: context.knobs.double.input(label: 'Price', initialValue: 150.99),
      variant: Variant.savings,
      textStyle:
          context.theme.textTheme.headlineLarge?.copyWith(color: Colors.green),
    ),
  );
}
