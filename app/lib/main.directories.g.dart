// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_import, prefer_relative_imports, directives_ordering

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AppGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flex_ui/widgets/add_to_cart_button.dart' as _i2;
import 'package:flex_ui/widgets/banner/banner.dart' as _i3;
import 'package:flex_ui/widgets/carousel/carousel.dart' as _i4;
import 'package:widgetbook/widgetbook.dart' as _i1;

final directories = <_i1.WidgetbookNode>[
  _i1.WidgetbookCategory(
    name: 'Components',
    children: [
      _i1.WidgetbookComponent(
        name: 'AddToCartButton',
        useCases: [
          _i1.WidgetbookUseCase(
            name: 'Default',
            builder: _i2.defaultButton,
          ),
          _i1.WidgetbookUseCase(
            name: 'Disabled',
            builder: _i2.disabledButton,
          ),
          _i1.WidgetbookUseCase(
            name: 'Loading',
            builder: _i2.loadingButton,
          ),
          _i1.WidgetbookUseCase(
            name: 'Small',
            builder: _i2.smallButton,
          ),
        ],
      ),
      _i1.WidgetbookLeafComponent(
        name: 'FlexBanner',
        useCase: _i1.WidgetbookUseCase(
          name: 'Standard',
          builder: _i3.standardBanner,
        ),
      ),
      _i1.WidgetbookLeafComponent(
        name: 'FlexCarousel',
        useCase: _i1.WidgetbookUseCase(
          name: 'Central banner',
          builder: _i4.centralBannerCarousel,
        ),
      ),
    ],
  )
];
