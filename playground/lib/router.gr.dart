// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

/// generated route for
/// [AddToCartPage]
class AddToCartRoute extends PageRouteInfo<void> {
  const AddToCartRoute({List<PageRouteInfo>? children})
      : super(
          AddToCartRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddToCartRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const AddToCartPage();
    },
  );
}

/// generated route for
/// [BannerPage]
class BannerRoute extends PageRouteInfo<BannerRouteArgs> {
  BannerRoute({
    Key? key,
    String? variant,
    List<PageRouteInfo>? children,
  }) : super(
          BannerRoute.name,
          args: BannerRouteArgs(
            key: key,
            variant: variant,
          ),
          rawQueryParams: {'variant': variant},
          initialChildren: children,
        );

  static const String name = 'BannerRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final queryParams = data.queryParams;
      final args = data.argsAs<BannerRouteArgs>(
          orElse: () =>
              BannerRouteArgs(variant: queryParams.optString('variant')));
      return BannerPage(
        key: args.key,
        variant: args.variant,
      );
    },
  );
}

class BannerRouteArgs {
  const BannerRouteArgs({
    this.key,
    this.variant,
  });

  final Key? key;

  final String? variant;

  @override
  String toString() {
    return 'BannerRouteArgs{key: $key, variant: $variant}';
  }
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const HomePage();
    },
  );
}

/// generated route for
/// [ImagePage]
class ImageRoute extends PageRouteInfo<void> {
  const ImageRoute({List<PageRouteInfo>? children})
      : super(
          ImageRoute.name,
          initialChildren: children,
        );

  static const String name = 'ImageRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ImagePage();
    },
  );
}
