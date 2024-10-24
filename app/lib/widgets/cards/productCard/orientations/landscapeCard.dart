/**
 * 
 * Don't know if it's better to split Card into 2 different widgets (landscape and portrait) or 
 * handle it on one widget. Depends of if we'll use these cards in another screens ?
 * So its why I keep this commented code. 
 */



// import 'package:flex_ui/widgets/cards/productCard/shared/product_infos.dart';
// import 'package:flex_ui/widgets/image/image.dart';
// import 'package:flutter/material.dart';

// class FlexLandscapeCard extends StatelessWidget {
//   const FlexLandscapeCard(
//       {super.key,
//       required this.productName,
//       this.productReference,
//       this.imageUrl,
//       required this.price,
//       this.oldPrice,
//       required this.currency,
//       this.notation,
//       required this.isAvailable});

//   final String productName;
//   final String? productReference;
//   final String? imageUrl;
//   final double price;
//   final double? oldPrice;
//   final String currency; 
//   final int? notation;
//   final bool isAvailable;

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.start,
//       children: [
//         if (imageUrl != null)
//           FlexImage(
//             imageUrl!,
//             borderRadius: BorderRadius.horizontal(left: Radius.circular(10)),
//           ),
//         Flexible(
//           child: ProductInfos(
//             productName: productName,
//             productReference: productReference,
//             price: price,
//             oldPrice: oldPrice,
//             currency: currency,
//             notation: notation,
//             isLandscape: true,
//           ),
//         ),
//       ],
//     );
//   }
// }
