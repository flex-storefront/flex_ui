import 'package:flex_ui/flex_ui.dart';
import 'package:flex_ui/utils/extension.dart';
import 'package:flex_ui/widgets/cards/productCard/shared/notation.dart';
import 'package:flutter/material.dart';

class ProductInfos extends StatelessWidget {
  const ProductInfos(
      {super.key,
      this.isLandscape = false,
      required this.productName,
      this.productReference,
      required this.price,
      this.oldPrice,
      required this.currency,
      this.notation});

  final String productName;
  final String? productReference;
  final double price;
  final double? oldPrice;
  final String currency;
  final int? notation;
  final bool isLandscape;

  @override
  Widget build(BuildContext infosContext) {
    final context = Theme.of(infosContext);

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!isLandscape)
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: FlexNotation(
                rating: notation ?? 0,
              ),
            ),
          Text(
            productName,
            style: context.textTheme.headlineSmall,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          if (productReference.isNotBlank())
            Flexible(
              child: Padding(
                padding:  EdgeInsets.only(bottom: isLandscape ? 0 : 8),
                child: Text(
                  productReference!,
                  style: context.textTheme.titleSmall,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          if (isLandscape)
            Padding(
              padding: const EdgeInsets.only(top: 4, bottom: 10),
              child: FlexNotation(
                rating: notation ?? 0,
              ),
            ),
          if (oldPrice != null && oldPrice! > 0)
            RichText(
                maxLines: 1,
                text: TextSpan(
                  text: '$currency$oldPrice',
                  style: context.textTheme.headlineSmall?.copyWith(
                    decoration: TextDecoration.lineThrough,
                  ),
                  children: [
                    TextSpan(
                        text: ' $currency$price',
                        style: context.textTheme.headlineSmall
                            ?.copyWith(color: FlexColors.success)),
                  ],
                ))
          else
            Text(
              '$currency$price',
              style: context.textTheme.headlineSmall,
            ),
        ],
      ),
    );
  }
}
