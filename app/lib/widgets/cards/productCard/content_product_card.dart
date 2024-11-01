import 'package:flex_ui/tokens/sizes.dart';
import 'package:flex_ui/widgets/cards/productCard/shared/product_info.dart';
import 'package:flex_ui/widgets/image/image.dart';
import 'package:flutter/material.dart';

class FlexContentProductCard extends StatelessWidget {
  const FlexContentProductCard({
    super.key,
    required this.productName,
    this.productReference,
    required this.imageUrl,
    required this.price,
    this.oldPrice,
    required this.currency,
    this.notation,
    required this.isAvailable,
    required this.isLandscape,
  });

  final String productName;
  final String? productReference;
  final String imageUrl;
  final double price;
  final double? oldPrice;
  final String currency;
  final int? notation;
  final bool isAvailable;
  final bool isLandscape;

  @override
  Widget build(BuildContext context) {
    final Widget productInfos = Flexible(
      child: ProductInfo(
        productName: productName,
        productReference: productReference,
        price: price,
        oldPrice: oldPrice,
        currency: currency,
        notation: notation,
        isLandscape: isLandscape,
      ),
    );

    final Widget image = Expanded(
      child: FlexImage(
        imageUrl,
        width: double.infinity,
        height: double.infinity,
        borderRadius: isLandscape
            ? const BorderRadius.horizontal(
                left: Radius.circular(FlexSizes.cardRadiusMd),
              )
            : const BorderRadius.vertical(
                top: Radius.circular(FlexSizes.cardRadiusMd),
              ),
        fit: BoxFit.cover,
      ),
    );

    return isLandscape
        ? Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              image,
              productInfos,
            ],
          )
        : Column(
            children: [
              image,
              productInfos,
            ],
          );
  }
}
