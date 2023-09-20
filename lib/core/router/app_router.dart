import 'package:auto_route/auto_route.dart';
import 'package:test/screen/view/home/home_page.dart';
import 'package:test/screen/view/onboaeding/onboarding_page.dart';
import 'package:test/screen/view/splash/splash_page.dart';

part 'app_router.gr.dart';

final router = AppRouter();

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, initial: true),
        AutoRoute(page: HomeRoute.page),
      ];
}
