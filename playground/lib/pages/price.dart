import 'package:auto_route/annotations.dart';
import 'package:flex_ui/flex_ui.dart';
import 'package:flutter/material.dart';

@RoutePage()
class PricePage extends StatelessWidget {
  const PricePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          FlexPrice(price: 42),
          FlexPriceDiscount(price: 42, salePrice: 22)
        ],
      ),
    );
  }
}
