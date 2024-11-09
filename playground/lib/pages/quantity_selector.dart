import 'package:auto_route/auto_route.dart';
import 'package:flex_ui/flex_ui.dart';
import 'package:flutter/material.dart';

@RoutePage()
class QuantitySelectorPage extends StatefulWidget {
  const QuantitySelectorPage({super.key});

  @override
  State<QuantitySelectorPage> createState() => _QuantitySelectorPageState();
}

class _QuantitySelectorPageState extends State<QuantitySelectorPage> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FlexQuantitySelector(
          quantity: quantity,
          minQuantity: 1,
          maxQuantity: 10,
          onChange: (value) => setState(() => quantity = value),
        ),
      ),
    );
  }
}
