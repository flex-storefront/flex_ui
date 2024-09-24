import 'package:auto_route/auto_route.dart';
import 'package:playground/pages/add_to_cart.dart';
import 'package:playground/pages/home.dart';
import 'package:playground/pages/image.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: HomeRoute.page, path: '/'),
        AutoRoute(page: AddToCartRoute.page, path: '/add-to-cart'),
        AutoRoute(page: ImageRoute.page, path: '/image'),
      ];
}
