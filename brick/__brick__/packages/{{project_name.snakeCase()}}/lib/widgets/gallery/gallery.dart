import 'package:{{project_name.snakeCase()}}/{{project_name.snakeCase()}}.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

class FlexGallery extends StatefulWidget {
  const FlexGallery({
    super.key,
    this.imageUrls = const [],
    this.thumbnailUrls,
    this.borderRadius = 0,
    this.thumbRowPaddingX = 0,
  }) : assert(
          thumbnailUrls != null
              ? imageUrls.length == thumbnailUrls.length
              : true,
          'Image and thumbnail urls must have the same length',
        );

  final List<String> imageUrls;
  final List<String>? thumbnailUrls;
  final double borderRadius;
  final double thumbRowPaddingX;

  @override
  State<FlexGallery> createState() => _FlexGalleryState();
}

class _FlexGalleryState extends State<FlexGallery> {
  int _selectedImage = 0;

  List<String> get _thumbnailUrls => widget.thumbnailUrls ?? widget.imageUrls;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Main Image
        Container(
          padding: const EdgeInsets.only(bottom: FlexSizes.sm),
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
        SizedBox(
          height: FlexSizes.imageThumbSize,
          child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: widget.thumbRowPaddingX),
            scrollDirection: Axis.horizontal,
            itemCount: _thumbnailUrls.length,
            itemBuilder: (_, int index) {
              return Padding(
                padding: index != 0
                    ? const EdgeInsets.only(left: FlexSizes.sm)
                    : EdgeInsets.zero,
                child: FlexTappableImage(
                  imageUrl: _thumbnailUrls[index],
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
      thumbRowPaddingX: context.knobs.double
          .input(label: 'Horizontal Thumbnail Padding', initialValue: 0),
      imageUrls: List.generate(
        context.knobs.int.slider(label: 'Item count', initialValue: 3),
        (index) => 'https://loremflickr.com/640/640?lock=$index',
      ),
      thumbnailUrls: List.generate(
        context.knobs.int.slider(label: 'Item count', initialValue: 3),
        (index) => 'https://loremflickr.com/150/150?lock=$index',
      ),
      borderRadius:
          context.knobs.double.input(label: 'Border Radius', initialValue: 0),
    ),
  );
}
