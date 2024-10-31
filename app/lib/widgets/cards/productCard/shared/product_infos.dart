import 'package:flex_ui/flex_ui.dart';
import 'package:flex_ui/utils/extensions.dart';
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
    required this.currency,
    this.notation,
  });

  final String productName;
  final String? productReference;
  final double price;
  final double? oldPrice;
  final String currency;
  final int? notation;
  final bool isLandscape;

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
          if (oldPrice != null && oldPrice! > 0)
            RichText(
              maxLines: 1,
              text: TextSpan(
                text: '$currency$oldPrice',
                style: infoContext.textTheme.headlineSmall?.copyWith(
                  decoration: TextDecoration.lineThrough,
                ),
                children: [
                  TextSpan(
                    text: ' $currency$price',
                    style: infoContext.textTheme.headlineSmall
                        ?.copyWith(color: context.colors.success),
                  ),
                ],
              ),
            )
          else
            Text(
              '$currency$price',
              style: infoContext.textTheme.headlineSmall,
              overflow: TextOverflow.fade,
            ),
        ],
      ),
    );
  }
}
