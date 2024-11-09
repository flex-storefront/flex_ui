import 'package:auto_route/auto_route.dart';
import 'package:flex_ui/flex_ui.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ButtonPage extends StatelessWidget {
  const ButtonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: FlexButton(
        title: 'Add to cart',
        onPressed: () {},
      ),
    ));
  }
}
