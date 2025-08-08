import '../../../flex_ui.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:intl/intl.dart';

class FlexProductCard extends StatelessWidget {
  FlexProductCard({
    super.key,
    required this.productName,
    this.productReference,
    required this.imageUrl,
    required this.price,
    this.priceFormatter,
    this.priceLabel,
    this.priceStyle,
    this.salePrice,
    this.salePriceLabel,
    this.salePriceStyle,
    this.notation,
    this.displayLeftIcon = false,
    this.leftIconLabel,
    this.leftIconSemanticsLabel,
    this.leftIconBackgroundColor,
    this.leftIconTextColor,
    this.displayRightIcon = false,
    this.rightIcon,
    this.rightIconButtonStyle,
    this.rightIconSemanticsLabel,
    this.onPressedRightIcon,
    this.isSaved = false,
    this.isAvailable = true,
    this.isLandscape = false,
  })  : assert(
          displayLeftIcon == false || leftIconLabel?.isNotEmpty == true,
          'You must provide a leftIconLabel when displayLeftIcon is true',
        ),
        assert(
          displayRightIcon == false ||
              (rightIcon != null && onPressedRightIcon != null),
          'You must provide a rightIcon and onPressedRightIcon when displayRightIcon is true',
        );

  final String productName;
  final String? productReference;
  final String imageUrl;
  final double price;
  final PriceFormatter? priceFormatter;
  final double? salePrice;
  final String? priceLabel;
  final String? salePriceLabel;
  final TextStyle? priceStyle;
  final TextStyle? salePriceStyle;
  final int? notation;
  final bool displayLeftIcon;
  final String? leftIconLabel;
  final String? leftIconSemanticsLabel;
  final Color? leftIconBackgroundColor;
  final Color? leftIconTextColor;
  final bool displayRightIcon;
  final Widget? rightIcon;
  final ButtonStyle? rightIconButtonStyle;
  final String? rightIconSemanticsLabel;
  final VoidCallback? onPressedRightIcon;
  final bool isSaved;
  final bool isAvailable;
  final bool isLandscape;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minWidth: MediaQuery.of(context).size.width * 0.25,
        minHeight: MediaQuery.of(context).size.width * 0.25,
      ),
      child: Stack(
        children: [
          Card(
            margin: const EdgeInsets.all(FlexSizes.sm),
            child: FlexContentProductCard(
              productName: productName,
              productReference: productReference,
              imageUrl: imageUrl,
              price: price,
              priceLabel: priceLabel,
              priceStyle: priceStyle,
              salePrice: salePrice,
              salePriceLabel: salePriceLabel,
              salePriceStyle: salePriceStyle,
              priceFormatter: priceFormatter,
              notation: notation,
              isAvailable: isAvailable,
              isLandscape: isLandscape,
            ),
          ),
          if (displayLeftIcon && leftIconLabel?.isNotEmpty == true)
            Positioned(
              top: 0,
              left: 0,
              child: Semantics(
                label: leftIconSemanticsLabel,
                child: FlexBadge(
                  label: leftIconLabel!,
                  textColor: leftIconTextColor,
                  iconBackgroundColor: leftIconBackgroundColor,
                ),
              ),
            ),
          if (displayRightIcon && rightIcon != null)
            Positioned(
              bottom: 0,
              right: 0,
              child: Semantics(
                label: rightIconSemanticsLabel,
                child: RightBottomIconButton(
                  icon: rightIcon!,
                  iconButtonStyle: rightIconButtonStyle,
                  onPressed: onPressedRightIcon,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

@widgetbook.UseCase(
  name: 'Standard',
  type: FlexProductCard,
  path: '[Components]',
)
Widget standardFlexProductCard(BuildContext context) {
  final bool isSaved =
      context.knobs.boolean(label: 'isProductSaved', initialValue: false);

  return Center(
    child: Container(
      width: 400,
      padding: const EdgeInsets.all(FlexSizes.lg),
      child: FlexProductCard(
        productName: 'Temple Fork TFO NXT Series Fly Rod',
        productReference: 'TFO NXT 905 5/6',
        price: context.knobs.double.input(label: 'price', initialValue: 150),
        salePrice:
            context.knobs.double.input(label: 'salePrice', initialValue: 0),
        priceFormatter: (price) => '\$$price',
        imageUrl: 'https://picsum.photos/200',
        notation: 4,
        isLandscape:
            context.knobs.boolean(label: 'isLandscape', initialValue: false),
        displayLeftIcon: context.knobs
            .boolean(label: 'displayLeftIcon', initialValue: false),
        leftIconLabel: 'New',
        leftIconSemanticsLabel: 'This is a new product',
        leftIconBackgroundColor: context.brandColors.info,
        leftIconTextColor: Colors.white,
        displayRightIcon: context.knobs
            .boolean(label: 'displayRightIcon', initialValue: false),
        isSaved: isSaved,
        rightIcon: isSaved
            ? const Icon(Icons.bookmark)
            : const Icon(Icons.bookmark_outline),
        rightIconSemanticsLabel: isSaved
            ? 'Tap on this button to remove the product from your wishlist'
            : 'Tap on this button to add the product to your wishlist',
        onPressedRightIcon: () {},
        isAvailable: context.knobs
            .boolean(label: 'isProductAvailable', initialValue: true),
      ),
    ),
  );
}

@widgetbook.UseCase(
  name: 'Grid',
  type: FlexProductCard,
  path: '[Components]',
)
Widget gridFlexProductCard(BuildContext context) {
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

  final bool isSaved =
      context.knobs.boolean(label: 'isProductSaved', initialValue: false);
  final bool isLandscape =
      context.knobs.boolean(label: 'isLandscape', initialValue: false);

  return GridView.builder(
    physics: const AlwaysScrollableScrollPhysics(),
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      mainAxisExtent: isLandscape ? 200 : 350,
      crossAxisCount: context.knobs.int.slider(
        label: 'columns',
        initialValue: 2,
        min: 1,
        max: 2,
      ),
    ),
    itemCount: 6,
    itemBuilder: (_, i) => FlexProductCard(
      productName: 'Temple Fork TFO NXT Series Fly Rod',
      productReference: 'TFO NXT 905 5/6',
      price: context.knobs.double.input(label: 'Price', initialValue: 100),
      salePrice:
          context.knobs.double.input(label: 'salePrice', initialValue: 50),
      priceFormatter: exampleFormatter,
      imageUrl: 'https://picsum.photos/200',
      notation: 4,
      isLandscape: isLandscape,
      displayLeftIcon:
          context.knobs.boolean(label: 'displayLeftIcon', initialValue: false),
      leftIconLabel: 'New',
      leftIconSemanticsLabel: 'This is a new product',
      leftIconBackgroundColor: context.brandColors.info,
      leftIconTextColor: Colors.white,
      displayRightIcon:
          context.knobs.boolean(label: 'displayRightIcon', initialValue: false),
      isSaved: isSaved,
      rightIcon: isSaved
          ? const Icon(Icons.bookmark)
          : const Icon(Icons.bookmark_outline),
      rightIconSemanticsLabel: isSaved
          ? 'Tap on this button to remove the product from your wishlist'
          : 'Tap on this button to add the product to your wishlist',
      onPressedRightIcon: () {},
      isAvailable: context.knobs
          .boolean(label: 'isProductAvailable', initialValue: true),
    ),
  );
}
