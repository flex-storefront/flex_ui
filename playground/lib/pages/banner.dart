import 'package:auto_route/auto_route.dart';
import 'package:flex_ui/flex_ui.dart';
import 'package:flutter/material.dart';

@RoutePage()
class BannerPage extends StatelessWidget {
  static const String variantMinimal = 'minimal';
  static const String variantFull = 'full';

  const BannerPage({super.key, @queryParam this.variant});

  final String? variant;

  Widget _getBodyWidget(BuildContext context) {
    switch (variant) {
      case BannerPage.variantMinimal:
        return const FlexBanner(
          title: Text('Halloween specials!'),
          image: FlexImage(
            'https://unsplash.it/320/280',
            width: 320,
            height: 280,
          ),
        );
      case BannerPage.variantFull:
        return FlexBanner(
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
        );
      default:
        return const SizedBox.shrink();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _getBodyWidget(context),
      ),
    );
  }
}
