import 'package:auto_route/annotations.dart';
import 'package:flex_ui/flex_ui.dart';
import 'package:flutter/material.dart';

@RoutePage()
class CarouselPage extends StatelessWidget {
  const CarouselPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: FlexCarousel(
          items: [
            FlexImage('https://loremflickr.com/640/380?lock=1'),
            FlexImage('https://loremflickr.com/640/380?lock=2'),
            FlexImage('https://loremflickr.com/640/380?lock=3'),
            FlexImage('https://loremflickr.com/640/380?lock=4'),
          ],
          enlargeCenterPage: true,
          aspectRatio: 1.8,
          dotsEnabled: true,
        ),
      ),
    );
  }
}
