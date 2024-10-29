import 'package:flex_ui/tokens/sizes.dart';
import 'package:flex_ui/widgets/cards/productCard/shared/product_infos.dart';
import 'package:flex_ui/widgets/image/image.dart';
import 'package:flutter/material.dart';

class FlexContentProductCard extends StatelessWidget {
  const FlexContentProductCard({
    super.key,
    required this.productName,
    this.productReference,
    this.imageUrl,
    required this.price,
    this.oldPrice,
    required this.currency,
    this.notation,
    required this.isAvailable,
    required this.isLandscape,
  });

  final String productName;
  final String? productReference;
  final String? imageUrl;
  final double price;
  final double? oldPrice;
  final String currency;
  final int? notation;
  final bool isAvailable;
  final bool isLandscape;

  @override
  Widget build(BuildContext context) {
    Widget productInfos = Flexible(
      child: ProductInfos(
        productName: productName,
        productReference: productReference,
        price: price,
        oldPrice: oldPrice,
        currency: currency,
        notation: notation,
        isLandscape: isLandscape,
      ),
    );

    Widget image = Expanded(
      child: FlexImage(
        imageUrl!,
        width: double.infinity,
        height: double.infinity,
        borderRadius: isLandscape
            ? BorderRadius.horizontal(
                left: Radius.circular(FlexSizes.cardRadiusMd))
            : BorderRadius.vertical(
                top: Radius.circular(FlexSizes.cardRadiusMd)),
        fit: BoxFit.cover,
        // placeholder: Placeholder(),
      ),
    );

    return isLandscape
        ? Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              if (imageUrl != null) image,
              productInfos,
            ],
          )
        : Column(
            children: [
              if (imageUrl != null) image,
              productInfos,
            ],
          );
  }
}
