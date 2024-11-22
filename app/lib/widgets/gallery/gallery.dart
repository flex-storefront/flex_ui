import 'package:flex_ui/flex_ui.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

class FlexGallery extends StatefulWidget {
  const FlexGallery({
    super.key,
    this.imageUrls = const [],
    this.thumbnailUrls = const [],
    this.borderRadius = 0,
  });

  final List<String> imageUrls;
  final List<String> thumbnailUrls;
  final double borderRadius;
  // todo: expose many more properties for customization

  @override
  State<FlexGallery> createState() => _FlexGalleryState();
}

class _FlexGalleryState extends State<FlexGallery> {
  int _selectedImage = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Main Image
        Container(
          padding: const EdgeInsets.all(FlexSizes.sm),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(widget.borderRadius),
          ),
          child: AspectRatio(
            aspectRatio: 1,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(widget.borderRadius),
              child: FlexImage(
                widget.imageUrls.isNotEmpty
                    ? widget.imageUrls[_selectedImage]
                    : '',
                fit: BoxFit.cover,
                // placeholderAspectRatio: 1,
              ),
            ),
          ),
        ),

        // Image Gallery Slider
        if (widget.thumbnailUrls.length > 1)
          SizedBox(
            height: FlexSizes.imageThumbSize,
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: FlexSizes.sm),
              scrollDirection: Axis.horizontal,
              itemCount: widget.thumbnailUrls.length,
              itemBuilder: (_, int index) {
                return Padding(
                  padding: index != 0
                      ? const EdgeInsets.only(left: FlexSizes.sm)
                      : EdgeInsets.zero,
                  child: FlexTappableImage(
                    imageUrl: widget.thumbnailUrls[index],
                    border: Border.all(
                      color: index == _selectedImage
                          ? Theme.of(context).primaryColor
                          : Colors.grey[200]!,
                    ),
                    borderRadius: widget.borderRadius,
                    backgroundColor: Colors.white,
                    padding: const EdgeInsets.all(FlexSizes.xs),
                    aspectRatio: 1,
                    selected: index == _selectedImage,
                    onTap: () => setState(() {
                      _selectedImage = index;
                    }),
                  ),
                );
              },
            ),
          ),
      ],
    );
  }
}

@widgetbook.UseCase(
  name: 'Default',
  type: FlexGallery,
)
Widget defaultCarousel(BuildContext context) {
  return Center(
    child: FlexGallery(
      imageUrls: List.generate(
        context.knobs.int.slider(label: 'Item count', initialValue: 3),
        (index) => 'https://picsum.photos/500/500?random=$index',
      ),
      thumbnailUrls: List.generate(
        context.knobs.int.slider(label: 'Item count', initialValue: 3),
        (index) => 'https://picsum.photos/150/150?random=$index',
      ),
      borderRadius:
          context.knobs.double.input(label: 'Border Radius', initialValue: 0),
    ),
  );
}
