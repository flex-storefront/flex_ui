import 'package:flutter/material.dart';

class RightBottomIconButton extends StatelessWidget {
  const RightBottomIconButton({
    super.key,
    required this.icon,
    this.iconButtonStyle,
    required this.onPressed,
  });

  final Icon icon;
  final ButtonStyle? iconButtonStyle;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: icon,
      style: iconButtonStyle,
    );
  }
}
