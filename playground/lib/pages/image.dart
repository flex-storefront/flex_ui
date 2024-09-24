import 'package:auto_route/auto_route.dart';
import 'package:flex_ui/flex_ui.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ImagePage extends StatelessWidget {
  const ImagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
      child: FlexImage(
        'https://unsplash.it/640/320',
        width: 640,
        height: 320,
      ),
    ));
  }
}
