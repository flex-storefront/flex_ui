import 'package:flex_ui/widgets/cards/productCard/orientations/portraitCard.dart';
import 'package:flex_ui/widgets/cards/productCard/shared/add_wishlist_button.dart';
import 'package:flex_ui/widgets/cards/productCard/shared/new_product_icon.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

class FlexProductCard extends StatelessWidget {
  const FlexProductCard(
      {super.key,
      required this.productName,
      this.productReference,
      this.imageUrl,
      required this.price,
      this.oldPrice,
      required this.currency,
      this.notation,
      this.isNew = false,
      this.isSaved = false,
      this.isAvailable = true,
      this.isLandscape = false});

  final String productName;
  final String? productReference;
  final String? imageUrl;
  final double price;
  final double? oldPrice;
  final String currency;
  final int? notation;
  final bool isNew;
  final bool isSaved;
  final bool isAvailable;
  final bool isLandscape;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Card(
        child:
            // isLandscape
            //     ? FlexLandscapeCard(
            //         productName: productName,
            //         productReference: productReference,
            //         imageUrl: imageUrl,
            //         price: price,
            //         oldPrice: oldPrice,
            //         currency: currency,
            //         notation: notation,
            //         isAvailable: isAvailable)
            //     :
            FlexPortraitCard(
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
      if (isNew)
        Positioned(
          top: 0,
          left: 0,
          child: Semantics(label: 'This article is new', child: NewItemIcon()),
        ),
      Positioned(
        bottom: 0,
        right: 0,
        child: Semantics(
            label: 'Tap on this button to add the product to your wishlist',
            child: AddWishlistButton(
              isSaved: isSaved,
              onPressed: () {},
            )),
      ),
    ]);
  }
}

@widgetbook.UseCase(
  name: 'Standard',
  type: FlexProductCard,
  path: '[Components]',
)
Widget standard(BuildContext context) {
  bool isLandscape =
      context.knobs.boolean(label: 'Landscape', initialValue: false);
  return Center(
    child: Container(
      padding: EdgeInsets.all(20),
      height: isLandscape ? 200 : 400,
      width: isLandscape ? 400 : 200,
      child: FlexProductCard(
        productName: 'Temple Fork TFO NXT Series Fly Rod',
        productReference: 'TFO NXT 905 5/6',
        price: 159,
        oldPrice:
            context.knobs.double.input(label: 'oldPrice', initialValue: 0),
        imageUrl: 'https://picsum.photos/200',
        notation: 4,
        isLandscape: isLandscape,
        currency: "\$",
        isNew: context.knobs.boolean(label: 'New', initialValue: false),
        isSaved: context.knobs.boolean(label: 'Saved', initialValue: false),
        isAvailable:
            context.knobs.boolean(label: 'Available', initialValue: true),
      ),
    ),
  );
}
