import 'package:flex_ui/tokens/sizes.dart';
import 'package:flex_ui/utils/extensions.dart';
import 'package:flex_ui/widgets/cards/productCard/content_product_card.dart';
import 'package:flex_ui/widgets/cards/productCard/shared/right_bottom_icon_button.dart';
import 'package:flex_ui/widgets/cards/productCard/shared/left_top_icon.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

class FlexProductCard extends StatelessWidget {
  FlexProductCard({
    super.key,
    required this.productName,
    this.productReference,
    required this.imageUrl,
    required this.price,
    this.oldPrice,
    required this.currency,
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
          displayLeftIcon == false || leftIconLabel.isNotBlank(),
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
  final double? oldPrice;
  final String currency;
  final int? notation;
  final bool displayLeftIcon;
  final String? leftIconLabel;
  final String? leftIconSemanticsLabel;
  final Color? leftIconBackgroundColor;
  final Color? leftIconTextColor;
  final bool displayRightIcon;
  final Icon? rightIcon;
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
              oldPrice: oldPrice,
              currency: currency,
              notation: notation,
              isAvailable: isAvailable,
              isLandscape: isLandscape,
            ),
          ),
          if (displayLeftIcon && leftIconLabel.isNotBlank())
            Positioned(
              top: 0,
              left: 0,
              child: Semantics(
                label: leftIconSemanticsLabel,
                child: LeftTopIcon(
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
        price: 159,
        oldPrice:
            context.knobs.double.input(label: 'oldPrice', initialValue: 0),
        imageUrl: 'https://picsum.photos/200',
        notation: 4,
        isLandscape:
            context.knobs.boolean(label: 'isLandscape', initialValue: false),
        currency: "\$",
        displayLeftIcon: context.knobs
            .boolean(label: 'displayLeftIcon', initialValue: false),
        leftIconLabel: 'New',
        leftIconSemanticsLabel: 'This is a new product',
        leftIconBackgroundColor: context.colors.info,
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
  final bool isSaved =
      context.knobs.boolean(label: 'isProductSaved', initialValue: false);

  return GridView.builder(
    physics: const AlwaysScrollableScrollPhysics(),
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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
      price: 159,
      oldPrice: context.knobs.double.input(label: 'oldPrice', initialValue: 0),
      imageUrl: 'https://picsum.photos/200',
      notation: 4,
      isLandscape:
          context.knobs.boolean(label: 'isLandscape', initialValue: false),
      currency: "\$",
      displayLeftIcon:
          context.knobs.boolean(label: 'displayLeftIcon', initialValue: false),
      leftIconLabel: 'New',
      leftIconSemanticsLabel: 'This is a new product',
      leftIconBackgroundColor: context.colors.info,
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
