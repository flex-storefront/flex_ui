import 'package:flex_ui/flex_ui.dart';
import 'package:flutter/material.dart';

class FlexProductNotation extends StatelessWidget {
  const FlexProductNotation({super.key, required this.rating, this.numberOfStars = 5});

  final int rating;
  final int numberOfStars;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: 'This product is rated $rating stars on 5 stars',
      child: Row(
        children: List.generate(
          numberOfStars,
          (index) => (index < rating)
              ? Flexible(
                child: Icon(
                    Icons.star_rounded,
                    color: FlexColors.warning,
                  ),
              )
              : Flexible(
                child: Icon(
                    Icons.star_border_rounded,
                    color: FlexColors.disabled,
                  ),
              ),
        ),
      ),
    );
  }
}
