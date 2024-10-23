import 'package:flex_ui/tokens/colors.dart';
import 'package:flutter/material.dart';

class AddWishlistButton extends StatelessWidget {
  const AddWishlistButton(
      {super.key, required this.isSaved, required this.onPressed});

  final bool isSaved;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    //TODO: Handle better the buttonStyle in theme
    final iconButtonStyle = Theme.of(context).iconButtonTheme.style?.copyWith(
        elevation: WidgetStatePropertyAll(1),
        shadowColor: WidgetStatePropertyAll(Colors.black),
        backgroundColor: WidgetStatePropertyAll(Colors.white),
        iconColor: WidgetStatePropertyAll(
            isSaved ? FlexColors.secondary : FlexColors.disabled),
        padding: WidgetStatePropertyAll(EdgeInsets.zero),
        fixedSize: WidgetStatePropertyAll(Size.zero),
        shape: WidgetStatePropertyAll(StadiumBorder()));

    return IconButton(
        onPressed: onPressed,
        icon: isSaved ? Icon(Icons.bookmark) : Icon(Icons.bookmark_outline),
        style: iconButtonStyle);
  }
}
