import 'package:auto_route/annotations.dart';
import 'package:flex_ui/flex_ui.dart';
import 'package:flutter/material.dart';

@RoutePage()
class BadgePage extends StatelessWidget {
  const BadgePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const FlexBadge(label: 'Info'),
            const FlexBadge(
              label: 'Sale',
              iconBackgroundColor: Colors.green,
            ),
            FlexBadge(
              label: 'Warning',
              iconBackgroundColor: Colors.deepOrange,
              borderRadius: BorderRadius.circular(5),
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            ),
          ],
        ),
      ),
    );
  }
}
