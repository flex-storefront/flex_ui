// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_import, prefer_relative_imports, directives_ordering

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AppGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flex_ui/widgets/add_to_cart_button.dart' as _i2;
import 'package:flex_ui/widgets/app_bar/app_bar.dart' as _i3;
import 'package:flex_ui/widgets/banner/banner.dart' as _i4;
import 'package:flex_ui/widgets/cards/productCard/product_card.dart' as _i6;
import 'package:flex_ui/widgets/carousel/carousel.dart' as _i5;
import 'package:flex_ui/widgets/quantity_selector/quantity_selector.dart'
    as _i7;
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
      _i1.WidgetbookComponent(
        name: 'FlexAppBar',
        useCases: [
          _i1.WidgetbookUseCase(
            name: 'Default',
            builder: _i3.defaultFlexAppBar,
          ),
          _i1.WidgetbookUseCase(
            name: 'With both',
            builder: _i3.leadingAndTrailingWidgetFlexAppBar,
          ),
          _i1.WidgetbookUseCase(
            name: 'With trailing widget',
            builder: _i3.trailingWidgetFlexAppBar,
          ),
        ],
      ),
      _i1.WidgetbookLeafComponent(
        name: 'FlexBanner',
        useCase: _i1.WidgetbookUseCase(
          name: 'Standard',
          builder: _i4.standardBanner,
        ),
      ),
      _i1.WidgetbookLeafComponent(
        name: 'FlexCarousel',
        useCase: _i1.WidgetbookUseCase(
          name: 'Central banner',
          builder: _i5.centralBannerCarousel,
        ),
      ),
      _i1.WidgetbookComponent(
        name: 'FlexProductCard',
        useCases: [
          _i1.WidgetbookUseCase(
            name: 'Grid',
            builder: _i6.gridFlexProductCard,
          ),
          _i1.WidgetbookUseCase(
            name: 'Standard',
            builder: _i6.standardFlexProductCard,
          ),
        ],
      ),
      _i1.WidgetbookLeafComponent(
        name: 'FlexQuantitySelector',
        useCase: _i1.WidgetbookUseCase(
          name: 'Default',
          builder: _i7.defaultButton,
        ),
      ),
    ],
  )
];
