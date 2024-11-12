import 'package:flex_ui/flex_ui.dart';
import 'package:flex_ui/widgets/cards/productCard/shared/price_discount.dart';
import 'package:flex_ui/widgets/cards/productCard/shared/product_notation.dart';
import 'package:flutter/material.dart';

class ProductInfo extends StatelessWidget {
  const ProductInfo({
    super.key,
    this.isLandscape = false,
    required this.productName,
    this.productReference,
    required this.price,
    this.oldPrice,
    this.priceLabel,
    this.priceStyle,
    this.oldPriceLabel,
    this.oldPriceStyle,
    this.discountPriceStyle,
    this.priceFormatter,
    this.notation,
  });

  final String productName;
  final String? productReference;
  final double price;
  final double? oldPrice;
  final int? notation;
  final bool isLandscape;
  final String Function(double)? priceFormatter;
  final String? priceLabel;
  final String? oldPriceLabel;
  final TextStyle? priceStyle;
  final TextStyle? oldPriceStyle;
  final TextStyle? discountPriceStyle;

  @override
  Widget build(BuildContext context) {
    final infoContext = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(FlexSizes.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment:
            isLandscape ? MainAxisAlignment.center : MainAxisAlignment.start,
        children: [
          if (!isLandscape)
            Padding(
              padding: const EdgeInsets.only(bottom: FlexSizes.sm),
              child: FlexProductRating(
                rating: notation ?? 0,
              ),
            ),
          Flexible(
            child: Text(
              productName,
              style: infoContext.textTheme.headlineSmall,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          if (productReference.isNotBlank())
            Flexible(
              child: Padding(
                padding:
                    EdgeInsets.only(bottom: isLandscape ? 0 : FlexSizes.xs),
                child: Text(
                  productReference!,
                  style: infoContext.textTheme.titleSmall,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          if (isLandscape)
            Padding(
              padding: const EdgeInsets.only(
                top: FlexSizes.xxs,
                bottom: FlexSizes.sm,
              ),
              child: FlexProductRating(
                rating: notation ?? 0,
              ),
            ),
          FlexPriceDiscount(
            price: price,
            oldPrice: oldPrice,
            priceFormatter: priceFormatter,
            priceStyle: priceStyle,
            priceLabel: priceLabel,
            oldPriceLabel: oldPriceLabel,
            oldPriceStyle: oldPriceStyle,
            discountPriceStyle: discountPriceStyle,
            enableLineWrap: isLandscape,
          ),
        ],
      ),
    );
  }
}
