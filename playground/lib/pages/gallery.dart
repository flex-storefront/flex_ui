import 'package:auto_route/annotations.dart';
import 'package:flex_ui/flex_ui.dart';
import 'package:flutter/material.dart';

@RoutePage()
class GalleryPage extends StatelessWidget {
  const GalleryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: FlexGallery(
          imageUrls: [
            'https://loremflickr.com/640/640?lock=1',
            'https://loremflickr.com/640/640?lock=2',
            'https://loremflickr.com/640/640?lock=3',
            'https://loremflickr.com/640/640?lock=4',
          ],
        ),
      ),
    );
  }
}
