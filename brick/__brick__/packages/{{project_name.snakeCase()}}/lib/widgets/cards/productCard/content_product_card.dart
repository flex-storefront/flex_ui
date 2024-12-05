import 'package:{{project_name.snakeCase()}}/tokens/sizes.dart';
import 'package:{{project_name.snakeCase()}}/utils/typedefs.dart';
import 'package:{{project_name.snakeCase()}}/widgets/cards/productCard/shared/product_info.dart';
import 'package:{{project_name.snakeCase()}}/widgets/image/image.dart';
import 'package:flutter/material.dart';

class FlexContentProductCard extends StatelessWidget {
  const FlexContentProductCard({
    super.key,
    required this.productName,
    this.productReference,
    required this.imageUrl,
    required this.price,
    this.priceLabel,
    this.priceStyle,
    this.salePrice,
    this.salePriceLabel,
    this.salePriceStyle,
    this.priceFormatter,
    this.notation,
    required this.isAvailable,
    required this.isLandscape,
  });

  final String productName;
  final String? productReference;
  final String imageUrl;
  final double price;
  final double? salePrice;
  final int? notation;
  final bool isAvailable;
  final bool isLandscape;
  final PriceFormatter? priceFormatter;
  final String? priceLabel;
  final String? salePriceLabel;
  final TextStyle? priceStyle;
  final TextStyle? salePriceStyle;

  @override
  Widget build(BuildContext context) {
    final Widget productInfos = Flexible(
      child: ProductInfo(
        productName: productName,
        productReference: productReference,
        price: price,
        priceLabel: priceLabel,
        priceStyle: priceStyle,
        salePrice: salePrice,
        salePriceLabel: salePriceLabel,
        salePriceStyle: salePriceStyle,
        priceFormatter: priceFormatter,
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
