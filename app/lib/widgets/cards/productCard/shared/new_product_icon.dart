import 'package:flex_ui/tokens/colors.dart';
import 'package:flutter/material.dart';

class NewItemIcon extends StatelessWidget {
  const NewItemIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            color: FlexColors.secondary,
            child: Text(
              'New',
              style: Theme.of(context)
                  .textTheme
                  .labelSmall!
                  .copyWith(color: Colors.white),
            )));
  }
}
