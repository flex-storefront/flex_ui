import 'package:{{project_name.snakeCase()}}/{{project_name.snakeCase()}}.dart';
import 'package:{{project_name.snakeCase()}}/utils/typedefs.dart';
import 'package:{{project_name.snakeCase()}}/widgets/cards/productCard/shared/product_notation.dart';
import 'package:flutter/material.dart';

class ProductInfo extends StatelessWidget {
  const ProductInfo({
    super.key,
    this.isLandscape = false,
    required this.productName,
    this.productReference,
    required this.price,
    this.salePrice,
    this.priceLabel,
    this.priceStyle,
    this.salePriceLabel,
    this.salePriceStyle,
    this.discountPriceStyle,
    this.priceFormatter,
    this.notation,
  });

  final String productName;
  final String? productReference;
  final double price;
  final double? salePrice;
  final int? notation;
  final bool isLandscape;
  final PriceFormatter? priceFormatter;
  final String? priceLabel;
  final String? salePriceLabel;
  final TextStyle? priceStyle;
  final TextStyle? salePriceStyle;
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
            salePrice: salePrice,
            priceFormatter: priceFormatter,
            priceStyle: priceStyle,
            priceLabel: priceLabel,
            salePriceLabel: salePriceLabel,
            salePriceStyle: salePriceStyle,
          ),
        ],
      ),
    );
  }
}
