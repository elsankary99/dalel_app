import 'package:auto_route/auto_route.dart';
import 'package:test/screen/view/Home/home_page.dart';
import 'package:test/screen/view/authentication/Login/login_page.dart';
import 'package:test/screen/view/OnBoarding/onboarding_page.dart';
import 'package:test/screen/view/authentication/SignUp/signup_page.dart';
import 'package:test/screen/view/authentication/forget_Password/forget_password_page.dart';
import 'package:test/screen/view/splash/splash_page.dart';

part 'app_router.gr.dart';

final router = AppRouter();

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        //? Splash
        AutoRoute(page: SplashRoute.page, initial: true),
        //? On Boarding
        AutoRoute(page: OnBoardingRoute.page),
        //? Authentication
        AutoRoute(page: LoginRoute.page),
        AutoRoute(page: SignUpRoute.page),
        AutoRoute(page: ForgetPasswordRoute.page),
        //? Home
        AutoRoute(page: HomeRoute.page),
      ];
}
