import 'package:auto_route/auto_route.dart';
import 'package:playground/pages/badge.dart';
import 'package:playground/pages/banner.dart';
import 'package:playground/pages/button.dart';
import 'package:playground/pages/carousel.dart';
import 'package:playground/pages/gallery.dart';
import 'package:playground/pages/home.dart';
import 'package:playground/pages/image.dart';
import 'package:playground/pages/price.dart';
import 'package:playground/pages/quantity_selector.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: HomeRoute.page, path: '/'),
        AutoRoute(page: ButtonRoute.page, path: '/button'),
        AutoRoute(page: BannerMinimalRoute.page, path: '/banner-minimal'),
        AutoRoute(page: BannerFullRoute.page, path: '/banner-full'),
        AutoRoute(page: CarouselRoute.page, path: '/carousel'),
        AutoRoute(page: GalleryRoute.page, path: '/gallery'),
        AutoRoute(page: ImageRoute.page, path: '/image'),
        AutoRoute(page: PriceRoute.page, path: '/price'),
        AutoRoute(page: QuantitySelectorRoute.page, path: '/quantity-selector'),
        AutoRoute(page: BadgeRoute.page, path: '/badge'),
      ];
}
