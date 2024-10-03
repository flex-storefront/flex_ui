import 'package:auto_route/auto_route.dart';
import 'package:flex_ui/flex_ui.dart';
import 'package:flutter/material.dart';

@RoutePage()
class BannerMinimalPage extends StatelessWidget {
  const BannerMinimalPage({super.key});

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

@RoutePage()
class BannerFullPage extends StatelessWidget {
  const BannerFullPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: FlexBanner(
        overline: Text(
          'FEATURED',
          style: Theme.of(context).textTheme.labelSmall,
          textAlign: TextAlign.center,
        ),
        title: Text(
          'Halloween specials!',
          style: Theme.of(context).textTheme.titleMedium,
          textAlign: TextAlign.center,
        ),
        description: Text(
          'Get you hands on the latest Halloween\ndeals before it\'s too late!',
          style: Theme.of(context).textTheme.bodySmall,
          textAlign: TextAlign.center,
        ),
        image: const FlexImage(
          'https://unsplash.it/320/280',
          width: 320,
          height: 280,
        ),
      ),
    ));
  }
}
