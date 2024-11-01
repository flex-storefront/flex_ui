import 'package:carousel_slider/carousel_slider.dart';
import 'package:flex_ui/flex_ui.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

class FlexCarousel extends StatefulWidget {
  const FlexCarousel({
    super.key,
    required this.items,
    this.height,
    this.aspectRatio = 16 / 9,
    this.enlargeCenterPage = false,
    this.pageSnapping = true,
    this.enableInfiniteScroll = true,
    this.autoPlay = false,
    this.dotsEnabled = false,
    this.viewportFraction = 0.8,
    this.padEnds = true,
  });

  final List<Widget> items;

  final double? height;

  final double aspectRatio;

  final bool enlargeCenterPage;

  final bool pageSnapping;

  final bool enableInfiniteScroll;

  final bool autoPlay;

  final bool dotsEnabled;

  final double viewportFraction;

  final bool padEnds;

  @override
  State<FlexCarousel> createState() => _FlexCarouselState();
}

class _FlexCarouselState extends State<FlexCarousel> {
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget result = CarouselSlider(
      items: widget.items,
      options: CarouselOptions(
        onPageChanged: (page, reason) {
          setState(() {
            activeIndex = page;
          });
        },
        aspectRatio: widget.aspectRatio,
        height: widget.height,
        enlargeCenterPage: widget.enlargeCenterPage,
        pageSnapping: widget.pageSnapping,
        enableInfiniteScroll: widget.enableInfiniteScroll,
        autoPlay: widget.autoPlay,
        viewportFraction: widget.viewportFraction,
        padEnds: widget.padEnds,
      ),
    );

    if (widget.dotsEnabled) {
      result = Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          result,
          AnimatedSmoothIndicator(
            activeIndex: activeIndex,
            count: widget.items.length,
            effect: WormEffect(
              radius: 8.0,
              activeDotColor: context.colors.primary,
            ),
          ),
        ],
      );
    }

    return result;
  }
}

@widgetbook.UseCase(
  name: 'Central banner',
  type: FlexCarousel,
  path: '[Components]',
)
Widget centralBannerCarousel(BuildContext context) {
  return Center(
    child: FlexCarousel(
      items: const <Widget>[
        FlexImage('https://loremflickr.com/640/480?lock=1'),
        FlexImage('https://loremflickr.com/640/480?lock=2'),
        FlexImage('https://loremflickr.com/640/480?lock=3'),
        FlexImage('https://loremflickr.com/640/480?lock=4'),
      ],
      enlargeCenterPage: true,
      aspectRatio: 1.5,
      pageSnapping: context.knobs.boolean(
        label: 'Page Snapping',
        initialValue: true,
      ),
      enableInfiniteScroll: context.knobs.boolean(
        label: 'Infinite Scroll',
        initialValue: true,
      ),
      dotsEnabled: context.knobs.boolean(
        label: 'Dots enabled',
        initialValue: true,
      ),
    ),
  );
}
