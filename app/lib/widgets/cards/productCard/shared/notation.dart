import 'package:flex_ui/flex_ui.dart';
import 'package:flutter/material.dart';

class FlexNotation extends StatelessWidget {
  const FlexNotation({super.key, required this.rating});

  final int rating;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: 'This product is rated $rating stars on 5 stars',
      child: Row(
        children: List.generate(
            5,
            (index) => (index < rating)
                ? Icon(Icons.star_rounded, color: FlexColors.warning)
                : Icon(
                    Icons.star_border_rounded,
                    color: FlexColors.disabled,
                  )),
      ),
    );
  }
}
