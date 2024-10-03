import 'package:auto_route/auto_route.dart';
import 'package:flex_ui/flex_ui.dart';
import 'package:flutter/material.dart';

@RoutePage()
class BannerPage extends StatelessWidget {
  const BannerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
      child: FlexBanner(
        title: Text('Halloween specials!'),
        image: FlexImage(
          'https://unsplash.it/320/280',
          width: 320,
          height: 280,
        ),
      ),
    ));
  }
}
