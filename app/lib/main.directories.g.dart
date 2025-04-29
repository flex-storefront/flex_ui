// dart format width=80
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_import, prefer_relative_imports, directives_ordering

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AppGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flex_ui/widgets/app_bar/app_bar.dart' as _i2;
import 'package:flex_ui/widgets/banner/banner.dart' as _i4;
import 'package:flex_ui/widgets/buttons/button.dart' as _i5;
import 'package:flex_ui/widgets/cards/productCard/product_card.dart' as _i10;
import 'package:flex_ui/widgets/cards/productCard/shared/badge.dart' as _i3;
import 'package:flex_ui/widgets/cards/productCard/shared/price.dart' as _i8;
import 'package:flex_ui/widgets/cards/productCard/shared/price_discount.dart'
    as _i9;
import 'package:flex_ui/widgets/carousel/carousel.dart' as _i6;
import 'package:flex_ui/widgets/connectivity/connectivity_indicator.dart'
    as _i7;
import 'package:flex_ui/widgets/gallery/gallery.dart' as _i13;
import 'package:flex_ui/widgets/quantity_selector/quantity_selector.dart'
    as _i11;
import 'package:flex_ui/widgets/search/search.dart' as _i12;
import 'package:widgetbook/widgetbook.dart' as _i1;

final directories = <_i1.WidgetbookNode>[
  _i1.WidgetbookCategory(
    name: 'Components',
    children: [
      _i1.WidgetbookComponent(
        name: 'FlexAppBar',
        useCases: [
          _i1.WidgetbookUseCase(
            name: '1. Default',
            builder: _i2.defaultFlexAppBar,
          ),
          _i1.WidgetbookUseCase(
            name: '2. With trailing widget',
            builder: _i2.trailingWidgetFlexAppBar,
          ),
          _i1.WidgetbookUseCase(
            name: '3. With both',
            builder: _i2.leadingAndTrailingWidgetFlexAppBar,
          ),
          _i1.WidgetbookUseCase(
            name: '4. With trailingWidgets list',
            builder: _i2.trailingWidgetsListFlexAppBar,
          ),
          _i1.WidgetbookUseCase(
            name: '5. Custom backgroundColor',
            builder: _i2.backgroundColorFlexAppBar,
          ),
        ],
      ),
      _i1.WidgetbookComponent(
        name: 'FlexBadge',
        useCases: [
          _i1.WidgetbookUseCase(
            name: 'Default',
            builder: _i3.defaultBadge,
          ),
          _i1.WidgetbookUseCase(
            name: 'Example Parameter Overrides',
            builder: _i3.saleBadge,
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
      _i1.WidgetbookComponent(
        name: 'FlexButton',
        useCases: [
          _i1.WidgetbookUseCase(
            name: 'Default',
            builder: _i5.defaultButton,
          ),
          _i1.WidgetbookUseCase(
            name: 'Disabled',
            builder: _i5.disabledButton,
          ),
          _i1.WidgetbookUseCase(
            name: 'Loading',
            builder: _i5.loadingButton,
          ),
          _i1.WidgetbookUseCase(
            name: 'Small & Styled',
            builder: _i5.smallButton,
          ),
        ],
      ),
      _i1.WidgetbookLeafComponent(
        name: 'FlexCarousel',
        useCase: _i1.WidgetbookUseCase(
          name: 'Central banner',
          builder: _i6.centralBannerCarousel,
        ),
      ),
      _i1.WidgetbookComponent(
        name: 'FlexConnectivityIndicator',
        useCases: [
          _i1.WidgetbookUseCase(
            name: 'Connected',
            builder: _i7.connectedIndicator,
          ),
          _i1.WidgetbookUseCase(
            name: 'Custom Colors',
            builder: _i7.customColorIndicator,
          ),
          _i1.WidgetbookUseCase(
            name: 'Disconnected',
            builder: _i7.disconnectedIndicator,
          ),
          _i1.WidgetbookUseCase(
            name: 'Unknown',
            builder: _i7.unknownIndicator,
          ),
        ],
      ),
      _i1.WidgetbookComponent(
        name: 'FlexPrice',
        useCases: [
          _i1.WidgetbookUseCase(
            name: 'Default',
            builder: _i8.flexPrice,
          ),
          _i1.WidgetbookUseCase(
            name: 'Strikethrough',
            builder: _i8.flexPriceSale,
          ),
          _i1.WidgetbookUseCase(
            name: 'Style Override (No formatter)',
            builder: _i8.priceStyleOverride,
          ),
        ],
      ),
      _i1.WidgetbookComponent(
        name: 'FlexPriceDiscount',
        useCases: [
          _i1.WidgetbookUseCase(
            name: 'Default',
            builder: _i9.defaultPriceDiscount,
          ),
          _i1.WidgetbookUseCase(
            name: 'Default - No Sale Price',
            builder: _i9.fallbackPriceDiscount,
          ),
        ],
      ),
      _i1.WidgetbookComponent(
        name: 'FlexProductCard',
        useCases: [
          _i1.WidgetbookUseCase(
            name: 'Grid',
            builder: _i10.gridFlexProductCard,
          ),
          _i1.WidgetbookUseCase(
            name: 'Standard',
            builder: _i10.standardFlexProductCard,
          ),
        ],
      ),
      _i1.WidgetbookLeafComponent(
        name: 'FlexQuantitySelector',
        useCase: _i1.WidgetbookUseCase(
          name: 'Default',
          builder: _i11.defaultQuantitySelector,
        ),
      ),
      _i1.WidgetbookLeafComponent(
        name: 'FlexSearch',
        useCase: _i1.WidgetbookUseCase(
          name: 'Default',
          builder: _i12.flexSearchStandard,
        ),
      ),
    ],
  ),
  _i1.WidgetbookFolder(
    name: 'widgets',
    children: [
      _i1.WidgetbookFolder(
        name: 'gallery',
        children: [
          _i1.WidgetbookLeafComponent(
            name: 'FlexGallery',
            useCase: _i1.WidgetbookUseCase(
              name: 'Default',
              builder: _i13.defaultCarousel,
            ),
          )
        ],
      )
    ],
  ),
];
